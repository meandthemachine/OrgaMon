//
//  11'2003: Approoved Backup
//  12'2003: Restore im DatenbankBackupBereich
//  05'2004: if Diagnostic is checked <-> DONT PROOVE!
//
//
// unified Backup (alle Projekte)
//
//  a) Read Generators
//  b) Backup
//  c) Restore
//  d) connect and read Generators
//  e) Compare Generators !PROOF!
//  f) delete recently restored DataBase
//  g) move and compress the Backup File
//
//
// Generation Switch
//
//  a) shut down Database
//  b) "small" unified Backup
//  c) online Database
//
// todo
// ====
//
// * fbak-Komprimierung sollte aus eigener Kraft mit dem ZIP Algorithmus erfolgen
//   es k�nnen ja ev. neue ZIP Komprimierungsverfahren eingesetzt werden.
// * backup/restore/set prductiv (im Prizip ein Reorg/Generationswechsel) per Knopfdruck
//   mit Modifikation der OrgaMon.ini
// * Innosetup Integration: Das "grosse" Backup k�nnte eine Setup-Routine sein:
//   mit dem letzen Backup in der ".\Datensicherung"
//   der Restore sollte automatisch nach einem Setup erfolgen
//   in das Setup sollten die Punkte
// * mixed up Umgebung: die Datenbank sichern! Jedoch mit dem lokalen firebird den
//   restore und die Pr�fung machen!
//
//    [x] lokales Anwendungs-Update
//    [x] Datenbank-Client Installation
//    [x] Netzwerk Verzeichnis erstellen
//    (*) Remote Datenbank-Restore
//    ( ) Lokaler Datenbank-Restore
//
unit Backup;

interface

uses
  Windows, Messages, SysUtils,
  Classes, Graphics, Controls,
  Forms, Dialogs, StdCtrls,
  ComCtrls,

  // IBX
  IBServices, IBXConst,

  // Crypt
  DCPcrypt2, DCPblockciphers, DCPdes,

  // VCLZIP
  VCLUnZip, VCLZip,

  // IBObjects
  IB_Components, IdBaseComponent, IdComponent,

  // Indy
  IdGlobal, IdTCPConnection, IdTCPClient, IdFTP, JvGIF, ExtCtrls;

type
  TFormBackUp = class(TForm)
    IBBackupService1: TIBBackupService;
    DCP_des1: TDCP_des;
    VCLZip1: TVCLZip;
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Button1: TButton;
    Memo1: TMemo;
    Button2: TButton;
    ProgressBar1: TProgressBar;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    IBServerProperties1: TIBServerProperties;
    IBRestoreService1: TIBRestoreService;
    CheckBox1: TCheckBox;
    IdFTP1: TIdFTP;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    Image2: TImage;
    procedure Button1Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure VCLZip1TotalPercentDone(Sender: TObject; Percent: Integer);
    procedure Button2Click(Sender: TObject);
    procedure IdFTP1WorkEnd(Sender: TObject; AWorkMode: TWorkMode);
    procedure IdFTP1WorkBegin(Sender: TObject; AWorkMode: TWorkMode;
      const AWorkCountMax: Integer);
    procedure IdFTP1Work(Sender: TObject; AWorkMode: TWorkMode;
      const AWorkCount: Integer);
    procedure Image2Click(Sender: TObject);
  private
    { Private-Deklarationen }
    Initialized: boolean;
    FtpStartTime: dword;
    StartTime: dword;
    procedure SetUpService(IBService: TIBControlService);
    procedure Log(s: string);
  public
    { Public-Deklarationen }
    IBC: TIB_Connection;

    function BackUp(BackupGID: integer): boolean;
    function Zip(BackupGID: integer): boolean;
    function GENID: integer;
    procedure BeforeConnect(Sender: TIB_Connection);
    procedure Restore(BackupGID: integer);

  end;

var
  FormBackUp: TFormBackUp;

implementation

uses
  globals, anfix32, splash,
  IB_Session, Einstellungen,
  CareTakerClient, math;

{$R *.DFM}

