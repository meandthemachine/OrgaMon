//
// United Replikator
//
unit Replikation;

interface

uses
  Windows, Messages, SysUtils,
  Variants, Classes, Graphics,
  Controls, Forms, Dialogs,
  StdCtrls, IB_Controls, Grids,
  IB_Grid, IB_UpdateBar, IB_NavigationBar,
  IB_Components, ExtCtrls, hebuData,
  IB_Session, ComCtrls, IB_Process,
  IB_Script, JvGIF;

type
  TFormReplikation = class(TForm)
    Button3: TButton;
    Button1: TButton;
    IB_Query1: TIB_Query;
    IB_DataSource1: TIB_DataSource;
    IB_Grid1: TIB_Grid;
    IB_Memo1: TIB_Memo;
    Label1: TLabel;
    ProgressBar1: TProgressBar;
    Memo1: TMemo;
    Label2: TLabel;
    Edit1: TEdit;
    Label3: TLabel;
    Image3: TImage;
    IB_NavigationBar1: TIB_NavigationBar;
    IB_UpdateBar1: TIB_UpdateBar;
    procedure FormActivate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Image3Click(Sender: TObject);
  private
    { Private-Deklarationen }
    ErrorCount: integer;
    Transactions: integer;
    BreakRequest: boolean;
    procedure log(s: string);
    procedure BeginTransaction;
    procedure EndTransaction;
    procedure ExecuteOne;
  public
    { Public-Deklarationen }
    procedure Execute;
  end;

var
  FormReplikation: TFormReplikation;

implementation

uses
  anfix32, globals, IniFiles,
  BaseUpdate, Einstellungen, CareTakerClient;

{$R *.dfm}

procedure TFormReplikation.FormActivate(Sender: TObject);
begin
  if not (IB_Query1.Active) then
    IB_Query1.Open;
end;

procedure TFormReplikation.Image3Click(Sender: TObject);
begin
  open(cHelpURL + 'Replikation');
end;

procedure TFormReplikation.Button1Click(Sender: TObject);
begin
  if (transactions = 0) then
    ExecuteOne
  else
    BreakRequest := true;
end;

procedure TFormReplikation.Execute;
begin
  show;
  Button3Click(self);
  close;
end;

procedure TFormReplikation.Button3Click(Sender: TObject);
begin
  BeginHourGlass;
  BeginTransaction;
  with IB_Query1 do
  begin
    first;
    while not (eof) do
    begin
      application.processmessages;
      if (FieldByName('INAKTIV').AsString <> cC_False) then
        ExecuteOne;
      if BreakRequest then
        break;
      next;
    end;
  end;
  EndTransaction;
  EndHourGlass;
end;

procedure TFormReplikation.log(s: string);
begin
  memo1.lines.add(s);
  if (pos(cERRORText, s) = 1) then
  begin
    inc(ErrorCount);
    CareTakerLog(s);
  end;
  if (ErrorCount > 0) then
    Label2.caption := inttostr(ErrorCount) + ' Fehler bisher!';
end;

procedure TFormReplikation.ExecuteOne;

const
  cSectionReplication = 'Replikation';

