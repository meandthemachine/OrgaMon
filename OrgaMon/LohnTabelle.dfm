object FormLohntabelle: TFormLohntabelle
  Left = 272
  Top = 328
  Caption = 'FormLohntabelle'
  ClientHeight = 550
  ClientWidth = 830
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Courier New'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 16
  object PageControl1: TPageControl
    Left = 0
    Top = 0
    Width = 824
    Height = 545
    ActivePage = TabSheet3
    TabOrder = 0
    object TabSheet1: TTabSheet
      Caption = 'Kalkulation'
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      object Label1: TLabel
        Left = 16
        Top = 109
        Width = 80
        Height = 16
        Caption = 'Monatslohn'
      end
      object Label2: TLabel
        Left = 264
        Top = 96
        Width = 48
        Height = 16
        Caption = 'Label2'
      end
      object Label3: TLabel
        Left = 79
        Top = 179
        Width = 88
        Height = 16
        Caption = 'Mindestlohn'
      end
      object Label4: TLabel
        Left = 408
        Top = 224
        Width = 192
        Height = 16
        Caption = '(ansonsten Objekt-L'#246'hne)'
      end
      object Label5: TLabel
        Left = 232
        Top = 106
        Width = 8
        Height = 16
        Caption = #8364
      end
      object Label6: TLabel
        Left = 263
        Top = 179
        Width = 8
        Height = 16
        Caption = #8364
      end
      object Label7: TLabel
        Left = 264
        Top = 117
        Width = 48
        Height = 16
        Caption = 'Label7'
      end
      object Label8: TLabel
        Left = 264
        Top = 136
        Width = 48
        Height = 16
        Caption = 'Label8'
      end
      object Label9: TLabel
        Left = 63
        Top = 232
        Width = 104
        Height = 16
        Caption = 'mind Fahrzeit'
      end
      object Label10: TLabel
        Left = 176
        Top = 232
        Width = 56
        Height = 16
        Caption = 'Label10'
      end
      object Label11: TLabel
        Left = 46
        Top = 208
        Width = 120
        Height = 16
        Caption = 'max Arbeitszeit'
      end
      object Label12: TLabel
        Left = 176
        Top = 209
        Width = 56
        Height = 16
        Caption = 'Label12'
      end
      object Image1: TImage
        Left = 16
        Top = 280
        Width = 45
        Height = 46
        AutoSize = True
      end
      object Label13: TLabel
        Left = 112
        Top = 368
        Width = 128
        Height = 16
        Caption = 'Abwesenheitszeit'
      end
      object Label14: TLabel
        Left = 112
        Top = 280
        Width = 104
        Height = 16
        Caption = 'Arbeitszeit 1'
      end
      object Label15: TLabel
        Left = 112
        Top = 304
        Width = 104
        Height = 16
        Caption = 'Arbeitszeit 2'
      end
      object Label16: TLabel
        Left = 112
        Top = 328
        Width = 64
        Height = 16
        Caption = 'Fahrzeit'
      end
      object Label17: TLabel
        Left = 40
        Top = 400
        Width = 200
        Height = 16
        Caption = 'Lohnreste bei Mindestlohn'
      end
      object Label18: TLabel
        Left = 40
        Top = 424
        Width = 144
        Height = 16
        Caption = 'Lohn Effektiv Satz'
      end
      object Button1: TButton
        Left = 280
        Top = 16
        Width = 224
        Height = 24
        Caption = 'berechnen'
        TabOrder = 0
        OnClick = Button1Click
      end
      object Edit1: TEdit
        Left = 104
        Top = 104
        Width = 121
        Height = 26
        TabOrder = 1
        Text = 'Edit1'
        OnChange = Edit1Change
      end
      object Panel1: TPanel
        Left = 8
        Top = 166
        Width = 712
        Height = 2
        TabOrder = 2
      end
      object Edit2: TEdit
        Left = 176
        Top = 176
        Width = 81
        Height = 26
        TabOrder = 3
        Text = '7,72'
      end
      object CheckBox1: TCheckBox
        Left = 416
        Top = 200
        Width = 136
        Height = 16
        Caption = 'Einheitslohn'
        Checked = True
        State = cbChecked
        TabOrder = 4
      end
      object Panel2: TPanel
        Left = 8
        Top = 264
        Width = 709
        Height = 1
        TabOrder = 5
      end
      object StaticText1: TStaticText
        Left = 248
        Top = 280
        Width = 96
        Height = 20
        AutoSize = False
        BorderStyle = sbsSunken
        Caption = '##:##:##'
        TabOrder = 6
      end
      object StaticText2: TStaticText
        Left = 248
        Top = 304
        Width = 96
        Height = 21
        AutoSize = False
        BorderStyle = sbsSunken
        Caption = '##:##:##'
        TabOrder = 7
      end
      object StaticText3: TStaticText
        Left = 248
        Top = 328
        Width = 96
        Height = 20
        AutoSize = False
        BorderStyle = sbsSunken
        Caption = '##:##:##'
        TabOrder = 8
      end
      object StaticText4: TStaticText
        Left = 248
        Top = 368
        Width = 96
        Height = 21
        AutoSize = False
        BorderStyle = sbsSunken
        Caption = '##:##:##'
        TabOrder = 9
      end
      object StaticText5: TStaticText
        Left = 248
        Top = 424
        Width = 121
        Height = 20
        AutoSize = False
        BorderStyle = sbsSunken
        Caption = '0,00'
        TabOrder = 10
      end
      object StaticText6: TStaticText
        Left = 368
        Top = 280
        Width = 120
        Height = 20
        AutoSize = False
        BorderStyle = sbsSunken
        Caption = '0,00'
        TabOrder = 11
      end
      object StaticText7: TStaticText
        Left = 368
        Top = 304
        Width = 120
        Height = 21
        AutoSize = False
        BorderStyle = sbsSunken
        Caption = '0,00'
        TabOrder = 12
      end
      object StaticText8: TStaticText
        Left = 248
        Top = 400
        Width = 121
        Height = 21
        AutoSize = False
        BorderStyle = sbsSunken
        Caption = '0,00'
        TabOrder = 13
      end
      object StaticText9: TStaticText
        Left = 512
        Top = 304
        Width = 113
        Height = 21
        AutoSize = False
        BorderStyle = sbsSunken
        Caption = '##:##:##'
        TabOrder = 14
      end
      object CheckBox2: TCheckBox
        Left = 416
        Top = 176
        Width = 193
        Height = 17
        Caption = 'Arbeitszeiten runden'
        TabOrder = 15
      end
      object Edit3: TEdit
        Left = 112
        Top = 8
        Width = 120
        Height = 26
        TabOrder = 16
        Text = '6,00'
      end
      object Edit4: TEdit
        Left = 112
        Top = 32
        Width = 120
        Height = 26
        TabOrder = 17
        Text = '6,50'
      end
      object CheckBox3: TCheckBox
        Left = 16
        Top = 328
        Width = 72
        Height = 16
        Caption = 'aktiv'
        TabOrder = 18
      end
      object CheckBox4: TCheckBox
        Left = 280
        Top = 48
        Width = 313
        Height = 17
        Caption = 'Ergebnis anzeigen'
        Checked = True
        State = cbChecked
        TabOrder = 19
      end
    end
    object TabSheet2: TTabSheet
      Caption = 'Migration'
      ImageIndex = 1
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      object Label19: TLabel
        Left = 32
        Top = 16
        Width = 32
        Height = 16
        Caption = 'Jahr'
      end
      object Edit5: TEdit
        Left = 32
        Top = 40
        Width = 552
        Height = 26
        TabOrder = 0
        Text = 'G:\cunz\putzfr\2002-11-15\'
      end
      object Button2: TButton
        Left = 32
        Top = 72
        Width = 312
        Height = 25
        Caption = 'Migration aus Lohn I'
        TabOrder = 1
        OnClick = Button2Click
      end
      object ListBox1: TListBox
        Left = 32
        Top = 112
        Width = 744
        Height = 369
        ItemHeight = 18
        TabOrder = 2
      end
      object Edit6: TEdit
        Left = 72
        Top = 8
        Width = 121
        Height = 26
        TabOrder = 3
        Text = '2000'
      end
    end
    object TabSheet3: TTabSheet
      Caption = 'Buchungs Kalkulation'
      ImageIndex = 2
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      object Image2: TImage
        Left = 762
        Top = 22
        Width = 54
        Height = 22
        Cursor = crHandPoint
        AutoSize = True
        Picture.Data = {
          07544269746D61704E0E0000424D4E0E00000000000036000000280000003600
          0000160000000100180000000000180E0000C40E0000C40E0000000000000000
          0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFF0000FFFFFF0000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000FFFFFF0000FFFFFF000000ECECECECECECECECECECECECECECECEC
          ECECECECECECECECECECECECECECECECECECECECECECECECECECECECECECECEC
          ECECECECECECECECECECECECECECECECECECECECECECECECECECECECECECECEC
          ECECECECECECECECECECECECECECECECECECECECECECECECECECECECECECECEC
          ECECECECECECECECECECECECECECECECECECECECECECECECECECECECECECECEC
          ECECECECECEC000000FFFFFF0000FFFFFF000000ECECECECECECECECECECECEC
          ECECECECECECECECECECECECECECECECECECECECECECECECECECECECECECECEC
          ECECECECECECECECECECECECECECECECECECECECECECECECECECECECECECECEC
          ECECECECECECECECECECECECECECECECECECECECECECECECECECECECECECECEC
          ECECECECECECECECECECECECECECECECECECECECECECECECECECECECECECECEC
          ECECECECECECECECECEC000000FFFFFF0000FFFFFF000000ECECECECECECECEC
          ECECECECECECECECECECDFDFDFB1B1B10902040802030802030A0204BEBEBEE6
          E6E6ECECECECECECECECECECECECECECECECECECECECECECECECECECECECECEC
          ECECECECECECECECECECECECECECECECECECECECECECECECECECECECECECECEC
          ECECECECECECECECECECECECECECECECECECECECECECECECECECECECECECECEC
          ECECECECECECECECECECECECECEC000000FFFFFF0000FFFFFF000000ECECECEC
          ECECECECECECECECECECECB2B2B2050402110C06613E1A8B582D7B4C23482A11
          0D0803070503CDCDCDECECECECECECECECECECECECECECECECECECECECECECEC
          ECECECECECECECECECECECECECECECECECECECECECECECECECECECECECECECEC
          ECECECECECECECECECECECECECECECECECECECECECECECECECECECECECECECEC
          ECECECECECECECECECECECECECECECECECEC000000FFFFFF0000FFFFFF000000
          ECECECECECECECECECECECECAFAFAF0F0B05734A25BA7D37C5813DD09671C596
          71AF6D328A51213B210F0E0905CDCDCDECECECECECECECECECECECECECECECEC
          ECEC000000ECECECECECECECECECECECECECECEC000000ECECECECECEC000000
          ECECECECECEC000000ECECECECECEC000000ECECECECECECECECEC0000000000
          00000000ECECECECECECECECECECECECECECECECECEC000000FFFFFF0000FFFF
          FF000000ECECECECECECECECECD3D3D30605047C5C34D79451DA8C47D08C5CDA
          B6A6DAAB9BBB773DB06D329E5D263B210F070503E6E6E6ECECECECECECECECEC
          ECECECECECEC000000ECECECECECECECECECECECECECECEC000000ECECECECEC
          EC000000ECECECECECEC000000ECECECECECEC000000ECECECECECEC000000EC
          ECECECECECECECEC000000ECECECECECECECECECECECECECECEC000000FFFFFF
          0000FFFFFF000000ECECECECECECECECEC9191911A140DD8A261DAA15CDA9652
          D08C5CD08C71D08C5CBB7732B07732B06D328A51210D0803BEBEBEECECECECEC
          ECECECECECECECECECEC000000ECECECECECECECECECECECECECECEC000000EC
          ECECECECEC000000ECECECECECEC000000ECECECECECEC000000ECECECECECEC
          000000ECECECECECECECECECECECECECECECECECECECECECECECECECECEC0000
          00FFFFFF0000FFFFFF000000ECECECECECECE5E5E5060402957D57E5B67CE5AB
          67DAA15CD09667DAB6B0E5B691C58147BB7732B07732AF6D32482A11090204EC
          ECECECECECECECECECECECECECEC000000ECECECECECECECECECECECECECECEC
          000000ECECECECECEC000000ECECECECECEC000000ECECECECECEC000000ECEC
          ECECECEC000000000000000000000000000000ECECECECECECECECECECECECEC
          ECEC000000FFFFFF0000FFFFFF000000ECECECECECECCDCDCD040302D0B17EE5
          C086E5B67CE5AB67DAA171DAC0A6EFD5D0DAA171C5813DBB7732B077327B4C23
          050102E5E5E5ECECECECECECECECECECECEC000000ECECECECECECECECECECEC
          ECECECEC000000ECECECECECEC000000ECECECECECEC000000ECECECECECEC00
          0000ECECECECECEC000000ECECECECECECECECEC000000ECECECECECECECECEC
          ECECECECECEC000000FFFFFF0000FFFFFF000000ECECECECECECC7C7C7040304
          D8B78CEFCB91E5C086E5B67CDAAB67DAA171E5C0B0EFCBC5DA8C67C5813DBB77
          32825825050102E2E2E2ECECECECECECECECECECECEC00000000000000000000
          0000000000000000000000ECECECECECEC000000ECECECECECEC000000ECECEC
          ECECEC000000ECECECECECEC000000ECECECECECECECECEC000000ECECECECEC
          ECECECECECECECECECEC000000FFFFFF0000FFFFFF000000ECECECECECECE0E0
          E0050305AE9B80EFCB9BE5B691E5B686E5B691DAAB67DAA171EFD5DADAA191D0
          8147C5813D613E1A080203ECECECECECECECECECECECECECECEC000000ECECEC
          ECECECECECECECECECECECEC000000ECECECECECEC000000ECECECECECEC0000
          00ECECEC000000000000000000ECECECECECEC000000000000000000ECECECEC
          ECECECECECECECECECECECECECEC000000FFFFFF0000FFFFFF000000ECECECEC
          ECECECECEC7D7D7D231E1CE9D0ACEFCB9BEFCBB0EFE0E5EFCBB0E5C0B0FAEAEF
          E5B691DA8C47BA7D37110C06ADADADECECECECECECECECECECECECECECEC0000
          00ECECECECECECECECECECECECECECEC000000ECECECECECECECECECECECECEC
          ECEC000000ECECECECECEC000000ECECECECECECECECECECECECECECECECECEC
          ECECECECECECECECECECECECECECECECECEC000000FFFFFF0000FFFFFF000000
          ECECECECECECECECECC4C4C4070405B19F85EFD5B0EFD5B0EFD5C5EFE0E5EFE0
          E5EFCBB0E5AB67D79451734A25050402DFDFDFECECECECECECECECECECECECEC
          ECEC000000ECECECECECECECECECECECECECECEC000000ECECECECECECECECEC
          ECECECECECEC000000ECECECECECEC000000ECECECECECECECECECECECECECEC
          ECECECECECECECECECECECECECECECECECECECECECEC000000FFFFFF0000FFFF
          FF000000ECECECECECECECECECEBEBEB8C8C8C110E0DB7A489EBD2ADEFD5B0EF
          CB9BEFCB9BE5B686DCA463805F360F0B05B2B2B2ECECECECECECECECECECECEC
          ECECECECECEC000000ECECECECECECECECECECECECECECEC000000ECECECECEC
          EC000000ECECECECECEC000000ECECECECECECECECEC000000000000ECECECEC
          ECECECECECECECECECECECECECECECECECECECECECECECECECEC000000FFFFFF
          0000FFFFFF000000ECECECECECECECECECECECECE9E9E98C8C8C080505241F1D
          B4A085E2C092DDBC86977E581C150E070604AFAFAFECECECECECECECECECECEC
          ECECECECECECECECECECECECECECECECECECECECECECECECECECECECECECECEC
          ECECECECECECECECECECECECECECECECECECECECECECECECECECECECECECECEC
          ECECECECECECECECECECECECECECECECECECECECECECECECECECECECECEC0000
          00FFFFFF0000FFFFFF000000ECECECECECECECECECECECECECECECEBEBEBC4C4
          C47D7D7D050405050405050402060402919191D3D3D3ECECECECECECECECECEC
          ECECECECECECECECECECECECECECECECECECECECECECECECECECECECECECECEC
          ECECECECECECECECECECECECECECECECECECECECECECECECECECECECECECECEC
          ECECECECECECECECECECECECECECECECECECECECECECECECECECECECECECECEC
          ECEC000000FFFFFF0000FFFFFF000000ECECECECECECECECECECECECECECECEC
          ECECECECECECECECE0E0E0C7C7C7CDCDCDE5E5E5ECECECECECECECECECECECEC
          ECECECECECECECECECECECECECECECECECECECECECECECECECECECECECECECEC
          ECECECECECECECECECECECECECECECECECECECECECECECECECECECECECECECEC
          ECECECECECECECECECECECECECECECECECECECECECECECECECECECECECECECEC
          ECECECECECEC000000FFFFFF0000FFFFFF000000ECECECECECECECECECECECEC
          ECECECECECECECECECECECECECECECECECECECECECECECECECECECECECECECEC
          ECECECECECECECECECECECECECECECECECECECECECECECECECECECECECECECEC
          ECECECECECECECECECECECECECECECECECECECECECECECECECECECECECECECEC
          ECECECECECECECECECECECECECECECECECECECECECECECECECECECECECECECEC
          ECECECECECECECECECEC000000FFFFFF0000FFFFFF0000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000FFFFFF0000FFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000}
        OnClick = Image2Click
      end
      object IB_Grid1: TIB_Grid
        Left = 0
        Top = 48
        Width = 817
        Height = 321
        CustomGlyphsSupplied = []
        DataSource = IB_DataSource1
        TabOrder = 0
      end
      object IB_UpdateBar1: TIB_UpdateBar
        Left = 0
        Top = 16
        Width = 198
        Height = 24
        Ctl3D = False
        ParentCtl3D = False
        TabOrder = 1
        DataSource = IB_DataSource1
        ReceiveFocus = False
        CustomGlyphsSupplied = []
        VisibleButtons = [ubEdit, ubInsert, ubDelete, ubPost, ubCancel, ubRefreshAll]
      end
    end
  end
  object IB_QueryPERSON: TIB_Query
    DatabaseName = '192.168.115.25:test.fdb'
    IB_Connection = DataModuleDatenbank.IB_Connection1
    SQL.Strings = (
      'select * from person '
      'where RID=:CROSSREF'
      'for update')
    RequestLive = True
    Left = 64
    Top = 144
  end
  object IB_QueryANSCHRIFT: TIB_Query
    DatabaseName = '192.168.115.25:test.fdb'
    IB_Connection = DataModuleDatenbank.IB_Connection1
    SQL.Strings = (
      'select * from '
      'anschrift '
      'where RID=:CROSSREF'
      'for update')
    RequestLive = True
    Left = 96
    Top = 144
  end
  object IB_Query1: TIB_Query
    ColumnAttributes.Strings = (
      'RID=NOTREQUIRED'
      'AKTIV=BOOLEAN=Y,N'
      'ABWESENHEIT=BOOLEAN=Y,N')
    DatabaseName = '192.168.115.25:test.fdb'
    FieldsDisplayWidth.Strings = (
      'VON=120'
      'BIS=120')
    FieldsReadOnly.Strings = (
      'RID=NOEDIT')
    IB_Connection = DataModuleDatenbank.IB_Connection1
    SQL.Strings = (
      'select * from'
      'BUCHUNG_KALKULATION'
      'for update')
    ColorScheme = True
    RequestLive = True
    BeforePost = IB_Query1BeforePost
    OnConfirmDelete = IB_Query1ConfirmDelete
    Left = 64
    Top = 112
  end
  object IB_DataSource1: TIB_DataSource
    Dataset = IB_Query1
    Left = 96
    Top = 112
  end
end