function TFormBackUp.BackUp(BackupGID: integer): boolean;
var
  fbakFName: string;
  gbkFName: string;
  ResultFName: string;
  FtpDestFName: string;
  CommandLine: string;
  ErrorCount: integer;
  sGENERATORS: TStringList;

  cGENERATORS: TIB_Cursor;
  rCONNECTION: TIB_Connection;
  rTRANSACTION: TIB_Transaction;
  GenName: string;
  GenValIst: int64;
  GenValSoll: int64;

  procedure ReadGenerators;
  begin
    sGENERATORS := TStringList.create;

    try
      Log('#############################');
      Log('# I Q - E V A L U A T I O N #'); // Information Quantity/Quality
      Log('#############################');
      cGENERATORS := TIB_Cursor.create(self);
      with cGENERATORS do
      begin
        sql.add('select RDB$GENERATOR_NAME from RDB$GENERATORS where RDB$SYSTEM_FLAG IS NULL');
        ApiFirst;
        while not (eof) do
        begin
          GenName := Fields[0].AsString;
          sGENERATORS.add(GenName + '=' + inttostr(GEN_ID(GenName, 0)));
          Log(sGENERATORS[pred(sGENERATORS.count)]);
          ApiNext;
        end;
      end;
      cGENERATORS.free;
    except
      on E: Exception do
      begin
        inc(ErrorCount);
        Log(cERRORText + ' IQ-Evaluation Exception: ' + E.Message);
      end;
    end;
  end;

  procedure DoBackup;
  begin
    with IBBackupService1 do
    begin

      label2.caption := ServerName;
      try
        DatabaseName := i_c_DataBaseFName;
        gbkFName := 'Sicherung_' + inttostrN(BackUpGID, 8) + '.fbak';
        if (iDataBaseBackUpDir = '') then
        begin
          fbakFName := i_c_DataBasePath + gbkFName;
        end else
        begin
          fbakFName := iDataBaseBackUpDir + gbkFName;
        end;

        label1.caption := fbakFName;
        label17.caption := iTranslatePath + gbkFName;
        BackupFile.clear;
        BackupFile.Add(fbakFName);
        application.processmessages;
        Log('###############');
        Log('# B A C K U P #');
        Log('###############');
        Log('l�uft ...');
        Active := true;
        ServiceStart;
        repeat
          try
            while not Eof do
              Log(GetNextLine);
          except
            inc(ErrorCount);
            Log('ERROR: Backup Exception!');
          end;
        until eof;

      finally
        Active := False;
      end;

    end;
  end;

  procedure DoRestore;
  begin
    with IBRestoreService1 do
    begin

      PageSize := 16384;
      try
        DatabaseName.clear;
        DatabaseName.add(fbakFName + '.fdb');
        BackupFile.clear;
        BackupFile.add(fbakFName);
        application.processmessages;

        Log('#################');
        Log('# R E S T O R E #');
        Log('#################');
        Log('l�uft ...');
        Active := true;
        ServiceStart;
        repeat
          try
            while not Eof do
              Log(GetNextLine);
          except
            inc(ErrorCount);
            Log('ERROR: Restore Exception!');
          end;
        until eof;
      finally
        Active := False;
      end;
    end;
  end;

  procedure DoCheckGenerators;
  begin
    Log('#######################');
    Log('# I Q - C O M P A R E #'); // Information Quantity/Quality
    Log('#######################');

    try

            //
      rTRANSACTION := TIB_Transaction.Create(self);
      with rTRANSACTION do
      begin
        Isolation := tiCommitted;
        AutoCommit := true;
        ReadOnly := True;
      end;

            //
      rCONNECTION := TIB_Connection.Create(self);
      with rCONNECTION do
      begin
        DefaultTransaction := rTRANSACTION;
        LoginDBReadOnly := true;
        Protocol := cpTCP_IP;
        if (iServerName = '') then
          DataBaseName := fbakFName + '.fdb'
        else
          DataBaseName := iServerName + ':' + fbakFName + '.fdb';
        UserName := 'SYSDBA';
        Password := FormEinstellungen.SysDBAPassword;
      end;

      with rTRANSACTION do
      begin
        IB_Connection := rCONNECTION;
      end;

      rConnection.connect;

            //
      cGENERATORS := TIB_Cursor.create(self);
      with cGENERATORS do
      begin
        IB_connection := rConnection;
        sql.add('select RDB$GENERATOR_NAME from RDB$GENERATORS where RDB$SYSTEM_FLAG IS NULL');
        ApiFirst;
        while not (eof) do
        begin
          GenName := Fields[0].AsString;
          GenValIst := GEN_ID(GenName, 0);
          GenValSoll := strtoint64def(sGENERATORS.values[GenName], 0);
          if (GenValIst >= GenValSoll) then
          begin
            Log(GenName + ' OK');
          end else
          begin
            inc(ErrorCount);
            Log('ERROR: GENERATOR ' + GenName + ': Ist=' + inttostr(GenValIst) + ' Soll=' + inttostr(GenValSoll));
          end;
          ApiNext;
        end;
      end;
      sGENERATORS.free;
      cGENERATORS.free;
      rConnection.disconnect;
      delay(500);
      rConnection.free;
      rTransAction.free;
    except
      on E: Exception do
      begin
        inc(ErrorCount);
        Log(cERRORText + ' IQ-Compare Exception: ' + E.Message);
      end;
    end;

  end;

  procedure DoCompress;
  begin
    if (iBackupPacker <> '') then
    begin
      repeat

          //
        CommandLine := iBackupPacker;
        ersetze('%fbak%', DatensicherungPath + gbkFName, CommandLine);
        Log(CommandLine + ' ...');
        exec(CommandLine);

          //
        ResultFName := iBackupPackerArchivName;
        ersetze('%fbak%', DatensicherungPath + gbkFName, ResultFName);
        if not (FileExists(ResultFName)) then
        begin
          inc(ErrorCount);
          Log('ERROR: Datei ' + ResultFName + ' nicht gefunden!');
          break;
        end;

          // Alter GBAK l�schen!
        FileDelete(DatensicherungPath + gbkFName);
        if FileExists(DatensicherungPath + gbkFName) then
        begin
          inc(ErrorCount);
          Log('ERROR: Datei ' + DatensicherungPath + gbkFName + ' nicht l�schbar!');
        end;
      until true;
    end;
  end;

  procedure DoUpload;
  begin
    with IdFTP1 do
    begin
      try
        FtpStartTime := 0;
        connect;

        // atomic.begin
        FtpDestFName := ExtractFileName(ResultFName);
        if (Size(FtpDestFName + '.$$$') >= 0) then
          Delete(FtpDestFName + '.$$$');
        Put(ResultFName, FtpDestFName + '.$$$');
        if (Size(FtpDestFName) >= 0) then
          Delete(FtpDestFName);
        Rename(FtpDestFName + '.$$$', FtpDestFName);
        // atomic.end

        Quit;
      except
        Log('ERROR: Ftp Upload Error!');
        inc(ErrorCount);
      end;
    end;
  end;