var
  ParamBlock: TStringList;
  rCONNECTION: TIB_Connection;
  rTRANSACTION: TIB_Transaction;
  rINI: TMemIniFile;
  ActionStr: string;

  function OpenConnection: boolean;
  begin
    try
      rCONNECTION.Connect;
      result := true;
    except
      result := false;
    end;
  end;

  function CheckCompatibility: boolean;
  var
    tREVISION: TIB_Cursor;
    RemoteRev: single;
  begin
    tREVISION := TIB_Cursor.Create(self);
    with tREVISION do
    begin
      IB_Connection := rCONNECTION;
      sql.add('SELECT RID FROM REVISION ORDER BY RID DESCENDING');
      open;
      ApiFirst;
      RemoteRev := FieldByName('RID').AsInteger / 1000;
      close;
    end;
    tREVISION.free;
    result := round(RemoteRev * 1000.0) = round(FormBaseUpdate.BaseRev * 1000.0);
  end;

  procedure Replicate;
  var
    cQUELLE: TIB_Cursor;
    qZIEL: TIB_Query;
    sINDEX: TIB_Script;
    excludeFields: TStringList;
    includeFields: TStringList;
    insertFields: TstringList;
    deactiveIndexes: TStringList;
    Umfang: string;
    StartTime: dword;
    RecN: integer;
    TableName: string;
    AllFields: string;
    n: integer;
  begin
    BeginHourGlass;
    insertFields := TStringList.create;
    excludeFields := TStringList.create;
    includeFields := TStringList.create;
    deactiveIndexes := TStringList.Create;
    sINDEX := TIB_Script.create(self);

    // Indizes deaktivieren!
    AllFields := AnsiUpperCase(noblank(rIni.ReadString(cSectionReplication, 'Indizes', '')));
    while (AllFields <> '') do
      deactiveIndexes.add(nextp(AllFields, ','));

    if (deactiveIndexes.count > 0) then
    begin
      with sINDEX do
      begin
        for n := 0 to pred(deactiveIndexes.count) do
        begin
          sql.clear;
          sql.add('alter index ' + deactiveIndexes[n] + ' inactive;');
          execute;
        end;
      end;
    end;

    // Bestimmen der Felder, die nur im falle des insert hinzugenommen werden sollen
    AllFields := AnsiUpperCase('RID,' + noblank(rIni.ReadString(cSectionReplication, 'NurBeiInsert', '')));
    while (AllFields <> '') do
      insertFields.add(nextp(AllFields, ','));

    // Bestmmen der Felder, die ausgelassen werden sollen
    AllFields := AnsiUpperCase(noblank(rIni.ReadString(cSectionReplication, 'OhneDieFelder', '')));
    while (AllFields <> '') do
      excludeFields.add(nextp(AllFields, ','));

    TableName := rINI.ReadString(cSectionReplication, 'Tabelle', '');
    StartTime := 0;
    RecN := 0;

    qZIEL := TIB_Query.Create(self);
    with qZIEL do
    begin
      sql.add('SELECT * FROM ' + TableName);
      sql.add('WHERE RID=:CROSSREF');
      sql.Add('FOR UPDATE');
    end;

    cQUELLE := TIB_Cursor.Create(self);
    with cQUELLE do
    begin
      IB_Connection := rCONNECTION;
      sql.add('SELECT * FROM ' + TableName);
      umfang := rIni.ReadString(cSectionReplication, 'Umfang', '');
      if (umfang <> '') then
      begin
        sql.add('where');
        sql.add(umfang);
      end;
      open;
      Progressbar1.Max := RecordCount;
      APIFirst;
      if not (eof) then
      begin

        // prepare the fieldname list
        for n := 0 to pred(FieldCount) do
          if excludefields.indexof(AnsiUpperCase(Fields[n].fieldName)) = -1 then
            includeFields.add(Fields[n].fieldName);

      end;

      while not (eof) do
      begin
        QZiel.ParamByName('CROSSREF').Assign(FieldByName('RID'));
        if not (QZiel.Active) then
          QZiel.open;
        try
          if not (QZiel.Eof) then
          begin
            ActionStr := 'e';
            QZiel.edit;
            for n := 0 to pred(IncludeFields.count) do
              QZiel.FieldByName(IncludeFields[n]).assign(FieldByName(IncludeFields[n]));
            QZiel.Post;
          end else
          begin
            ActionStr := 'i';
            QZiel.insert;
            for n := 0 to pred(InsertFields.count) do
              QZiel.FieldByName(InsertFields[n]).assign(FieldByName(InsertFields[n]));
            for n := 0 to pred(IncludeFields.count) do
              QZiel.FieldByName(IncludeFields[n]).assign(FieldByName(IncludeFields[n]));
            QZiel.Post;
          end;
          inc(RecN);
        except
          on e: exception do
          begin
            Log(cERRORText + ' ' +
              ActionStr +
              '[' + FieldByName('RID').AsString + ']' +
              e.message);
            QZiel.cancel;
            QZiel.close;
          end;
        end;
        if BreakRequest then
          break;
        APINext;
        if frequently(StartTime, 333) or eof then
        begin
          application.processmessages;
          progressbar1.position := RecN;
        end;
      end;
      close;
    end;

    if (deactiveIndexes.count > 0) then
    begin
      with sINDEX do
      begin
        for n := 0 to pred(deactiveIndexes.count) do
        begin
          sql.clear;
          sql.add('alter index ' + deactiveIndexes[n] + ' active;');
          try
            execute;
          except
         // kann passieren!
          end;
        end;
      end;
    end;

    sINDEX.free;
    qZIEL.Close;
    qZIEL.Free;
    cQUELLE.Close;
    cQUELLE.Free;
    excludeFields.free;
    includeFields.free;
    insertFields.Free;
    deactiveIndexes.Free;
    progressbar1.position := 0;
    EndHourGlass;
  end;

