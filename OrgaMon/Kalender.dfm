object FormKalender: TFormKalender
  Left = 0
  Top = 0
  Caption = 'Kalender'
  ClientHeight = 534
  ClientWidth = 783
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Verdana'
  Font.Style = []
  OldCreateOrder = False
  OnActivate = FormActivate
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object PageControl1: TPageControl
    Left = 0
    Top = 0
    Width = 783
    Height = 534
    ActivePage = TabSheet1
    Align = alClient
    TabOrder = 0
    object TabSheet1: TTabSheet
      Caption = 'Daten'
      object Label4: TLabel
        Left = 8
        Top = 202
        Width = 75
        Height = 13
        Caption = 'Einstellungen'
      end
      object SpeedButton8: TSpeedButton
        Left = 8
        Top = 18
        Width = 21
        Height = 22
        Glyph.Data = {
          36030000424D3603000000000000360000002800000010000000100000000100
          18000000000000030000120B0000120B00000000000000000000FF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFB78183A47874A47874A47874A47874A47874A4
          7874A47874A47874A47874A47874A47874986B66FF00FFFF00FFFF00FFB78183
          FDEFD9F6E3CBF5DFC2F4DBBAF2D7B2F1D4A9F1D0A2EECC99EECC97EECC97F3D1
          99986B66FF00FFFF00FFFF00FFB48176FEF3E3F8E7D3F5E3CBF5DFC3CFCF9F01
          8A02018A02CCC68BEECC9AEECC97F3D199986B66FF00FFFF00FFFF00FFB48176
          FFF7EBF9EBDA018A02D1D6AC018A02D0CF9ECECC98018A02CCC689EFCD99F3D1
          98986B66FF00FFFF00FFFF00FFBA8E85FFFCF4FAEFE4018A02018A02D1D5ADF5
          DFC2F4DBBBCDCC98018A02F0D0A1F3D29B986B66FF00FFFF00FFFF00FFBA8E85
          FFFFFDFBF4EC018A02018A02018A02F5E3C9F5DFC2F4DBBAF2D7B1F0D4A9F5D5
          A3986B66FF00FFFF00FFFF00FFCB9A82FFFFFFFEF9F5FBF3ECFAEFE2F9EADAF8
          E7D2018A02018A02018A02F2D8B2F6D9AC986B66FF00FFFF00FFFF00FFCB9A82
          FFFFFFFFFEFD018A02D6E3C9F9EFE3F8EADAD2D9B3018A02018A02F4DBB9F8DD
          B4986B66FF00FFFF00FFFF00FFDCA887FFFFFFFFFFFFD9EDD8018A02D6E3C8D5
          E0C1018A02D3D8B2018A02F7E1C2F0DAB7986B66FF00FFFF00FFFF00FFDCA887
          FFFFFFFFFFFFFFFFFFD9EDD8018A02018A02D5DFC1FAEDDCFCEFD9E6D9C4C6BC
          A9986B66FF00FFFF00FFFF00FFE3B18EFFFFFFFFFFFFFFFFFFFFFFFFFFFEFDFD
          F8F3FDF6ECF1E1D5B48176B48176B48176B48176FF00FFFF00FFFF00FFE3B18E
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFCFFFEF9E3CFC9B48176E8B270ECA5
          4AC58768FF00FFFF00FFFF00FFEDBD92FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFE4D4D2B48176FAC577CD9377FF00FFFF00FFFF00FFFF00FFEDBD92
          FCF7F4FCF7F3FBF6F3FBF6F3FAF5F3F9F5F3F9F5F3E1D0CEB48176CF9B86FF00
          FFFF00FFFF00FFFF00FFFF00FFEDBD92DAA482DAA482DAA482DAA482DAA482DA
          A482DAA482DAA482B48176FF00FFFF00FFFF00FFFF00FFFF00FF}
        OnClick = SpeedButton8Click
      end
      object IB_Grid1: TIB_Grid
        Left = 8
        Top = 47
        Width = 764
        Height = 146
        CustomGlyphsSupplied = []
        DataSource = IB_DataSource1
        TabOrder = 0
      end
      object IB_UpdateBar1: TIB_UpdateBar
        Left = 33
        Top = 16
        Width = 145
        Height = 25
        Flat = False
        Ctl3D = False
        ParentCtl3D = False
        TabOrder = 1
        DataSource = IB_DataSource1
        ReceiveFocus = False
        CustomGlyphsSupplied = []
      end
      object IB_Memo1: TIB_Memo
        Left = 8
        Top = 224
        Width = 764
        Height = 201
        DataField = 'EINSTELLUNGEN'
        DataSource = IB_DataSource1
        TabOrder = 2
        AutoSize = False
      end
    end
    object Verwalten: TTabSheet
      Caption = 'Verwalten'
      ImageIndex = 1
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 281
      ExplicitHeight = 165
      object Label1: TLabel
        Left = 24
        Top = 24
        Width = 209
        Height = 18
        Caption = 'Kalendereintr'#228'ge anlegen'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Verdana'
        Font.Style = [fsBold, fsItalic, fsUnderline]
        ParentFont = False
      end
      object Label2: TLabel
        Left = 24
        Top = 72
        Width = 21
        Height = 13
        Caption = 'von'
      end
      object Label3: TLabel
        Left = 136
        Top = 72
        Width = 16
        Height = 13
        Caption = 'bis'
      end
      object Edit1: TEdit
        Left = 51
        Top = 69
        Width = 73
        Height = 21
        TabOrder = 0
        Text = 'TT.MM.JJJJ'
      end
      object Edit2: TEdit
        Left = 167
        Top = 69
        Width = 72
        Height = 21
        TabOrder = 1
        Text = 'TT.MM.JJJJ'
      end
      object Button1: TButton
        Left = 245
        Top = 67
        Width = 75
        Height = 25
        Caption = 'Start'
        TabOrder = 2
        OnClick = Button1Click
      end
    end
  end
  object IB_Query1: TIB_Query
    ColumnAttributes.Strings = (
      'WERKTAG=BOOLEAN=Y,N'
      'FEIERTAG=BOOLEAN=Y,N')
    DatabaseName = '192.168.115.25:test.fdb'
    FieldsVisible.Strings = (
      'BEARBEITER_R=FALSE'
      'ANLEGER_R=FALSE')
    IB_Connection = DataModuleDatenbank.IB_Connection1
    SQL.Strings = (
      'select '
      ' * '
      'from '
      ' KALENDER'
      'for update')
    KeyLinks.Strings = (
      'KALENDER.RID')
    RequestLive = True
    Left = 512
    Top = 8
  end
  object IB_DataSource1: TIB_DataSource
    Dataset = IB_Query1
    Left = 568
    Top = 8
  end
end
