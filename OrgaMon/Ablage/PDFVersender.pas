//
// mmuuhh
//
unit PDFVersender;

interface

uses
  Windows, Messages, SysUtils,
  Variants, Classes, Graphics,
  Controls, Forms, Dialogs,
  ExtCtrls, StdCtrls,

  // Indy
  IB_Components, IdBaseComponent, IdComponent,
  IdTCPConnection, IdTCPClient, IdMessageClient,
  IdPOP3, IdSMTP, idmessage,

  ComCtrls;

type
  TIdMessageWithSize = class(TIdMessage)
  public
    function Size: integer;
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
  end;

  TFormPDFVersender = class(TForm)
    Timer1: TTimer;
    ListBox1: TListBox;
    IdPOP31: TIdPOP3;
    Button1: TButton;
    ListBox2: TListBox;
    Label1: TLabel;
    Label2: TLabel;
    IB_Query2: TIB_Query;
    IB_Query3: TIB_Query;
    IB_Query4: TIB_Query;
    CheckBox2: TCheckBox;
    IdSMTP1: TIdSMTP;
    ProgressBar1: TProgressBar;
    ProgressBar2: TProgressBar;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    procedure Timer1Timer(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure IdPOP31WorkBegin(Sender: TObject; AWorkMode: TWorkMode;
      const AWorkCountMax: Integer);
    procedure IdPOP31WorkEnd(Sender: TObject; AWorkMode: TWorkMode);
    procedure IdSMTP1Work(Sender: TObject; AWorkMode: TWorkMode;
      const AWorkCount: Integer);
    procedure IdSMTP1WorkEnd(Sender: TObject; AWorkMode: TWorkMode);
    procedure IdPOP31Work(Sender: TObject; AWorkMode: TWorkMode;
      const AWorkCount: Integer);
  private
    { Private-Deklarationen }
    InsideService: boolean;
    FirstTimerEventChecked: boolean;
    StartTime: dword;
    outMsg: TIdMessageWithSize;

    procedure Log(s: string);
  public
    { Public-Deklarationen }
  end;

var
  FormPDFVersender: TFormPDFVersender;

implementation

uses
  globals, anfix32, hebuData,
  WordIndex, BaseUpdate, CareTakerClient, eCommerce;

{$R *.dfm}

constructor TIdMessageWithSize.Create(AOwner: TComponent);
begin
  inherited;

end;

destructor TIdMessageWithSize.Destroy;
begin

  inherited;
end;

function TIdMessageWithSize.Size: integer;
var
  MS: TMemoryStream;
begin
(*
  try
    MS := TMemoryStream.create;
    SaveToStream(MS);
    result := MS.size;
    MS.free;
  except
    on e: exception do FormPDFVersender.Log(cERRORText + ' PDF.size: ' + e.message);
  end;
*)
// SaveToFile('C:\msg.eml');
  result := 0;
end;

procedure TFormPDFVersender.Timer1Timer(Sender: TObject);
var
  m: integer;
  inMsg: TIDMessage;
  Fname: string;
  DirEntries: TStringList;
  eMailList: TSearchStringList;
  k: integer;
  MailAddr: string;

  Betreff: string;
  NUMERO: integer;
  PermissionToSend: boolean;
  AllTheFSize: dword;
  cMAILS: TIB_Cursor;

begin
  if NoTimer then
    exit;

  if not (FirstTimerEventChecked) then
  begin
    FirstTimerEventChecked := true;
    if IsParam('-dm') or (AnsiUpperCase(ComputerName) <> AnsiUpperCase(ipdfversender)) then
    begin
      timer1.enabled := false;
      exit;
    end;
  end;

  if not (InSideService) then
  begin
    button1.Enabled := false;
    InsideService := true;
    if FormBaseUpdate.BaseUpdateAbgeschlossen then
    begin
      try
        BeginHourGlass;
        SetPriorityClass(GetCurrentProcess, DWORD(IDLE_PRIORITY_CLASS));

        if (listbox1.Items.count > 0) then
          listbox1.Clear;
        listbox1.Items.Add('Start of Service at ' + secondstostr(secondsget));

        application.processmessages;

        // eMail Liste aufbauen
        eMailList := TSearchStringList.create;

        cMAILS := TIB_Cursor.Create(self);
        with cMAILS do
        begin
          sql.add('select RID, EMAIL from PERSON where');
          sql.add(' (EMAIL IS NOT NULL) AND');
          sql.add(' (EMAIL<>'''')');
          ApiFirst;
          while not (eof) do
          begin
            MailAddr := noblank(ansilowercase(FieldByName('EMAIL').AsString));
            while (MailAddr <> '') do
              eMailList.addobject(nextp(MailAddr, ';'),
                TObject(FieldByName('RID').AsInteger));
            Apinext;
          end;
        end;
        cMAILS.Free;
        eMailList.sort;
        RemoveDuplicates(eMailList);

        listbox1.Items.Add(inttostr(eMailList.count) + ' g�ltige eMail-Adressen ermittelt');

          // sehen, ob es was neues gibt!
        with IdPOP31 do
        begin
          host := nextp(ipdfmail, ',', 0);
          username := nextp(ipdfmail, ',', 1);
          password := nextp(ipdfmail, ',', 2);
          try

            application.processmessages;

            while true do
            begin

              // mail lookup
              connect;
              if (CheckMessages = 0) then
              begin
                disconnect;
                break;
              end;

              // mail fetch header
              inMsg := TIDMessage.create(self);
              OutMsg := TIdMessageWithSize.create(self);
              RetrieveHeader(1, inMsg);
              Delete(1);
              disconnect;

              // log
              listbox1.Items.add(format('%s,%s', [
                inMsg.Subject,
                  inMsg.from.Address]));

              Log('INFO: ' + format('Anfrage "%s" von "%s"', [
                inMsg.Subject,
                  inMsg.from.Address]));

              // check Subject
              Betreff := noblank(inmsg.Subject);
              ersetze(iPDFDokumentbetreff, '', Betreff);

              NUMERO := strtointdef(Betreff, 0);
              if NUMERO > 0 then
              begin

                // prepare answer via "OutLook"
                PermissionToSend := true;

                // prepare answer via "integrated smtp"
                IdSMTP1.AuthenticationType := atLogin;
                IdSMTP1.host := nextp(ipdfsend, ',', 0);
                IdSMTP1.Username := nextp(ipdfmail, ',', 1);
                IdSMTP1.Password := nextp(ipdfmail, ',', 2);
                outMsg.from.name := nextp(ipdfsend, ',', 1);
                outMsg.from.address := nextp(ipdfsend, ',', 2);

  (*
           := '[' + nextp(ToMailLines[INdex], ';', 0) + ']';
          outMsg.Recipients.EMailAddresses := ';;';
  *)

                // find customer
                k := eMailList.indexof(ansilowercase(inmsg.from.Address));
                if (k <> -1) then
                begin

                  // obtain eMail-List from Customer
                  with IB_Query4 do
                  begin
                    ParamByName('CROSSREF').AsInteger := integer(eMailList.objects[k]);
                    open;
                    MailAddr := noblank(FieldByName('EMAIL').AsString);
                    close;
                  end;

                  outMsg.Recipients.EMailAddresses := nextp(MailAddr, ';');
                  while (MailAddr <> '') do
                    outMsg.Recipients.EMailAddresses := outMsg.Recipients.EMailAddresses + ';' + nextp(MailAddr, ';');

                  // erst mal sehen, ob Anfrage eine Artikelnummer ist
                  IB_Query2.ParamByName('CROSSREF').AsInteger := NUMERO;
                  IB_Query2.Open;
                  if IB_Query2.Eof then
                  begin
                    //
                    Log('ERROR: ' + inttostr(NUMERO) + ' ist kein Artikel!');
                    PermissionToSend := false;
                  end else
                  begin
                    // ok, es ist ein Artikel
                    DirEntries := TStringList.create;
                    FName := iPDFPathPublicApp + inttostr(NUMERO) + '.pdf'; // ev. wieder mal eine Maske '*.pdf'
                                                                 // A.Knam: im Moment nicht notwendig
                    dir(Fname, DirEntries);
                    if (DirEntries.count > 0) then
                    begin

                      // Summe der Dateigr�ssen bestimmen
                      AllTheFSize := 0;
                      for m := 0 to pred(DirEntries.count) do
                      begin
                        if (m = 5) then
                          break;
                        inc(AllTheFSize, FSize(iPDFPathPublicApp + Direntries[m]));
                      end;
                      progressbar1.max := round(AllTheFSize * 1.4);

                      // Gr�ssen-Limit
                      if (AllTheFSize > 8 * 1024 * 1024) then
                      begin
                        // ups, leider viel zu gross!!!
                        outMsg.CCList.add.Address := iPDFAdmin;
                        outMsg.Subject := 'Re:Probestimme ' + inttostr(NUMERO);
                        outMsg.body.add('Leider sind die angeforderten PDF-Dateien viel zu umfassend (>8 MByte)!');
                        outMsg.Body.add('');
                        outMsg.Body.add('Wir k�mmern uns um das Problem.');
                        outMsg.Body.add('');
                        outMsg.Body.add('');
                        outMsg.Body.add('Ihr HeBu-Team');
                        Log('WARNING: ' + iPDFPathPublicApp + nextp(inmsg.Subject, ' ', 1) + ' zu gross!');
                      end else
                      begin

                        // log Eintrag machen
                        IB_Query3.Open;
                        with IB_Query3 do
                        begin
                          Open;
                          insert;
                          FieldByName('ARTIKEL_R').AsInteger := IB_Query2.FieldByNAme('RID').AsInteger;
                          FieldByName('PERSON_R').AsInteger := integer(eMailList.objects[k]);
                          FieldByName('INFO').AsString := 'PDF';
                          post;
                          close;
                        end;

                        // eMail Text aufbereiten
                        outMsg.Body.Add(inttostr(NUMERO) + ' ' + IB_Query2.FieldByName('TITEL').AsString);
                        outMsg.Body.Add('');
                        outMsg.Body.Add('');
                        outMsg.Body.Add('Ihr HeBu-Team');
                        outMsg.Subject := 'Die mini-scores sind da ...';
                        for m := 0 to pred(DirEntries.count) do
                        begin
                          if (m = 5) then
                            break;
                          TIdAttachment.create(outMsg.MessageParts, iPDFPathPublicApp + Direntries[m]);
                        end;

                      end;

                    end else
                    begin
                      outMsg.CCList.Add.address := iPDFAdmin;
                      outMsg.Subject := 'Re:Probestimme ' + inttostr(NUMERO);
                      outMsg.body.add('Leider konnten wir die angeforderten PDF-Dateien nicht finden!');
                      outMsg.body.add('');
                      outMsg.body.add('Wir k�mmern uns um das Problem.');
                      outMsg.body.add('');
                      outMsg.body.add('');
                      outMsg.body.add('Ihr HeBu-Team');
                      Log('WARNING: ' + iPDFPathPublicApp + nextp(inmsg.Subject, ' ', 1) + ' nicht gefunden!');
                    end;
                    DirEntries.free;
                  end;
                  IB_Query2.Close;
                end else
                begin
                  // keine Dateien gefunden
                  repeat
                    if pos('@', inmsg.from.Address) > 0 then
                      if pos('.', inmsg.from.Address) > 0 then
                      begin
                        outMsg.Recipients.EmailAddresses := inmsg.from.Address;
                        Log('INFO: ' + inmsg.from.Address + ' ist unbekannt!');
                        outMsg.body.add('Ihre eMail Adresse ist uns leider unbekannt. Bitte rufen Sie uns an, um kostenlos und unverbindlich Ihre eMail Adresse zu registrieren.');
                        outMsg.Subject := 'Versenden der angeforderten Datei nicht m�glich!';
                        break;
                      end;
                    Log('WARNUNG: Antwort-Adresse "' + inmsg.from.Address + '": Syntax ung�ltig!');
                  until true;
                end;
                application.processmessages;
                try
                  if PermissionToSend then
                    if CheckBox2.Checked then
                      if (outMsg.Recipients.Count > 0) then
                      begin
                        IdSMTP1.connect;
                        IdSMTP1.send(outMsg);
                        IdSMTP1.disconnect;
                      end;
                except
                  on e: exception do Log(cERRORText + ' PDF.send: ' + e.message);
                end;
                application.processmessages;
              end else
              begin
                // Subject format fail
                Log('WARNUNG: Betreff hat falsches Format -> ignoriere Mail!');
              end;
              FreeAndNil(inMsg);
              FreeAndNil(OutMsg);
              if IdSMTP1.connected then
                IdSMTP1.disconnect;
            end;
          except
            on e: exception do Log(cERRORText + ' PDF.eval: ' + e.message);
          end;
        end;
        eMailList.free;
      except
        on e: exception do Log(cERRORText + ' PDF: ' + e.message);
      end;
      if IdSMTP1.connected then
        IdSMTP1.disconnect;
      if IdPOP31.connected then
        IdPOP31.disconnect;
      listbox1.Items.Add('End of Service at ' + secondstostr(secondsget));
      SetPriorityClass(GetCurrentProcess, DWORD(NORMAL_PRIORITY_CLASS));
      EndHourGlass;
    end;
    InsideService := false;
    button1.Enabled := true;
  end;
end;

procedure TFormPDFVersender.Button1Click(Sender: TObject);
begin
  Timer1Timer(Sender);
end;

procedure TFormPDFVersender.Log(s: string);
begin
  listbox2.Items.add(s);
  AppendStringsToFile(s, DiagnosePath + 'PDF_Mailer_' + inttostr(DateGet) + '.txt');
  if (pos(cERRORText, s) = 1) then
    CareTakerLog(s);
end;

procedure TFormPDFVersender.IdPOP31WorkBegin(Sender: TObject;
  AWorkMode: TWorkMode; const AWorkCountMax: Integer);
begin
  progressbar2.max := AWorkCountMax;
end;

procedure TFormPDFVersender.IdPOP31WorkEnd(Sender: TObject;
  AWorkMode: TWorkMode);
begin
  progressbar2.position := 0;
end;

procedure TFormPDFVersender.IdPOP31Work(Sender: TObject;
  AWorkMode: TWorkMode; const AWorkCount: Integer);
begin
  progressbar2.position := AWorkCount;
  if frequently(StartTime, 222) then
    application.processmessages;
end;

procedure TFormPDFVersender.IdSMTP1Work(Sender: TObject;
  AWorkMode: TWorkMode; const AWorkCount: Integer);
begin
  if frequently(StartTime, 222) then
  begin
    progressbar1.position := AWorkCount;
    label5.caption := inttostr(AWorkCount);
    application.processmessages;
  end;
end;

procedure TFormPDFVersender.IdSMTP1WorkEnd(Sender: TObject;
  AWorkMode: TWorkMode);
begin
  progressbar1.position := 0;
end;


end.