begin
  BeginTransaction;

  // Parameter �bernehmen in einen "iniFile"
  ParamBlock := TStringList.create;
  IB_Query1.FieldByName('SCRIPT').AssignTo(ParamBlock);

  ParamBlock.Insert(0, '[' + cSectionReplication + ']');

  rINI := TMemIniFile.create('');
  rINI.SetStrings(ParamBlock);
  ParamBlock.free;

  // Verbindung aufbauen (connect)
  rTRANSACTION := TIB_Transaction.Create(self);
  with rTRANSACTION do
  begin
    Isolation := tiCommitted;
    AutoCommit := true;
    ReadOnly := True;
  end;

  rCONNECTION := TIB_Connection.Create(self);
  with rCONNECTION do
  begin
    DefaultTransaction := rTRANSACTION;
    LoginDBReadOnly := true;
    Protocol := cpTCP_IP;
    if (edit1.text = '') then
      DataBaseName := rINI.ReadString(cSectionReplication, 'DataBaseName', '')
    else
      DataBaseName := edit1.text;

    UserName := 'SYSDBA';
    Password := FormEinstellungen.deCrypt(iDataBase_SYSDBA_pwd);
  end;

  with rTRANSACTION do
  begin
    IB_Connection := rCONNECTION;
  end;

  while true do
  begin

    // Verbinung
    if not (OPenConnection) then
    begin
      Log(cERRORText + ' ' + 'Quelldatenbank konnte nicht ge�ffnet werden!');
      break;
    end;

    // Datenbank Kompatibilit�t sicherstellen
    if not (CheckCompatibility) then
    begin
      Log(cERRORText + ' ' + 'Die in DataBaseName= angegebene Datenbank' + #13 +
        'muss upgedatet werden. Bitte starten Sie ' + cApplicationName + #13 +
        'mit dieser Datenbank, damit die neueste Rev.' + #13 +
        'eingetragen werden kann!');
      break;
    end;

    // Replikationslauf an sich
    Replicate;
    break;

  end;


  //
  rINI.free;

  rTRANSACTION.free;
  rConnection.Close;
  rCONNECTION.free;

  EndTransaction;

end;

procedure TFormReplikation.BeginTransaction;
begin
  if (Transactions = 0) then
  begin
    memo1.lines.clear;
    ErrorCount := 0;
    label2.caption := 'Ausf�hrungsfehler';
    button3.enabled := false;
    button1.caption := 'Ab&brechen';
  end;
  inc(Transactions);
end;

procedure TFormReplikation.EndTransaction;
begin
  dec(Transactions);
  if (Transactions = 0) then
  begin
    button1.caption := 'Ausf�hren';
    button3.enabled := true;
    BreakRequest := false;
  end;
end;

end.

