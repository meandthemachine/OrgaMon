object FormPersonenExport: TFormPersonenExport
  Left = 47
  Top = 99
  Caption = 'Import / Export'
  ClientHeight = 573
  ClientWidth = 519
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Verdana'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object GroupBox1: TGroupBox
    Left = 0
    Top = 0
    Width = 519
    Height = 573
    Align = alClient
    Caption = 'Mailing Export'
    TabOrder = 0
    object Label1: TLabel
      Left = 384
      Top = 296
      Width = 37
      Height = 13
      Caption = 'Label1'
    end
    object Label2: TLabel
      Left = 16
      Top = 296
      Width = 37
      Height = 13
      Caption = 'Label2'
    end
    object Label3: TLabel
      Left = 128
      Top = 280
      Width = 37
      Height = 13
      Caption = 'Label3'
    end
    object Label4: TLabel
      Left = 16
      Top = 280
      Width = 97
      Height = 13
      Caption = 'gefunden bisher:'
    end
    object Label5: TLabel
      Left = 16
      Top = 338
      Width = 62
      Height = 13
      Caption = 'Ergebnisse'
    end
    object SpeedButton1: TSpeedButton
      Left = 40
      Top = 94
      Width = 23
      Height = 22
      Hint = 'Liste einlesen aus einer OLAP Abfrage'
      Glyph.Data = {
        46050000424D460500000000000036040000280000000F000000110000000100
        0800000000001001000000000000000000000001000000010000FFFFFF00FCFC
        FB00F5F8F500F3F7F300F2F9F000E6F3E400E5F2E300E4ECE300E5E7E500E4EC
        E200DCEED900DEE8DD00DBE6DA00D9E9D600DADED900D7DBD700D1E9CD00CAE7
        C700C8E5C400CBD5CA00C9DAC700C7D7C400CBCFC900C8D8C600C2E1BE00C1E2
        BD00C0E1BC00BBDFB600B8DDB200B6DCB100B5DCB000B7CDB400B2DAAD00B0DA
        AA00B9C0B800B5CCB200A6D49F00A4D39D00ABB3AA00A7AFA600A2BE9E00A1BD
        9C0094CD8C00A0AA9F009FA99E009EA89D0091B38C0087C67E0098A297008FB1
        8900919B8F00909A8E008F9A8E008F998D0087AC810078C66C007DA777008590
        83006AB95F00759D70007B887A007987790062B4560061BC53005EB950005CB9
        4F00699863005AB44D00679660005AB44E005AB04D005AB44E005AB34D005AB3
        4D0059B04C0059B24C005AB24C0058B04B0058AF4B0058B14B0057AE4A0056AC
        490057B04A0058B04A0054B4460052AD450052AD440050AC430051AC430053A5
        470051AC430050AB420050AD43004FAB42004FAB4200657362004EA841004EA7
        41004E9C43004DA8410055894D0053874B004A923F004B86430046963A004591
        3B0045883A0053645100487E4000418237003E7E35003F7A37003E7C35003D7C
        34003E7C34003F7A36003D7A34003C7934003D7834003C7933003D7934003B78
        33003C7733003A7632003C7833003A7732003B7632003A7432003A7431003973
        3100397231003A76310038752F003970300039703000376F2E0035722C003472
        2C0035722C00356C2D00346C2D00336F2B00346F2B00336E2A00336C2A00326C
        2A00326B290031692900316A290031692900306129002F6627002A5424003341
        31002D412A0025501F0022461D00233821001C3A180018301400192E1700162C
        1300152C1200152B1200142B1200152A1200142B1100142A110014291000142A
        100015291200142812001428110012220F00132710001326100010210E001124
        0E000F1E0D000E1F0C000E1F0C000D1D0B000D1D0B000C1C0B000B1A0A000C1F
        0D000B1A0A000A190A0009180900091508000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0513070000000000000000000000001137879D1F0000000000000000112A3841
        4187B2AD993B26000000053A5D5D4E4E4184B29EADADAD9A0E00115D4E4E4E4E
        4187ADAD9EADADAD2600115D4E4E414E4187B29EADAD9EAD260018414E4E4E4E
        4187B2AD9EADADAD2C00185D4E4E4E4E4187B29EADAD9EAD2C001B4E4E4E4E4E
        4187B2AD9EADADAD2C00204E4E4E4E4E3A87B29EADAD9EAD34001B5D4E4E4E4E
        6A6E9CA0A0ADADAD3400204E4E626E6E6E876E6E989CA0B23400246A6E6E876E
        876E6E6E6E84879E3C000E408497876E6E6E6E6E978484641300000013262F6C
        878784673626100000000000000000001F2F2600000000000000000000000000
        00000000000000000000}
      ParentShowHint = False
      ShowHint = True
      OnClick = SpeedButton1Click
    end
    object Button1: TButton
      Left = 432
      Top = 308
      Width = 75
      Height = 25
      Caption = 'Start'
      TabOrder = 0
      OnClick = Button1Click
    end
    object ProgressBar1: TProgressBar
      Left = 10
      Top = 312
      Width = 415
      Height = 16
      TabOrder = 1
    end
    object CheckBox1: TCheckBox
      Left = 16
      Top = 24
      Width = 257
      Height = 17
      Caption = 'letzter Kontakt zumindest am'
      TabOrder = 2
    end
    object Edit2: TEdit
      Left = 224
      Top = 22
      Width = 121
      Height = 21
      TabOrder = 3
      Text = 'Edit2'
      OnExit = Edit2Exit
    end
    object CheckBox2: TCheckBox
      Left = 16
      Top = 40
      Width = 97
      Height = 17
      Caption = 'nur MAILING'
      TabOrder = 4
    end
    object CheckBox4: TCheckBox
      Left = 16
      Top = 56
      Width = 433
      Height = 17
      Caption = 'keine RECHNUNGSEMPFAENGER'
      TabOrder = 5
    end
    object CheckBox6: TCheckBox
      Left = 16
      Top = 120
      Width = 305
      Height = 17
      Caption = 'freie SQL-Abfrage (anstelle von "alle")'
      TabOrder = 6
      OnClick = CheckBox6Click
    end
    object Memo1: TMemo
      Left = 34
      Top = 140
      Width = 471
      Height = 133
      Enabled = False
      Lines.Strings = (
        'select '
        ' rid'
        'from '
        ' person'
        'where'
        ' vorname='#39'Andreas'#39)
      ScrollBars = ssVertical
      TabOrder = 7
    end
    object Button2: TButton
      Left = 24
      Top = 370
      Width = 350
      Height = 25
      Caption = 'Adressen.txt'
      TabOrder = 8
      OnClick = Button2Click
    end
    object Button3: TButton
      Left = 24
      Top = 394
      Width = 350
      Height = 25
      Caption = 'Aussortiert wegen Mailing.txt'
      TabOrder = 9
      OnClick = Button3Click
    end
    object Button4: TButton
      Left = 24
      Top = 418
      Width = 350
      Height = 25
      Caption = 'Aussortiert wegen Land.txt'
      TabOrder = 10
      OnClick = Button4Click
    end
    object Button5: TButton
      Left = 24
      Top = 442
      Width = 350
      Height = 25
      Caption = 'Aussortiert wegen Kontakt.txt'
      TabOrder = 11
      OnClick = Button5Click
    end
    object Button6: TButton
      Left = 24
      Top = 466
      Width = 350
      Height = 25
      Caption = 'Aussortiert wegen Rechnungsempf'#228'nger.txt'
      TabOrder = 12
      OnClick = Button6Click
    end
    object Button7: TButton
      Left = 24
      Top = 490
      Width = 350
      Height = 25
      Caption = 'DoppelteNamen.txt'
      TabOrder = 13
      OnClick = Button7Click
    end
    object Button8: TButton
      Left = 24
      Top = 514
      Width = 350
      Height = 25
      Caption = 'DoppelteNamenOrt.txt'
      TabOrder = 14
      OnClick = Button8Click
    end
    object Button9: TButton
      Left = 24
      Top = 538
      Width = 350
      Height = 25
      Caption = 'Diagnose.txt'
      TabOrder = 15
      OnClick = Button9Click
    end
    object CheckBox3: TCheckBox
      Left = 16
      Top = 76
      Width = 225
      Height = 17
      Caption = 'Ergebnismenge aus OLAP Anfrage'
      TabOrder = 16
    end
  end
  object IB_Query1: TIB_Query
    DatabaseName = '192.168.115.90:andreas.fdb'
    IB_Connection = DataModuleHeBu.IB_Connection1
    SQL.Strings = (
      'SELECT *'
      'FROM PERSON')
    ColorScheme = False
    KeyLinks.Strings = (
      'RID')
    KeyLinksAutoDefine = False
    KeyRelation = 'PERSON'
    MasterSearchFlags = [msfOpenMasterOnOpen, msfSearchAppliesToMasterOnly]
    RequestLive = True
    BufferSynchroFlags = []
    FetchWholeRows = True
    Left = 392
    Top = 104
  end
  object IB_Query2: TIB_Query
    DatabaseName = '192.168.115.90:andreas.fdb'
    IB_Connection = DataModuleHeBu.IB_Connection1
    SQL.Strings = (
      'SELECT *'
      'FROM ANSCHRIFT'
      'WHERE RID=:CROSSREF')
    ColorScheme = False
    KeyLinks.Strings = (
      'RID')
    KeyLinksAutoDefine = False
    KeyRelation = 'ANSCHRIFT'
    MasterSearchFlags = [msfOpenMasterOnOpen, msfSearchAppliesToMasterOnly]
    RequestLive = True
    BufferSynchroFlags = []
    FetchWholeRows = True
    Left = 424
    Top = 104
  end
  object IB_Query3: TIB_Query
    DatabaseName = '192.168.115.90:andreas.fdb'
    IB_Connection = DataModuleHeBu.IB_Connection1
    SQL.Strings = (
      'SELECT ANLAGE'
      'FROM BELEG'
      'WHERE (PERSON_R=:CROSSREF) OR'
      '      (LIEFERANSCHRIFT_R=:CROSSREF) OR'
      '      (RECHNUNGSANSCHRIFT_R=:CROSSREF)'
      'ORDER BY ANLAGE DESCENDING')
    ColorScheme = False
    MasterSearchFlags = [msfOpenMasterOnOpen, msfSearchAppliesToMasterOnly]
    BufferSynchroFlags = []
    FetchWholeRows = True
    Left = 456
    Top = 105
  end
  object OpenDialog1: TOpenDialog
    DefaultExt = 'CSV'
    Filter = 'Semikolon seperierte Textdatei (*.csv)|*.csv'
    Left = 408
  end
end