begin

  if (BackupGID >= 0) then
  begin
    if assigned(IBC) then
    begin

      StartTime := 0;
      ErrorCount := 0;
      caption := 'Datensicherung - ' + inttostr(BackupGID);
      show;

      repeat

        memo1.lines.clear;
        BeginHourGlass;

        //
        CheckCreateDir(DatensicherungPath);
        ReadGenerators;
        if (ErrorCount > 0) then
          break;

        // ShowMessage(HugeSingleLine(sGENERATORS));
        SetUpService(IBBackupService1);
        SetUpService(IBRestoreService1);

        // BACKUP
        DoBackup;
        if (ErrorCount > 0) then
          break;

        // ist das Backup angekommen? Pr�fen �ber die Windows-Welt
        if not (FileExists(iTranslatePath + gbkFName)) then
        begin
          inc(ErrorCount);
          Log('ERROR: Datei ' + iTranslatePath + gbkFName + ' fehlt. FreigabePfad= definieren!');
        end;

        if (ErrorCount > 0) then
          break;

        if not (CheckBox1.checked) then
        begin

          // restore to proof validty
          DoRestore;
          if ErrorCount > 0 then
            break;

          if not (FileExists(iTranslatePath + gbkFName + '.fdb')) then
          begin
            inc(ErrorCount);
            Log('ERROR: Datei ' + iTranslatePath + gbkFName + '.fdb' + ' fehlt!');
          end;

          if (ErrorCount > 0) then
            break;
          DoCheckGenerators;
          if (ErrorCount > 0) then
            break;

          // Datenbankdatei aus Sicht der Backup-Routine l�schen
          FileDelete(iTranslatePath + gbkFName + '.fdb');
          if FileExists(iTranslatePath + gbkFName + '.fdb') then
          begin
            inc(ErrorCount);
            Log('ERROR: Datei ' + iTranslatePath + gbkFName + '.fdb' + ' nicht l�schbar!');
          end;

        end;

        ResultFName := DatensicherungPath + gbkFName;

        // a) in den Windows Bereich kopieren (falls es nicht schon dort ist!)
        if (iTranslatePath <> DatensicherungPath) then
        begin
          Log('mv ' + iTranslatePath + gbkFName + ' ' + DatensicherungPath + gbkFName + ' ...');
          FileMove(iTranslatePath + gbkFName, DatensicherungPath + gbkFName);
        end;

        // Existenz der Ergebnisdatei pr�fen!
        if not (FileExists(DatensicherungPath + gbkFName)) then
        begin
          inc(ErrorCount);
          Log('ERROR: Datei ' + DatensicherungPath + gbkFName + ' nicht gefunden!');
        end;

        // b) im Windows Bereich komprimieren!
        DoCompress;

      until true;

      // FTP Upload?
      if CheckBox1.checked and (ErrorCount = 0) then
      begin
        Log('FTP Upload ...');

        CheckBox1.checked := false;
        DoUpLoad;
      end;

      EndHourGlass;

      //
      result := (ErrorCount = 0);
      if (ErrorCount = 0) then
      begin
        Log('Erfolgreich beendet');
        close;
      end;

    end;
  end;
