//
// unified Bearbeiter
//
// todo: einiges muss noch nach eCommerce verschoben werden!
//
unit Bearbeiter;

interface

uses
  Windows, Messages, SysUtils,
  Classes, Graphics, Controls,
  Forms, Dialogs, Grids,
  ComCtrls, Mask, ExtCtrls, StdCtrls,
  // IB
  IB_UpdateBar, IB_NavigationBar,
  IB_SearchBar, IB_Grid, IB_Components,
  GIFImage,
  IB_Controls, ColorGrd,
  JvGIF, JvExControls, JvComponent, JvColorBox, JvColorButton, JvExExtCtrls,
  JvOfficeColorButton;

const
  cBearbeiterLogoXd = 50;
  cBearbeiterLogoYd = 15;

type
  TFormBearbeiter = class(TForm)
    StatusBar1: TStatusBar;
    IB_Query1: TIB_Query;
    IB_DataSource1: TIB_DataSource;
    IB_Grid1: TIB_Grid;
    Panel2: TPanel;
    IB_Memo1: TIB_Memo;
    StaticText1: TStaticText;
    StaticText2: TStaticText;
    StaticText3: TStaticText;
    Label1: TLabel;
    IB_Edit1: TIB_Edit;
    IB_Edit2: TIB_Edit;
    Label2: TLabel;
    Label3: TLabel;
    Button1: TButton;
    Image2: TImage;
    Label4: TLabel;
    IB_Query2: TIB_Query;
    IB_Text1: TIB_Text;
    IB_SearchBar1: TIB_SearchBar;
    IB_NavigationBar1: TIB_NavigationBar;
    IB_UpdateBar1: TIB_UpdateBar;
    Button2: TButton;
    Image3: TImage;
    JvOfficeColorButton1: TJvOfficeColorButton;
    JvOfficeColorButton2: TJvOfficeColorButton;
    procedure JvOfficeColorButton2ColorChange(Sender: TObject);
    procedure JvOfficeColorButton1ColorChange(Sender: TObject);
    procedure JvOfficeColorButton1Click(Sender: TObject);
    procedure IB_Query1BeforePost(IB_Dataset: TIB_Dataset);
    procedure FormActivate(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure IB_Query1AfterScroll(IB_Dataset: TIB_Dataset);
    procedure IB_Edit1Change(Sender: TObject);
    procedure IB_Query1AfterPost(IB_Dataset: TIB_Dataset);
    procedure IB_Query1BeforeInsert(IB_Dataset: TIB_Dataset);
    procedure FormDeactivate(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure IB_Query2AfterScroll(IB_Dataset: TIB_Dataset);
    procedure IB_Query2BeforePost(IB_Dataset: TIB_Dataset);
    procedure FormDestroy(Sender: TObject);
    procedure Image3Click(Sender: TObject);
  private

    { Private-Deklarationen }
    _WasAdmin: boolean;
    _cache: TStringList;
    _kuerzel: TStringList;
    EmptyPic: TBitMap;
    SilentMode: boolean;
    SupressChange: boolean;
    FOnChange: TNotifyEvent;

    BEARBEITER_R: integer;
    BEARBEITER_R_INIT: integer;

    procedure EnableCache;
    procedure DisableCache;
    procedure FireChange;

    function CP_getcolor(PickerNo:integer):TColor;
    procedure CP_setColor(PickerNo:integer; Col : TColor);
    procedure CP_Changed(PickerNo:integer);

  public
    { Public-Deklarationen }

    // Benutzer Dienste
    procedure CreateNewUser;
    procedure CreateNewUserSilent;
    procedure EnsureOneAdmin(RID: integer; Admins: TStringList = nil);
    procedure ShowPrivatProperties(RID: integer);
    procedure Start;
    procedure Switch(RID: integer); overload;
    procedure Switch(Kuerzel: string); overload;

    // Benutzer Auskunft
    function CreateUserLogo: TBitMap;
    function _CreateUserLogo(kurz: string; c1, c2: TColor): TBitMap;
    procedure UpdateUserLogo;
    function FetchRIDFromLogon(UserName: string): integer;
    function FetchRIDFromKurz(Kuerzel: string): integer;
    function FetchBILDFromRID(RID: integer): TBitMap;
    function FetchKURZFromRID(RID: integer): string;
    function FetchBackGroundColorFromRID(RID: integer): TColor;
    function FetchForeGroundColorFromRID(RID: integer): TColor;
    function FetchALLFromRID(RID: integer): TStringList;
    function FetchKuerzel: TStringList;
    // Benuter Rechtsprüfung
    function CheckRight(Right: string; RID: integer = 0): boolean;
    function getSetting(Setting: string; RID: integer = 0): string;
    function IsAdmin: boolean;
    function WasAdmin: boolean;
    function sBearbeiter: integer;
    function sBearbeiterKurz: string;

    property OnChange: TNotifyEvent read FOnChange write FOnChange;

  end;

var
  FormBearbeiter: TFormBearbeiter;

function CheckRight(Right: string; RID: integer = 0): boolean;
function getSetting(Setting: string; RID: integer = 0): string;

implementation

uses
  anfix32, globals, CareTakerClient;

{$R *.DFM}

procedure TFormBearbeiter.IB_Query1BeforePost(IB_Dataset: TIB_Dataset);
begin
  with IB_Dataset do
  begin
    if FieldByName('RID').IsNull then
      FieldByName('RID').AsInteger := 0;
    if not (SilentMode) then
    begin
      FieldByName('FARBE_HINTERGRUND').AsInteger := CP_getcolor(1);
      FieldByName('FARBE_VORDERGRUND').AsInteger := CP_getcolor(2);
    end;
  end;
end;

procedure TFormBearbeiter.FormActivate(Sender: TObject);
begin
  if not (IB_Query1.Active) then
    IB_Query1.Open;
end;

procedure TFormBearbeiter.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #27 then
  begin
    key := #0;
    close;
  end;
end;

procedure TFormBearbeiter.FormCreate(Sender: TObject);
begin
  button1.caption := '<< ' + UserName;
  label4.visible := false;
  EmptyPic := _CreateUserLogo('-.-', clred, clblack);
end;

procedure TFormBearbeiter.Button1Click(Sender: TObject);
begin
  if not (IB_Query1.state in [dssedit, dssinsert]) then
    IB_Query1.Edit;
  IB_Edit2.Text := UserName;
end;

procedure TFormBearbeiter.IB_Query1AfterScroll(IB_Dataset: TIB_Dataset);
begin
  SupressChange := true;
  CP_setcolor(1, IB_DataSet.FieldByName('FARBE_HINTERGRUND').AsInteger);
  CP_setColor(2, IB_DataSet.FieldByName('FARBE_VORDERGRUND').AsInteger);
  SupressChange := false;
  UpdateUserLogo;
end;

procedure TFormBearbeiter.CP_Changed(PickerNo: integer);
begin
  if not(SupressChange) then
  begin
    if not (IB_DataSource1.Dataset.state in [dssedit, dssinsert]) then
      IB_DataSource1.Dataset.Edit;
    case PickerNo of
     1:IB_Query1.FieldByName('FARBE_HINTERGRUND').AsInteger := CP_getColor(PickerNo);
     2:IB_Query1.FieldByName('FARBE_VORDERGRUND').AsInteger := CP_getColor(PickerNo);
    end;
    UpdateUserLogo;
  end;
end;

function TFormBearbeiter.CP_getcolor(PickerNo: integer): TColor;
begin
 case PickerNo of
  1:result := JvOfficeColorButton1.SelectedColor;
  2:result := JvOfficeColorButton2.SelectedColor;
 end;
end;

procedure TFormBearbeiter.CP_setColor(PickerNo: integer; Col: TColor);
begin
 case PickerNo of
  1:JvOfficeColorButton1.SelectedColor := Col;
  2:JvOfficeColorButton2.SelectedColor := Col;
 end;
end;

function TFormBearbeiter.CreateUserLogo: TBitMap;
var
  cHintergrund, c2: TColor;
begin
  result := TBitMap.create;
  SetBitMapSizeTo(result, Image2.Width, Image2.Height);
  with result.Canvas do
  begin
    font := Label4.Font;
    cHintergrund := CP_getcolor(1);
    c2 := CP_getcolor(2);
    if (ColorDistance(cHintergrund, c2) < 16) then
      c2 := VisibleContrast(cHintergrund);
    brush.color := cHintergrund;
    font.color := c2;
    TextRect(rect(0, 0, result.width, result.height),
      label4.left - image2.left,
      label4.top - image2.top,
      IB_Edit1.Text);
  end;
end;

function TFormBearbeiter._CreateUserLogo(kurz: string; c1, c2: TColor): TBitMap;
begin
  result := TBitMap.create;
  SetBitMapSizeTo(result, Image2.Width, Image2.Height);
  with result.Canvas do
  begin
    font := Label4.Font;
    if c1 = c2 then
      c2 := VisibleContrast(c1);
    brush.color := c1;
    font.color := c2;
    TextRect(rect(0, 0, result.width, result.height),
      label4.left - image2.left,
      label4.top - image2.top,
      kurz);
  end;
end;

procedure TFormBearbeiter.UpdateUserLogo;
var
  ThatLogo: TBitMap;
begin
  ThatLogo := CreateUserLogo;
  image2.Picture.Bitmap.Assign(ThatLogo);
  ThatLogo.free;
end;

procedure TFormBearbeiter.IB_Edit1Change(Sender: TObject);
begin
  if IB_Edit1.Focused or (IB_DataSource1.Dataset.state = dssinsert) then
    UpdateUserLogo;
end;

procedure TFormBearbeiter.IB_Query1AfterPost(IB_Dataset: TIB_Dataset);
var
  RID: integer;
begin
  with IB_Dataset do
  begin
    RID := FieldByName('RID').AsInteger;
    if (RID = 0) then
      RID := IB_Query1.Gen_ID('GEN_BEARBEITER', 0);
    refresh;
    IB_Query1.locate('RID', RID, []);
  end;
end;

procedure TFormBearbeiter.IB_Query1BeforeInsert(IB_Dataset: TIB_Dataset);
begin
  CP_setcolor(1,0);
  CP_setcolor(2,0);
end;

function TFormBearbeiter.FetchRIDFromLogon(UserName: string): integer;
var
  n: integer;
begin
  EnableCache;
  result := cNoBearbeiter;
  for n := 0 to pred(_Cache.count) do
    if (AnsiUpperCase(UserName) = AnsiUpperCase(TStringList(_Cache.objects[n])[2])) then
    begin
      result := strtoint(_cache[n]);
      break;
    end;
end;

function TFormBearbeiter.FetchBILDFromRID(RID: integer): TBitMap;
var
  FoundIndex: integer;
begin
  EnableCache;
  FoundIndex := _cache.indexof(inttostr(RID));
  if (FoundIndex = -1) then
  begin
    result := EmptyPic;
  end else
  begin
    result := TBitMap(TStringList(_cache.objects[FoundIndex]).objects[3]);
  end;
end;

function TFormBearbeiter.FetchKURZFromRID(RID: integer): string;
var
  FoundIndex: integer;
begin
  EnableCache;
  FoundIndex := _cache.indexof(inttostr(RID));
  if (FoundIndex = -1) then
  begin
    result := inttostr(RID);
  end else
  begin
    result := TStringList(_cache.objects[FoundIndex])[0];
  end;
end;

procedure TFormBearbeiter.EnableCache;
var
  SubList: TStringList;
  n: integer;
  MemoFields: TStringList;
  cBEARBEITER: TIB_Cursor;
  FarbeVordergrund: TColor;
  FarbeHintergrund: TColor;
begin
  if not (assigned(_cache)) then
  begin
    _cache := TStringList.create;
    cBEARBEITER := TIB_Cursor.create(self);
    with cBEARBEITER do
    begin
      sql.add('select * from BEARBEITER order by KUERZEL');
      Apifirst;
      while not (eof) do
      begin
        SubList := TStringList.create;
        _cache.addObject(inttostr(FieldByName('RID').AsInteger), SubList);
 {[00]} SubList.add(FieldByName('KUERZEL').AsString);
 {[01]} SubList.add(FieldByName('NAME').AsString);
 {[02]} SubList.add(FieldByName('USERNAME').AsString);
        if FieldByName('FARBE_VORDERGRUND').IsNull or
          FieldByName('FARBE_HINTERGRUND').IsNull then
        begin
          FarbeVordergrund := clBlack;
          FarbeHintergrund := clWhite;
        end else
        begin
          FarbeVordergrund := FieldByName('FARBE_VORDERGRUND').AsINteger;
          FarbeHintergrund := FieldByName('FARBE_HINTERGRUND').AsInteger;
        end;
        if ColorDistance(FarbeVordergrund, FarbeHintergrund) < 16 then
          FarbeVordergrund := VisibleContrast(FarbeHintergrund);

 {[03]} SubList.addObject('BILD', _CreateUserLogo(SubList[0], FarbeHintergrund, FarbeVordergrund));
 {[04]} SubList.add(inttostr(FarbeVordergrund));
 {[05]} SubList.add(inttostr(FarbeHintergrund));

        MemoFields := TStringList.create;
        FieldByName('STATUS').AssignTo(MemoFields);
        Sublist.AddStrings(MemoFields);
        MemoFields.Free;

        Apinext;
      end;
    end;
    cBEARBEITER.free;
    _kuerzel := TStringList.create;
    for n := 0 to pred(_cache.count) do
      _kuerzel.add(TStringList(_cache.Objects[n])[0]);
    _kuerzel.Sort;
  end;
end;

procedure TFormBearbeiter.DisableCache;
var
  n: integer;
begin
  if assigned(_cache) then
  begin
    for n := 0 to pred(_cache.count) do
    begin
      TStringList(_cache.objects[n]).objects[3].free;
      _cache.objects[n].free;
    end;
    FreeAndNil(_cache);
    FreeAndNil(_kuerzel);
  end;
end;

procedure TFormBearbeiter.CreateNewUser;
begin
  IB_UpdateBar1.BtnClick(ubInsert);
  Button1.click;
  CP_setColor(1,clwhite);
  IB_Query1.FieldByName('FARBE_HINTERGRUND').AsInteger := clwhite;
  IB_Query1.FieldByName('USERNAME').AsString := UserName;
  IB_Query1.FieldByName('KUERZEL').AsString := UserName;
  show;
 CP_setcolor(1, clwhite);
  IB_Query1.FieldByName('FARBE_HINTERGRUND').AsInteger := clwhite;
end;

procedure TFormBearbeiter.CreateNewUserSilent;
begin
  with IB_Query1 do
  begin
    SilentMode := true;
    randomize;
    insert;
    FieldByName('FARBE_HINTERGRUND').AsInteger := rgb(random(256), random(256), random(256));
    FieldByName('FARBE_VORDERGRUND').AsInteger := VisibleContrast(FieldByName('FARBE_HINTERGRUND').AsInteger);
    FieldByName('USERNAME').AsString := UserName;
    FieldByName('KUERZEL').AsString := UserName;
    post;
    SilentMode := false;
  end;
  DisableCache;
end;

procedure TFormBearbeiter.FormDeactivate(Sender: TObject);
begin
  DisableCache;
  FireChange;
end;

procedure TFormBearbeiter.Button2Click(Sender: TObject);
begin
  CreateNewUser;
end;

function TFormBearbeiter.FetchKuerzel: TStringList;
begin
  EnableCache;
  result := _Kuerzel;
end;

function TFormBearbeiter.FetchRIDFromKurz(Kuerzel: string): integer;
var
  n: integer;
begin
  EnableCache;
  result := cNoBearbeiter;
  for n := 0 to pred(_Cache.count) do
    if (Kuerzel = TstringList(_Cache.objects[n])[0]) then
    begin
      result := strtoint(_cache[n]);
      break;
    end;
end;

procedure TFormBearbeiter.EnsureOneAdmin;
var
  OneAdmin: boolean;
  n: integer;
  MemoLines: TStringList;
begin

  //
  EnableCache;

  //
  OneAdmin := false;
  for n := 0 to pred(_cache.count) do
    if TStringList(_Cache.objects[n]).Values['ADMIN'] = 'JA' then
    begin
      OneAdmin := true;
      if assigned(Admins) then
        with TStringList(_cache.objects[n]) do
          Admins.add(strings[0] + ' (' + strings[1] + ')');
      break;
    end;

  //
  if not (OneAdmin) then
  begin
    with IB_Query1 do
    begin
      locate('RID', RID, []);
      edit;
      MemoLines := TStringList.create;
      FieldByName('STATUS').AssignTo(MemoLines);
      MemoLines.add('ADMIN=JA');
      FieldByName('STATUS').Assign(MemoLines);
      MemoLines.free;
      post;
      DisableCache;
      ShowMessage('Sie sind jetzt Admin!');
    end;
  end;

end;

function TFormBearbeiter.FetchALLFromRID(RID: integer): TstringList;
var
  FoundIndex: integer;
begin
  //
  EnableCache;
  FoundIndex := _cache.indexof(inttostr(RID));
  if (FoundIndex = -1) then
  begin
    result := nil;
  end else
  begin
    result := TStringList(_cache.objects[FoundIndex]);
  end;
end;

function TFormBearbeiter.CheckRight(Right: string; RID: integer): boolean;
var
  All: TStringList;
begin
  if (Rid = 0) then
    RID := BEARBEITER_R;
  All := FetchAllFromRID(RID);
  if assigned(all) then
    result := All.values[right] = 'JA'
  else
    result := false;
end;

function CheckRight(Right: string; RID: integer): boolean;
begin
  result := FormBearbeiter.CheckRight(Right, RID);
end;

procedure TFormBearbeiter.ShowPrivatProperties(RID: integer);
begin
  with IB_Query2 do
  begin
    ParamByName('CROSSREF').AsInteger := RID;
    if not (active) then
      open
    else
      refresh;
  end;
  IB_DataSource1.Dataset := IB_query2;
  show;
  IB_Query1AfterScroll(IB_query2);
end;

procedure TFormBearbeiter.IB_Query2AfterScroll(IB_Dataset: TIB_Dataset);
begin
  IB_Query1AfterScroll(IB_Dataset);
end;

procedure TFormBearbeiter.IB_Query2BeforePost(IB_Dataset: TIB_Dataset);
begin
  IB_Query1BeforePost(IB_Dataset);
end;

function TFormBearbeiter.IsAdmin: boolean;
begin
  result := CheckRight('ADMIN');
end;

procedure TFormBearbeiter.JvOfficeColorButton1Click(Sender: TObject);
begin
  CP_Changed(1);
end;

procedure TFormBearbeiter.JvOfficeColorButton1ColorChange(Sender: TObject);
begin
  CP_Changed(1);

end;

procedure TFormBearbeiter.JvOfficeColorButton2ColorChange(Sender: TObject);
begin
  CP_Changed(2);

end;

function TFormBearbeiter.WasAdmin: boolean;
begin
  result := _WasAdmin;
end;

function TFormBearbeiter.sBearbeiter: integer;
begin
  result := BEARBEITER_R;
end;

function TFormBearbeiter.sBearbeiterKurz: string;
begin
  result := FetchKURZFromRID(sBearbeiter);
end;

procedure TFormBearbeiter.Start;
begin

  // die Benutzerverwaltung soll benutzt werden
  BEARBEITER_R_INIT := FetchRIDFromLogon(UserName);
  if (BEARBEITER_R_INIT = cNoBearbeiter) then
  begin
(*
    if DoIt('Der Anmeldename "' + UserName + '" ist relaxx nicht bekannt!' + #13 +
      'wollen Sie jetzt einen Benutzer anlegen') then
*)
    CreateNewUserSilent;
    BEARBEITER_R_INIT := FetchRIDFromLogon(UserName);
  end;

  EnsureOneAdmin(BEARBEITER_R_INIT);

  _WasAdmin := CheckRight('ADMIN', BEARBEITER_R_INIT);

  BEARBEITER_R := BEARBEITER_R_INIT;
  FireChange;

end;

procedure TFormBearbeiter.Switch(RID: integer);
begin
  BEARBEITER_R := RID;
  FireChange;
end;

procedure TFormBearbeiter.Switch(Kuerzel: string);
begin
  switch(FetchRIDFromKurz(Kuerzel));
end;

function TFormBearbeiter.FetchBackGroundColorFromRID(RID: integer): TColor;
var
  FoundIndex: integer;
begin
  EnableCache;
  FoundIndex := _cache.indexof(inttostr(RID));
  if (FoundIndex = -1) then
  begin
    result := clwhite;
  end else
  begin
    result := strtoint(TStringList(_cache.objects[FoundIndex])[5]);
  end;
end;

function TFormBearbeiter.FetchForeGroundColorFromRID(RID: integer): TColor;
var
  FoundIndex: integer;
begin
  EnableCache;
  FoundIndex := _cache.indexof(inttostr(RID));
  if (FoundIndex = -1) then
  begin
    result := clblack;
  end else
  begin
    result := strtoint(TStringList(_cache.objects[FoundIndex])[4]);
  end;
end;

procedure TFormBearbeiter.FormDestroy(Sender: TObject);
begin
  DisableCache;
  FreeAndNil(EmptyPic);
end;

procedure TFormBearbeiter.FireChange;
begin
  MachineIDChanged;
  if assigned(FOnChange) then
    FOnChange(self);
end;

procedure TFormBearbeiter.Image3Click(Sender: TObject);
begin
  open(cHelpURL + 'Bearbeiter');
end;

function TFormBearbeiter.getSetting(Setting: string; RID: integer): string;
var
  All: TStringList;
begin
  if (Rid = 0) then
    RID := BEARBEITER_R;
  All := FetchAllFromRID(RID);
  if assigned(all) then
    result := All.values[Setting]
  else
    result := '?';
end;

function getSetting(Setting: string; RID: integer): string;
begin
  result := FormBearbeiter.getSetting(Setting, RID);
end;


end.

