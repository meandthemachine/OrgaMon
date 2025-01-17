(*
      ___                  __  __
     / _ \ _ __ __ _  __ _|  \/  | ___  _ __
    | | | | '__/ _` |/ _` | |\/| |/ _ \| '_ \
    | |_| | | | (_| | (_| | |  | | (_) | | | |
     \___/|_|  \__, |\__,_|_|  |_|\___/|_| |_|
               |___/

    Copyright (C) 2007  Andreas Filsinger

    This program is free software: you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation, either version 3 of the License, or
    (at your option) any later version.

    This program is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.

    You should have received a copy of the GNU General Public License
    along with this program.  If not, see <http://www.gnu.org/licenses/>.

    http://orgamon.org/

*)
unit GermanParcelInspect;

interface

uses
  Windows, Messages, SysUtils,
  Classes, Graphics, Controls,
  Forms, Dialogs, StdCtrls,
  IB_NavigationBar, Grids, IB_Grid,
  IB_Components, ExtCtrls,
  IB_UpdateBar, gplists, Buttons;

type
  TFormGermanParcelInspect = class(TForm)
    IB_Query1: TIB_Query;
    IB_DataSource1: TIB_DataSource;
    IB_Grid1: TIB_Grid;
    IB_NavigationBar1: TIB_NavigationBar;
    Button1: TButton;
    IB_UpdateBar1: TIB_UpdateBar;
    Button2: TButton;
    ComboBox1: TComboBox;
    Label3: TLabel;
    Edit1: TEdit;
    SpeedButton8: TSpeedButton;
    procedure Button1Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure ComboBox1Change(Sender: TObject);
    procedure Edit1KeyPress(Sender: TObject; var Key: Char);
    procedure SpeedButton8Click(Sender: TObject);
  private
    { Private-Deklarationen }
    VERSENDER_L: TIntegerList;
    VERSENDER_R: integer;

    procedure RefreshVersenderL;
    procedure EnsureOpen(pVERSENDER_R:integer);
    procedure bucheEreignis(BELEG_R,VERSAND_R:integer; PaketID: string);

  public
    { Public-Deklarationen }
    procedure Execute;

    procedure BucheGermanParcel(Pfad:string);
    procedure BucheDeutschePost(Pfad:string);

    procedure Buche;
  end;

var
  FormGermanParcelInspect: TFormGermanParcelInspect;

implementation

uses
  globals, Versender, anfix32,
  WordIndex, Belege, eCommerce,
  IBEXportTable, Caching;

{$R *.DFM}

const
  cSpalte_DeutschePost_PAKETID = 1;
  cSpalte_DeutschePost_BELEG_R_TEILLIEFERUNG = 22;
  cSpalte_DeutschePost_Max = 30;

procedure TFormGermanParcelInspect.Button1Click(Sender: TObject);
begin
 // zum Beleg springen!
  FormBelege.SetContext(0, IB_Query1.FieldByName('BELEG_R').AsInteger);
end;

procedure TFormGermanParcelInspect.FormActivate(Sender: TObject);
var
  AktuelleVersender: TStringList;
  n : integer;
  _ComboBox1_Text : string;
begin
  BeginHourGlass;
  AktuelleVersender := TStringList.create;

  // alten wert sichern
  if (ComboBox1.ItemIndex<>-1) then
    _ComboBox1_Text := ComboBox1.Items[ComboBox1.ItemIndex]
  else
    _ComboBox1_Text := '';

  // refresh the Combo-Box
  RefreshVersenderL;
  for n := 0 to pred(VERSENDER_L.count) do
    AktuelleVersender.addobject(DataModuleeCommerce.e_r_sqls(
      'select BEZEICHNUNG from VERSENDER where RID='+inttostr(VERSENDER_L[n])),pointer(VERSENDER_L[n]));
  AktuelleVersender.sort;
  Combobox1.Items.assign(AktuelleVersender);

 // select the old, or a new item
  if (AktuelleVersender.count>0) then
  begin
    n := AktuelleVersender.indexof(_ComboBox1_Text);
    if (n=-1) then
    begin
      // gibts nimmer
      Combobox1.itemIndex := 0;
      ComboBox1.OnChange(self);
    end    else
    begin
      // gibts immer noch
      Combobox1.itemIndex := n;
    end;
  end  else
  begin
    // ist jetzt leer!
    Combobox1.itemIndex := -1;
    ComboBox1.OnChange(self);
  end;

  AktuelleVersender.Free;
  EndHourGlass;
end;

procedure TFormGermanParcelInspect.RefreshVersenderL;
begin
  if assigned(VERSENDER_L) then
    VERSENDER_L.free;
  VERSENDER_L := DataModuleeCommerce.e_r_sqlm(
    'select RID from VERSENDER where'+
    ' (IMPORTPFAD is not null) and'+
    ' (IMPORTPFAD<>'''')');
end;

procedure TFormGermanParcelInspect.SpeedButton8Click(Sender: TObject);
var
  _Path : string;
begin
  // Zielpfad ermitteln
  _Path := ExtractFilePath(
    DataModuleeCommerce.e_r_sqls(
    'select IMPORTPFAD from VERSENDER where RID='+
    inttostr(VERSENDER_R)));

  // Explorer �ffnen
  open(_path);
end;

procedure TFormGermanParcelInspect.Edit1KeyPress(Sender: TObject;
  var Key: Char);
var

  _Path : string;
  n : integer;
  OutS: string;
begin
  if (Key=#13) then
  begin

    // Zielpfad ermitteln
    _Path := ExtractFilePath(
      DataModuleeCommerce.e_r_sqls(
      'select IMPORTPFAD from VERSENDER where RID='+
      inttostr(VERSENDER_R)));

    // Testdatensatz zusammenstellen
    OutS := '';
    for n := 0 to cSpalte_DeutschePost_Max do
    begin
      case n of

        cSpalte_DeutschePost_PAKETID:
          OutS := OutS + Edit1.Text;

        cSpalte_DeutschePost_BELEG_R_TEILLIEFERUNG:
          OutS := OutS +
            IB_Query1.FieldByName('BELEG_R').AsString+
            inttostrN(IB_Query1.FieldByName('TEILLIEFERUNG').AsInteger,2);

      end;
      OutS := OutS + ';';
    end;

    // Ausgabedatei schreiben
    AppendStringsToFile(
      OutS,
      _Path+'ElSendEx-Manuell.txt');

    edit1.Text := '';
    Key := #0;
  end;
end;

procedure TFormGermanParcelInspect.EnsureOpen;
begin
  VERSENDER_R := pVERSENDER_R;
  with IB_Query1 do
  begin
    ParamByName('CROSSREF').AsInteger := VERSENDER_R;
    if not (active) then
      Open
    else
      refresh;
  end;
end;

procedure TFormGermanParcelInspect.Execute;
var
  n:integer;
begin
  BeginHourGlass;
  RefreshVersenderL;
  for n := 0 to pred(VERSENDER_L.count) do
  begin
    EnsureOpen(VERSENDER_L[n]);
    Buche;
  end;
  EndHourGlass;
end;

procedure TFormGermanParcelInspect.Buche;
var
  VerarbeitungsArt : integer;
  ImportPath : string;
begin
  VerarbeitungsArt := DataModuleeCommerce.e_r_sql(
    'select EXPORTTYP from VERSENDER where RID='+inttostr(VERSENDER_R));
  ImportPath := DataModuleeCommerce.e_r_sqls(
    'select IMPORTPFAD from VERSENDER where RID='+inttostr(VERSENDER_R));

  case VerarbeitungsArt of
    1:
      BucheGermanParcel(ImportPath);
    2:
      BucheDeutschePost(ImportPath);
  end;
end;

procedure TFormGermanParcelInspect.BucheDeutschePost;
var
  sDateien : TStringList;
  sPostDatei : TStringList;
  n : integer;
  AlleInfos: TStringList;
  _Path:string;
  SpeedIndex : TStringList;
  _Index: string;
  PaketID: string;
begin
  BeginHourGlass;

  AlleInfos := TStringList.create;
  sDateien := TStringList.Create;
  sPostDatei := TStringList.Create;
  SpeedIndex := TStringList.create;

  try
    // ganze Tabelle aufbauen
    _Path := ExtractFilePath(Pfad);
    if not(DirExists(_Path)) then
      raise Exception.create('Paket-ID Pfad "'+_Path+'" existiert nicht');
    dir(Pfad,sDateien,false);
    for n := 0 to pred(sDateien.count) do
    begin
      LoadFromFileCSV_CR(true,sPostDatei,_Path+sDateien[n]);
      AlleInfos.AddStrings(sPostDatei);
    end;
    AlleInfos.SaveToFile(_Path+'AktuelleTabelle.csv');

    // Speed-Index erstellen
    for n := 0 to pred(AlleInfos.count) do
    begin
      _Index := nextp(AlleInfos[n],';',cSpalte_DeutschePost_BELEG_R_TEILLIEFERUNG);
      if (_Index<>'') then
        SpeedIndex.addobject( _Index, pointer(n));
    end;
    SpeedIndex.sort;

    // Bekannte IDs einbuchen
    with IB_Query1 do
    begin
      First;
      while not(eof) do
      begin
        _Index :=
          FieldByName('BELEG_R').AsString +
          inttostrN(FieldByName('TEILLIEFERUNG').AsInteger,2);
        n := SpeedIndex.indexof(_Index);
        if (n<>-1) then
        begin

          // passenden Pakt-ID ziehen!
          n := integer( SpeedIndex.objects[n] );
          PaketID:= nextp(AlleInfos[n],';',cSpalte_DeutschePost_PAKETID);

          if (PaketID<>'') then
          begin

            // Paket ID eintragen
            edit;
            FieldByName('PAKETID').AsString := PaketID;
            post;

            // Ereignis buchen
            bucheEreignis(
              FieldByName('BELEG_R').AsInteger,
              FieldByName('RID').AsInteger,
              PaketID);

          end;
        end else
        begin
        // Report Error! -> Ticket
        end;
        next;
      end;
    end;

    // Transaktion abschliessen
    DataModuleCaching.CheckCreateOnce(_Path+'Ablage');
    for n := 0 to pred(sDateien.count) do
      FileMove(_path+sDateien[n],_Path+'Ablage\'+sDateien[n]);

  except

  end;
  AlleInfos.free;
  sDateien.free;
  sPostDatei.free;
  SpeedIndex.free;

  // Zu alte Dateien wegbewegen!

  EndHourGlass;

end;

procedure TFormGermanParcelInspect.bucheEreignis(BELEG_R, VERSAND_R: integer; PaketID: string);
var
  qEREIGNIS : TIB_Query;
  EventText : TStringList;
begin
  qEREIGNIS := TIB_Query.create(self);
  EventText := TStringList.create;
  try
    with qEREIGNIS do
    begin
      ColumnAttributes.add('RID=NOTREQUIRED');
      ColumnAttributes.add('AUFTRITT=NOTREQUIRED');
      sql.add('select * from EREIGNIS for update');
      insert;
      FieldByName('ART').AsInteger := eT_PaketIDErhalten;
      FieldByName('BELEG_R').AsInteger := BELEG_R;
      FieldByName('VERSAND_R').AsInteger := VERSAND_R;
      EventText.add(format('Paket-ID "%s" zugeteilt!',
        [PaketID]));
      FieldByName('INFO').assign(EventText);
      post;
    end;
  except

  end;
  qEREIGNIS.free;
  EventText.free;
end;

procedure TFormGermanParcelInspect.BucheGermanParcel;
const
  cGermanParcelDelimiter = '|';
var
  gpFName: string;
  AllTheData: TSearchStringList;
  ToDay: TANFiXTime;
  CheckDate: TANFiXTime;
  UnreferencedByNow: string;
  n: integer;
  FoundOne: integer;
  FoundAnz: integer;
begin
  AllTheData := TSearchStringList.create;


  ToDay := DateGet;
  for n := 4 downto 0 do
  begin
    CheckDate := DatePlus(ToDay, -n);
  // gpTT.MM
    gpFName := 'GP' + copy(long2date8(CheckDate), 1, 2) + '.' +
      copy(long2date8(CheckDate), 4, 2);
    if FileExists(Pfad + gpFName) then
      LoadFromFileHugeLines(false, AllTheData, Pfad + gpFName);

  end;
  for n := 0 to pred(AllTheData.count) do
    AllTheData[n] := nextp(AllTheData[n], cGermanParcelDelimiter, 16) + cGermanParcelDelimiter + AllTheData[n];
  AllTheData.sort;
  AllTheData.sorted := true;
  FoundAnz := 0;
  with IB_Query1 do
  begin
    refreshall;
    first;
    while not (eof) do
    begin
      UnreferencedByNow := inttostr(FieldByName('BELEG_R').AsInteger) +
        inttostrN(FieldByName('TEILLIEFERUNG').AsInteger, 2);
      FoundOne := AllTheData.FindNear(UnreferencedByNow + cGermanParcelDelimiter);
      if FoundOne <> -1 then
      begin
        inc(FoundAnz);
        edit;
        FieldByName('PAKETID').AsString := nextp(AllTheData[FoundOne], cGermanParcelDelimiter, 1);
        post;
      end;
      next;
    end;
  end;
  AllTheData.free;
end;

procedure TFormGermanParcelInspect.Button2Click(Sender: TObject);
begin
  Buche;
end;

procedure TFormGermanParcelInspect.ComboBox1Change(Sender: TObject);
begin
  with Combobox1 do
    if (ItemIndex=-1) then
      EnsureOpen(cRID_Null)
    else
      EnsureOpen(integer(Combobox1.items.Objects[ItemIndex]));
end;

end.