end;

procedure TFormBackUp.BeforeConnect(Sender: TIB_Connection);
var
  _iDataBaseName: string;
  n, k, l: integer;
begin

  if (iDataBaseName = '') then
  begin
    ShowMessage('Kein Datenbankname angegeben!');
    halt;
  end;

  _iDataBaseName := iDataBaseName;
  if iServerName <> '' then
    i_c_DataBaseFName := copy(_iDataBaseName, succ(pos(':', _iDataBaseName)), MaxInt)
  else
    i_c_DataBaseFName := iDataBaseName;


  i_c_DataBasePath := i_c_DataBaseFName;
  l := revpos('.', i_c_DataBasePath);
  k := max(revpos('\', i_c_DataBasePath), revpos('/', i_c_DataBasePath));
  if (k > 0) then
  begin
    i_c_DataBasePath := copy(i_c_DataBaseFName, 1, k);
    MandantName := copy(i_c_DataBaseFName, succ(k), pred(l - k));
    MachineIDChanged;
  end;

  Sender.DataBaseName := _iDataBaseName;
  if (iServerName = '') then
  begin
    Sender.Server := '';
    Sender.protocol := cplocal;
  end else
  begin
    Sender.protocol := cpTCP_IP;
  end;

end;

procedure TFormBackUp.Button1Click(Sender: TObject);
begin
  BackUp(GENID);
end;

procedure TFormBackUp.FormActivate(Sender: TObject);
var
  TheModuleName: array[0..1023] of char;
begin
  if not (Initialized) then
  begin
    Initialized := true;
    BeginHourGlass;

    // aus der Ini
    label2.caption := iServerName;
    label6.Caption := i_c_DataBaseFName;

    // welcher Client wird verwendet
    GetModuleFileName(FGDS_Handle, TheModuleName, sizeof(TheModuleName));
    label12.Caption := TheModuleName;
    label12.Caption := label12.Caption + ' ' + FileVersion(TheModuleName);
    label14.caption := RevToStr(IBX_Version);
    label20.caption := gsIdVersion;
    label21.caption := IBC.Version;

    // welcher Server wird verwendet
    with IBServerProperties1 do
    begin
      SysErrorMessage(10060);
      Params.clear;
      params.add('user_name=SYSDBA');
      if (iDataBase_SYSDBA_pwd = '') then
        Params.Add('password=masterkey')
      else
        Params.Add('password=' + FormEinstellungen.deCrypt(iDataBase_SYSDBA_pwd));
      ServerName := iServerName;
      if (iServerName <> '') then
        Protocol := TCP
      else
        Protocol := local;
      try
        Attach;
        Fetch;
        label13.caption := VersionInfo.ServerImplementation + ' ' + VersionInfo.ServerVersion;
        Detach;
      except
        on E: Exception do label13.caption := E.Message;
      end;
    end;

    if (iDataBaseBackUpDir = '') then
    begin
      label1.caption := i_c_DataBasePath;
      if (iTranslatePath = '') then
        iTranslatePath := i_c_DataBasePath;
    end else
    begin
      label1.caption := iDataBaseBackUpDir;
      if (iTranslatePath = '') then
        iTranslatePath := DatensicherungPath;
    end;

    label17.caption := iTranslatePath;
    if (iSicherungsPfad = '') then
      iSicherungsPfad := MyProgramPath + '..\';

    // Sicherungs-Hauptname ermitteln
    if (iSicherungsPreFix = '') then
      iSicherungsPreFix := nextp(MyProgramPath, '\', CharCount('\', MyProgramPath) - 1) + '_';

    label8.caption := MyProgramPath + '*';
    label10.caption := iSicherungsPfad + iSicherungsPreFix + 'NNNNNNNN.zip';

    EndHourGlass;
  end;
  button1.Enabled := assigned(IBC);
end;

function TFormBackUp.GENID: integer;
begin
  if assigned(IBC) then
    result := IBC.Gen_ID('GEN_BACKUP', 1)
  else
    result := -1;
end;

function TFormBackUp.Zip(BackupGID: integer): boolean;
begin
  if BackupGID >= 0 then
  begin
    show;
    BeginHourGlass;

    FileDelete(iSicherungsPfad + iSicherungsPreFix + '*.zip', 5, 3);

    // Neue Sicherungen anlegen
    try
      with vclzip1 do
      begin
        Zipname := iSicherungsPfad + iSicherungsPreFix + inttostrN(BackupGID, 8) + '.zip';
        BufferedStreamSize := 8 * 1024;
        MultiZipInfo.MultiMode := mmBlocks;
        MultiZipInfo.BlockSize := 650 * 1024 * 1024;
        MultiZipInfo.FirstBlockSize := MultiZipInfo.BlockSize;
        Recurse := true;
        StorePaths := true;
        RelativePaths := true;
        AddDirEntriesOnRecurse := true;
        RootDir := MyProgramPath;
        FilesList.clear;
        FilesList.add('*');
        ExcludeList.clear;
        ExcludeList.add('*.mp3');
        PackLevel := 9;
        zip;
      end;
      result := true;
    except
      result := false;
    end;
    progressbar1.Position := 0;
    EndHourGlass;
    close;
  end;
end;

procedure TFormBackUp.VCLZip1TotalPercentDone(Sender: TObject;
  Percent: Integer);
begin
  progressbar1.Position := Percent;
end;

procedure TFormBackUp.Button2Click(Sender: TObject);
begin
  Zip(GENID);
end;

procedure TFormBackUp.IdFTP1WorkEnd(Sender: TObject; AWorkMode: TWorkMode);
begin
  progressbar1.position := 0;
end;

procedure TFormBackUp.IdFTP1WorkBegin(Sender: TObject;
  AWorkMode: TWorkMode; const AWorkCountMax: Integer);
begin
  progressbar1.max := AWorkCountMax;
end;

procedure TFormBackUp.IdFTP1Work(Sender: TObject; AWorkMode: TWorkMode;
  const AWorkCount: Integer);
begin
  if frequently(FtpStartTime, 300) then
  begin
    progressbar1.position := AWorkCount;
    application.processmessages;
  end;
end;

procedure TFormBackUp.Restore(BackupGID: integer);
var
  OutFName: string;
  gbkFName: string;
begin
  //
  gbkFName := 'Sicherung_' + inttostrN(BackUpGID, 8) + '.fbak';
  if iDataBaseBackUpDir = '' then
    OutFName := i_c_DataBasePath + gbkFName
  else
    OutFName := iDataBaseBackUpDir + gbkFName;

  if not (FileExists(iTranslatePath + gbkFName + '.fdb')) then
  begin
    show;
    StartTime := 0;

    SetUpService(IBRestoreService1);
    with IBRestoreService1 do
    begin
      PageSize := 16384;

      try
        DatabaseName.clear;
        DatabaseName.add(OutFName + '.fdb');
        BackupFile.clear;
        BackupFile.add(OutFName);
        application.processmessages;

        Log('#################');
        Log('# R E S T O R E #');
        Log('#################');
        Log('l�uft ...');
        Active := true;
        ServiceStart;
        repeat
          try
            while not Eof do
              Log(GetNextLine);
          except
            Log('ERROR: Restore Exception!');
          end;
        until eof;
      finally
        Active := False;
      end;
    end;
    close;
  end;
end;

procedure TFormBackUp.SetUpService(IBService: TIBControlService);
begin
  with IBService do
  begin
    //
    ServerName := iServerName;
    if (iServerName = '') then
      Protocol := Local
    else
      Protocol := TCP;
    LoginPrompt := False;

    Params.clear;
    Params.Add('user_name=SYSDBA');
    Params.Add('password=' + FormEinstellungen.SysDBAPassword);
    if IBService is TIBBackupRestoreService then
      with IBService as TIBBackupRestoreService do
        Verbose := True;
  end;
end;

procedure TFormBackUp.Log(s: string);
begin
  memo1.lines.add(s);
  if frequently(StartTime, 444) then
    application.processmessages;
  if pos('ERROR:', s) > 0 then
    CareTakerLog('Backup ' + s);
end;

procedure TFormBackUp.Image2Click(Sender: TObject);
begin
  open(cHelpURL + 'Datensicherung');
end;

end.

