unit Liquiditaet;

interface

uses
  Windows, Messages, SysUtils,
  Variants, Classes, Graphics,
  Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, IB_Components;

type
  TFormLiquiditaet = class(TForm)
    procedure Button1Click(Sender: TObject);
  private
    { Private-Deklarationen }
    procedure RefreshAussenstaende;
  public
    { Public-Deklarationen }
  end;

var
  FormLiquiditaet: TFormLiquiditaet;

implementation

uses
  eCommerce, HeBuData, anfix32, globals;

{$R *.dfm}

{ TFormLiquiditaet }


procedure TFormLiquiditaet.RefreshAussenstaende;
var
  Summe: double;
  Aussenstaende: double;
  Offen: double;
  VerZug: double;
  faellig: double;
  m1, m2, m3, mb: double;
  ungemahnt_r, ungemahnt_m1, ungemahnt_m2, ungemahnt_m3, ungemahnt_mb: double;
  cBELEGE: TIB_Cursor;
  n: integer;
  LastValue: integer;
  ThisValue: integer;

  function Sign(i: integer): string;
  begin
    if i >= 0 then
      result := '+'
    else
      result := '-';
  end;

begin
  BeginHourGlass;
  listbox1.items.clear;
  Summe := DataModuleEcommerce.e_r_sqld('select SUM(BETRAG) from ausgangsrechnung');
  ShowSaldo(StaticText1, Summe, true);

  cBELEGE := TIB_Cursor.create(self);
  with cBELEGE do
  begin

    // Alle Aussenstaende
    sql.add('select sum(RECHNUNGS_BETRAG) RECHNUNGS_BETRAG,SUM(DAVON_BEZAHLT) DAVON_BEZAHLT from BELEG');
    ApiFirst;
    Aussenstaende := FieldByName('RECHNUNGS_BETRAG').AsDouble - FieldByName('DAVON_BEZAHLT').AsDouble;
    close;
    ShowSaldo(StaticText11, Aussenstaende, true);

    // offene Betr�ge = F�lligkeit erst in der Zukunft
    sql.clear;
    sql.add('select sum(RECHNUNGS_BETRAG) RECHNUNGS_BETRAG,SUM(DAVON_BEZAHLT) DAVON_BEZAHLT from BELEG');
    sql.add('where');
    sql.add('      (FAELLIG>''' + Long2date(DateGet) + ''')');
    ApiFirst;
    Offen := FieldByName('RECHNUNGS_BETRAG').AsDouble - FieldByName('DAVON_BEZAHLT').AsDouble;
    close;
    ShowSaldo(StaticText9, Offen, true);

    // Betr�ge in VerZug, ggf aber gemahnt!
    sql.clear;
    sql.add('select sum(RECHNUNGS_BETRAG) RECHNUNGS_BETRAG,SUM(DAVON_BEZAHLT) DAVON_BEZAHLT from BELEG');
    sql.add('where');
    sql.add('      (FAELLIG<''' + Long2date(DatePlus(DateGet, -iMahnFaelligkeitstoleranz)) + ''')');
    ApiFirst;
    Verzug := FieldByName('RECHNUNGS_BETRAG').AsDouble - FieldByName('DAVON_BEZAHLT').AsDouble;
    close;
    ShowSaldo(StaticText8, Verzug, true);

    faellig := Aussenstaende - (Offen + Verzug);

    // in Mahnung 1 / 2 / 3
    sql.clear;
    sql.add('select sum(RECHNUNGS_BETRAG) RECHNUNGS_BETRAG,SUM(DAVON_BEZAHLT) DAVON_BEZAHLT from BELEG');
    sql.add('where');
    sql.add('      (MAHNBESCHEID is null) AND');
    sql.add('      (MAHNUNG2 is null) AND');
    sql.add('      (MAHNUNG3 is null) AND');
    sql.add('      (MAHNUNG1>=''' + Long2date(DatePlus(DateGet, -iMahnfreierZeitraum)) + ''')');
    ApiFirst;
    m1 := FieldByName('RECHNUNGS_BETRAG').AsDouble - FieldByName('DAVON_BEZAHLT').AsDouble;
    close;
    ShowSaldo(StaticText3, m1, true);

    // in aktueller Mahnung "1"
    sql.clear;
    sql.add('select sum(RECHNUNGS_BETRAG) RECHNUNGS_BETRAG,SUM(DAVON_BEZAHLT) DAVON_BEZAHLT from BELEG');
    sql.add('where');
    sql.add('      (MAHNBESCHEID is null) AND');
    sql.add('      (MAHNUNG1 is not null) AND');
    sql.add('      (MAHNUNG3 is null) AND');
    sql.add('      (MAHNUNG2>=''' + Long2date(DatePlus(DateGet, -iMahnfreierZeitraum)) + ''')');
    ApiFirst;
    m2 := FieldByName('RECHNUNGS_BETRAG').AsDouble - FieldByName('DAVON_BEZAHLT').AsDouble;
    close;
    ShowSaldo(StaticText4, m2, true);

    // in aktueller Mahnung "2"
    sql.clear;
    sql.add('select sum(RECHNUNGS_BETRAG) RECHNUNGS_BETRAG,SUM(DAVON_BEZAHLT) DAVON_BEZAHLT from BELEG');
    sql.add('where');
    sql.add('      (MAHNBESCHEID is null) AND');
    sql.add('      (MAHNUNG1 is not null) AND');
    sql.add('      (MAHNUNG2 is not null) AND');
    sql.add('      (MAHNUNG3>=''' + Long2date(DatePlus(DateGet, -iMahnfreierZeitraum)) + ''')');
    ApiFirst;
    m3 := FieldByName('RECHNUNGS_BETRAG').AsDouble - FieldByName('DAVON_BEZAHLT').AsDouble;
    close;
    ShowSaldo(StaticText5, m3, true);

    // im Mahnbescheid
    sql.clear;
    sql.add('select sum(RECHNUNGS_BETRAG) RECHNUNGS_BETRAG,SUM(DAVON_BEZAHLT) DAVON_BEZAHLT from BELEG');
    sql.add('where');
    sql.add('      (MAHNBESCHEID is not null)');
    ApiFirst;
    mb := FieldByName('RECHNUNGS_BETRAG').AsDouble - FieldByName('DAVON_BEZAHLT').AsDouble;
    close;
    ShowSaldo(StaticText6, mb, true);

    // Berechnet "ungemahnt"
    ShowSaldo(StaticText7, verzug - (m1 + m2 + m3 + mb), true);
    ShowSaldo(StaticText10, verzug, true);

    // Berechnet "f�llige Betr�ge"
    ShowSaldo(StaticText2, Faellig, true);

    // bisher ungemahnte Mahnbare Rechnungen
    sql.clear;
    sql.add('select sum(RECHNUNGS_BETRAG) RECHNUNGS_BETRAG,SUM(DAVON_BEZAHLT) DAVON_BEZAHLT from BELEG');
    sql.add('where');
    sql.add('      (FAELLIG<''' + Long2date(DatePlus(DateGet, -iMahnFaelligkeitstoleranz)) + ''') AND');
    sql.add('      (MAHNUNG1 is null)');
    ApiFirst;
    ungemahnt_r := FieldByName('RECHNUNGS_BETRAG').AsDouble - FieldByName('DAVON_BEZAHLT').AsDouble;
    close;
    ShowSaldo(StaticText12, ungemahnt_r, true);

    // bisher ungemahnte Mahnbare M1
    sql.clear;
    sql.add('select sum(RECHNUNGS_BETRAG) RECHNUNGS_BETRAG,SUM(DAVON_BEZAHLT) DAVON_BEZAHLT from BELEG');
    sql.add('where');
    sql.add('      (FAELLIG<''' + Long2date(DatePlus(DateGet, -iMahnFaelligkeitstoleranz)) + ''') AND');
    sql.add('      (MAHNUNG<''' + Long2date(DatePlus(DateGet, -iMahnfreierZeitraum)) + ''') AND');
    sql.add('      (MAHNUNG1 is not null) AND');
    sql.add('      (MAHNUNG2 is null)');
    ApiFirst;
    ungemahnt_m1 := FieldByName('RECHNUNGS_BETRAG').AsDouble - FieldByName('DAVON_BEZAHLT').AsDouble;
    close;
    ShowSaldo(StaticText13, ungemahnt_m1, true);

    // bisher ungemahnte Mahnbare M2
    sql.clear;
    sql.add('select sum(RECHNUNGS_BETRAG) RECHNUNGS_BETRAG,SUM(DAVON_BEZAHLT) DAVON_BEZAHLT from BELEG');
    sql.add('where');
    sql.add('      (FAELLIG<''' + Long2date(DatePlus(DateGet, -iMahnFaelligkeitstoleranz)) + ''') AND');
    sql.add('      (MAHNUNG<''' + Long2date(DatePlus(DateGet, -iMahnfreierZeitraum)) + ''') AND');
    sql.add('      (MAHNUNG1 is not null) AND');
    sql.add('      (MAHNUNG2 is not null) AND');
    sql.add('      (MAHNUNG3 is null)');
    ApiFirst;
    ungemahnt_m2 := FieldByName('RECHNUNGS_BETRAG').AsDouble - FieldByName('DAVON_BEZAHLT').AsDouble;
    close;
    ShowSaldo(StaticText14, ungemahnt_m2, true);

    // bisher ungemahnte Mahnbare M3
    sql.clear;
    sql.add('select sum(RECHNUNGS_BETRAG) RECHNUNGS_BETRAG,SUM(DAVON_BEZAHLT) DAVON_BEZAHLT from BELEG');
    sql.add('where');
    sql.add('      (FAELLIG<''' + Long2date(DatePlus(DateGet, -iMahnFaelligkeitstoleranz)) + ''') AND');
    sql.add('      (MAHNUNG<''' + Long2date(DatePlus(DateGet, -iMahnfreierZeitraum)) + ''') AND');
    sql.add('      (MAHNUNG1 is not null) AND');
    sql.add('      (MAHNUNG2 is not null) AND');
    sql.add('      (MAHNUNG3 is not null) AND');
    sql.add('      (MAHNBESCHEID is null)');
    ApiFirst;
    ungemahnt_m3 := FieldByName('RECHNUNGS_BETRAG').AsDouble - FieldByName('DAVON_BEZAHLT').AsDouble;
    close;
    ShowSaldo(StaticText15, ungemahnt_m3, true);

    // bisher ungemahnte Mahnbare MB
    sql.clear;
    sql.add('select sum(RECHNUNGS_BETRAG) RECHNUNGS_BETRAG,SUM(DAVON_BEZAHLT) DAVON_BEZAHLT from BELEG');
    sql.add('where');
    sql.add('      (FAELLIG<''' + Long2date(DatePlus(DateGet, -iMahnFaelligkeitstoleranz)) + ''') AND');
    sql.add('      (MAHNUNG<''' + Long2date(DatePlus(DateGet, -iMahnungMahnBescheidLaufzeit)) + ''') AND');
    sql.add('      (MAHNBESCHEID is not null)');
    ApiFirst;
    ungemahnt_mb := FieldByName('RECHNUNGS_BETRAG').AsDouble - FieldByName('DAVON_BEZAHLT').AsDouble;
    close;
    ShowSaldo(StaticText16, ungemahnt_mb, true);

    //
    ShowSaldo(StaticText17, ungemahnt_r + ungemahnt_m1 + ungemahnt_m2 + ungemahnt_m3 + ungemahnt_mb, true);

    // Anzahl der ungemahnten Personen
    LastValue := 0;
    for n := -3 to iMahnfreierZeitraum + 3 do
    begin
      sql.clear;
      sql.add('select distinct count(PERSON_R) PERSON_R from BELEG');
      sql.add('where');
      sql.add('    ((RECHNUNGS_BETRAG-DAVON_BEZAHLT>0.009) or (RECHNUNGS_BETRAG>0.0 and DAVON_BEZAHLT is null)) and');
      sql.add('    (MAHNBESCHEID is null) and');
      sql.add('    (FAELLIG<''' + Long2date(DatePlus(DateGet, n + -iMahnFaelligkeitstoleranz)) + ''') and');
      sql.add('    ((MAHNUNG<''' + Long2date(DatePlus(DateGet, n + -iMahnfreierZeitraum)) + ''') or (MAHNUNG1 is NULL))');
      ApiFirst;
      ThisValue := FieldByName('PERSON_R').AsInteger;
      listbox1.items.add(long2date(DatePlus(DateGet, n)) + '  ' + inttostrN(ThisValue, 4) +
        ' (' + sign(ThisValue - LastValue) + inttostrN(abs(ThisValue - LastValue), 3) + ')'
        );
      LastValue := ThisValue;
      close;
      application.processmessages;
    end;

  end;
  cBELEGE.free;
  EndHourGlass;
end;

procedure TFormLiquiditaet.Button1Click(Sender: TObject);
begin
  RefreshAussenstaende;
end;

end.

