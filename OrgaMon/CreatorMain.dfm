�
 TFORMCREATORMAIN 0�  TPF0TFormCreatorMainFormCreatorMainLeft� Top BorderStylebsToolWindowCaptionCryptClientHeight�ClientWidthbColor	clBtnFaceFont.CharsetANSI_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameVerdana
Font.Style OldCreateOrder	OnClose	FormCloseOnCreate
FormCreatePixelsPerInch`
TextHeight TLabelLabel2LeftTop$WidthGHeightCaptionMUS-&Quelle:  TLabelLabel3Left!Top|WidthkHeightCaptionCD ROM-&Ausgabe:  TLabelLabel4Left Top(WidthCHeightCaption
Datenbank:  TLabelLabel5Left"Top�Width=HeightAAutoSizeCaptionLabel5WordWrap	  TLabelLabel6Left Top@WidthMHeightCaption   Wortanfänge:  TLabelLabel7Left TopPWidthJHeightCaptionKomponisten  TLabelLabel8Left Top`WidthXHeightCaption   Länder, Verlage  TLabelLabel1LeftTopWidthHeightCaption%   1) Noten für die CDR zusammenstellenFont.CharsetANSI_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameVerdana
Font.StylefsBold 
ParentFont  TLabelLabel9LeftTopWidth9HeightCaption,   2) Artikel-, Händler- Daten neu aufbereitenFont.CharsetANSI_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameVerdana
Font.StylefsBold 
ParentFont  TLabelLabel10Left� Top|Width,HeightCaptionLabel10  TLabelLabel11LeftTop Width�HeightCaption=   3) Berichte einsehen und Passwort für eine neue CDR erzeugenFont.CharsetANSI_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameVerdana
Font.StylefsBold 
ParentFont  TLabelLabel12Left
ToppWidthHeightCaption(4) CDR brennen (durch externes Programm)  TLabelLabel13Left0Top0WidthHeightCaption%  TButtonButton17Left TopWidth� HeightCaptionBericht ansehenTabOrderOnClickButton17Click  TEditEdit1LeftpTop"Width9HeightTabOrder Text OnExit	Edit1Exit  TButtonButton4LeftTophWidthQHeightCaption&EndeTabOrderOnClickButton4Click  TButtonButton5Left�Top(Width� Height1CaptionCD &OKFont.CharsetANSI_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameVerdana
Font.StylefsBold 
ParentFontTabOrderOnClickButton5Click  TCheckListBoxCheckListBox1Left Top@Width�Height� BorderStylebsNoneColorclInfoBkCtl3D	Font.CharsetANSI_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameMS Sans Serif
Font.Style 
ItemHeightParentCtl3D
ParentFontTabOrder  TButtonButton1Left Top0Width� HeightCaptionHistorie ansehenTabOrderOnClickButton1Click  TButtonButton2Left�TopDWidth� HeightCaption   <-- Texte ändernTabOrderOnClickButton2Click  TButtonButton6Left�TophWidth� HeightCaption
<-- leerenTabOrderOnClickButton6Click  TButtonButton3Left�Top Width!HeightCaption-->TabOrderOnClickButton3Click  TButtonButton7Left�Top WidthYHeightCaption   Texte ändernTabOrderOnClickButton7Click  TButtonButton8Left8Top Width)HeightCaption   � Font.CharsetSYMBOL_CHARSET
Font.ColorclWindowTextFont.Height�	Font.Name	Wingdings
Font.StylefsBold 
ParentFontTabOrder	OnClickButton8Click  TProgressBarProgressBar1Left#Top�Width�HeightTabOrder
  TButtonButton10Left� Top WidthIHeightCaptionImportTabOrderOnClickButton10Click  TButtonButton9LeftTop�WidthQHeightCaption	AbbrechenTabOrderOnClickButton9Click  TButtonButton11Left� Top<WidthIHeightCaptionImportTabOrder  TButtonButton13Left� TopXWidthIHeightCaptionExportTabOrderOnClickButton13Click  TButtonButton12Left�TopHWidth� Height(Caption	&ERZEUGENFont.CharsetANSI_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameVerdana
Font.StylefsBold 
ParentFontTabOrderOnClickButton12Click  	TCheckBox	CheckBox1Left�TopWidth� HeightCaptionals Demo VersionTabOrder  TEditEdit8Left� Top"WidthQHeightTabOrderTextEdit8OnExit	Edit8Exit  TButtonButton18Left� TopXWidth� HeightCaptionHEntry.txt erzeugenTabOrderOnClickButton18Click  TButtonButton19Left TopHWidth� HeightCaptionHEntry ansehenTabOrderOnClickButton19Click  	TCheckBox	CheckBox2Left�TopWidthaHeightCaption   für .\CD-RChecked	State	cbCheckedTabOrderOnClickCheckBox2Click  	TCheckBox	CheckBox3Left�Top0WidthaHeightCaption
Umfang ca.TabOrder  TEditEdit2LeftTop,Width"HeightTabOrderText20  	TIB_Query	IB_Query1DatabaseName192.168.115.1:test.fdbIB_Connection"DataModuleDatenbank.IB_Connection1SQL.Stringsselect *from ARTIKEL     Left0Topx  	TIB_Query	IB_Query2DatabaseName192.168.115.1:test.fdbIB_Connection"DataModuleDatenbank.IB_Connection1SQL.StringsSELECT *FROM SORTIMENT LeftPTopx  	TIB_Query	IB_Query3DatabaseName192.168.115.1:test.fdbIB_Connection"DataModuleDatenbank.IB_Connection1SQL.StringsSELECT *FROM PERSONWHERE RID=:CROSSREF LeftpTopx  	TIB_Query	IB_Query4DatabaseName192.168.115.1:test.fdbIB_Connection"DataModuleDatenbank.IB_Connection1SQL.StringsSELECT *FROM ANSCHRIFTWHERE RID=:CROSSREF Left� Topx   