object FormArtikelBackorder: TFormArtikelBackorder
  Left = 193
  Top = 169
  Caption = 'Lager und Wareneingang'
  ClientHeight = 540
  ClientWidth = 607
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Verdana'
  Font.Style = []
  OldCreateOrder = False
  DesignSize = (
    607
    540)
  PixelsPerInch = 96
  TextHeight = 14
  object Label1: TLabel
    Left = 9
    Top = 57
    Width = 83
    Height = 14
    Caption = 'Anzahl Agent'
  end
  object Label3: TLabel
    Left = 320
    Top = 59
    Width = 101
    Height = 14
    Caption = 'Anzahl erwartet'
  end
  object Label5: TLabel
    Left = 9
    Top = 360
    Width = 200
    Height = 14
    Anchors = [akLeft, akBottom]
    Caption = 'Aufenthalt in '#220'bergangsf'#228'chern'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Verdana'
    Font.Style = []
    ParentFont = False
    ExplicitTop = 376
  end
  object Label2: TLabel
    Left = 482
    Top = 416
    Width = 37
    Height = 14
    Anchors = [akRight, akBottom]
    Caption = 'Agent'
    ExplicitLeft = 506
    ExplicitTop = 432
  end
  object Label4: TLabel
    Left = 409
    Top = 440
    Width = 109
    Height = 14
    Anchors = [akRight, akBottom]
    Caption = 'Erwartete Menge'
    ExplicitLeft = 433
    ExplicitTop = 456
  end
  object Label6: TLabel
    Left = 418
    Top = 391
    Width = 101
    Height = 14
    Anchors = [akRight, akBottom]
    Caption = 'Mindestbestand'
    ExplicitLeft = 442
    ExplicitTop = 407
  end
  object Label7: TLabel
    Left = 416
    Top = 485
    Width = 102
    Height = 14
    Anchors = [akRight, akBottom]
    Caption = #220'berzahl Offene'
    ExplicitLeft = 440
    ExplicitTop = 501
  end
  object Label8: TLabel
    Left = 8
    Top = 217
    Width = 89
    Height = 14
    Caption = 'Order-Historie'
  end
  object Label9: TLabel
    Left = 417
    Top = 367
    Width = 102
    Height = 14
    Anchors = [akRight, akBottom]
    Caption = 'lagernde Menge'
    ExplicitLeft = 441
    ExplicitTop = 383
  end
  object Label10: TLabel
    Left = 365
    Top = 509
    Width = 152
    Height = 14
    Anchors = [akRight, akBottom]
    Caption = 'Vorschlag weitere Order'
    ExplicitLeft = 389
    ExplicitTop = 525
  end
  object SpeedButton2: TSpeedButton
    Left = 8
    Top = 13
    Width = 25
    Height = 25
    Hint = 'alle Werte neu ermitteln'
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
    ParentShowHint = False
    ShowHint = True
    OnClick = SpeedButton2Click
  end
  object Label11: TLabel
    Left = 70
    Top = 14
    Width = 287
    Height = 23
    Caption = 'OrgaMon Mengen Information'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Verdana'
    Font.Style = []
    ParentFont = False
  end
  object Image2: TImage
    Left = 542
    Top = 8
    Width = 54
    Height = 22
    Cursor = crHandPoint
    Anchors = [akTop, akRight]
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
    ExplicitLeft = 713
  end
  object Label12: TLabel
    Left = 454
    Top = 464
    Width = 64
    Height = 14
    Anchors = [akRight, akBottom]
    Caption = 'Unbestellt'
    ExplicitLeft = 478
    ExplicitTop = 480
  end
  object SpeedButton1: TSpeedButton
    Left = 36
    Top = 13
    Width = 25
    Height = 25
    Hint = 'Zeige alle Ausgabearten'
    Glyph.Data = {
      36030000424D3603000000000000360000002800000010000000100000000100
      18000000000000030000C40E0000C40E00000000000000000000F5F5F5E8E8E8
      E5E5E5E5E5E5E5E5E5E5E5E5E5E5E5E5E5E5E5E5E5E7E7E7EBEBEBF0F0F0F6F6
      F6FBFBFBFEFEFEFFFFFFECECEC4C4CE62E5DE32EB4E152B24D80BC2DD7C72DC9
      8643A8487FA75CB9B27BD3E0E0E1EDEDEDF7F7F7FDFDFDFFFFFFFFFFFF7070FF
      3753FF37CDFF59CD7D7BD338FBF83AFDBC41D36697CF6DC2D184FFE1CFECFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFA3A3FF3B3EFF3BBCFF4DCEC26FCF3FDAF342FF
      D645E7917BD36FACD68CEEDEA7FFFAF2FFFFFFFFFFFFFFFFFFFFFFFFFFDADAFF
      4040FF4294FF47D0F471D15CA0DF4BFFF351FBC361DC86A9DB8DC4E1ADF9EAC8
      FFFAF2FFFEFEFFFFFFFFFFFFFFFFFFFF6F6FFF4962FF4DCEFF65D3AF82D557DA
      F25FFFE668F6BF88E39FBEE6B0D6EDCDF8F4E2FFFBF5FFFFFFFFFFFFFFFFFFFF
      C5C5FF5151FF57A4FF5ED6F683D8819DDE6DF2F978FFE787F8D0A6EDC0D2F0CF
      E3F6E5F4FBF5FDFFFFFFFFFFFFFFFFFFFBFBFF8383FF606CFF67CCFF76DBE799
      DE86B3E687F5FA97FFF0A7FDE6BDF8E1DCF8E8EFFCF6F9FFFFFFFFFFFFFFFFFF
      FFFFFFE3E3FF7575FF738FFF7BD9FF8FE1E1ADE49DC1EAA2EDF9B3FFFBC4FFF6
      D6FEF6E7FEFAF7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCBCBFF8080FF87A6FF92
      DFFFA4E7EFBEEABDCDEEBCE4F6CCF8FCDBFEFEEAFFFEF7FFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFCACAFF9393FF9CB0FFA9E2FFB7ECFBCBF0E4DCF3D7E8F7
      E0F2FAECFBFDF7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD9D9FFAB
      ABFFB1B7FFBDDBFFCAF0FFD7F5FCE5F8F6F1FBF4F9FDF9FFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0F0FFC9C9FFC3C3FFCFD6FFDBEAFFE6F6
      FFF0FBFFF9FDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFDFDFFEDEDFFDDDDFFDFDFFFE8E9FFF1F3FFFAFBFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9F9FFF5F5
      FFF6F6FFFBFBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
    ParentShowHint = False
    ShowHint = True
    OnClick = SpeedButton1Click
  end
  object IB_Grid1: TIB_Grid
    Left = 8
    Top = 379
    Width = 300
    Height = 147
    CustomGlyphsSupplied = []
    DataSource = IB_DataSource3
    Anchors = [akLeft, akBottom]
    TabOrder = 0
  end
  object IB_Grid2: TIB_Grid
    Left = 8
    Top = 81
    Width = 300
    Height = 120
    CustomGlyphsSupplied = []
    DataSource = IB_DataSource1
    TabOrder = 1
  end
  object IB_Grid3: TIB_Grid
    Left = 320
    Top = 81
    Width = 276
    Height = 120
    CustomGlyphsSupplied = []
    DataSource = IB_DataSource2
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 2
  end
  object Button2: TButton
    Left = 283
    Top = 55
    Width = 25
    Height = 25
    Caption = 'B'
    TabOrder = 3
    OnClick = Button2Click
  end
  object Button3: TButton
    Left = 571
    Top = 55
    Width = 25
    Height = 25
    Anchors = [akTop, akRight]
    Caption = '&O'
    TabOrder = 4
    OnClick = Button3Click
  end
  object Button4: TButton
    Left = 283
    Top = 353
    Width = 25
    Height = 25
    Anchors = [akLeft, akBottom]
    Caption = '&B'
    TabOrder = 5
    OnClick = Button4Click
  end
  object StaticText1: TStaticText
    Left = 522
    Top = 390
    Width = 74
    Height = 18
    Anchors = [akRight, akBottom]
    AutoSize = False
    BorderStyle = sbsSunken
    Caption = '-?-'
    TabOrder = 6
  end
  object StaticText2: TStaticText
    Left = 522
    Top = 414
    Width = 74
    Height = 18
    Anchors = [akRight, akBottom]
    AutoSize = False
    BorderStyle = sbsSunken
    Caption = '-?-'
    TabOrder = 7
  end
  object StaticText3: TStaticText
    Left = 522
    Top = 438
    Width = 74
    Height = 18
    Anchors = [akRight, akBottom]
    AutoSize = False
    BorderStyle = sbsSunken
    Caption = '-?-'
    TabOrder = 8
  end
  object StaticText4: TStaticText
    Left = 522
    Top = 484
    Width = 74
    Height = 18
    Anchors = [akRight, akBottom]
    AutoSize = False
    BorderStyle = sbsSunken
    Caption = '-?-'
    TabOrder = 9
  end
  object IB_Grid4: TIB_Grid
    Left = 8
    Top = 241
    Width = 588
    Height = 107
    CustomGlyphsSupplied = []
    DataSource = IB_DataSourceOrderHistroie
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 10
  end
  object StaticText5: TStaticText
    Left = 522
    Top = 366
    Width = 74
    Height = 18
    Anchors = [akRight, akBottom]
    AutoSize = False
    BorderStyle = sbsSunken
    Caption = '-?-'
    TabOrder = 11
  end
  object Button5: TButton
    Left = 571
    Top = 215
    Width = 25
    Height = 25
    Anchors = [akTop, akRight]
    Caption = '&O'
    TabOrder = 12
    OnClick = Button5Click
  end
  object StaticText6: TStaticText
    Left = 522
    Top = 508
    Width = 74
    Height = 18
    Anchors = [akRight, akBottom]
    AutoSize = False
    BorderStyle = sbsSunken
    Caption = '-?-'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Verdana'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 13
  end
  object StaticText7: TStaticText
    Left = 522
    Top = 462
    Width = 74
    Height = 18
    Anchors = [akRight, akBottom]
    AutoSize = False
    BorderStyle = sbsSunken
    Caption = '-?-'
    TabOrder = 14
  end
  object IB_Query1: TIB_Query
    DatabaseName = '192.168.115.25:test.fdb'
    FieldsDisplayLabel.Strings = (
      'AVG=AA'
      'C_AGE=AGE'
      'BELEG_R=B-#'
      'AUSGABEART_R=AA'
      'MENGE_AGENT=AGE')
    FieldsDisplayWidth.Strings = (
      'AVG=30'
      'C_AGE=40'
      'BELEG_R=70'
      'AUSGABEART_R=30'
      'MENGE_AGENT=40')
    FieldsVisible.Strings = (
      'RID=FALSE')
    IB_Connection = DataModuleDatenbank.IB_Connection1
    SQL.Strings = (
      'SELECT '
      ' BELEG_R,'
      ' AUSGABEART_R,'
      ' MENGE_AGENT,'
      ' RID'
      'FROM'
      ' POSTEN '
      'WHERE '
      ' (ARTIKEL_R=:CROSSREF) AND'
      ' (MENGE_AGENT>0)')
    Left = 48
    Top = 129
  end
  object IB_Query2: TIB_Query
    DatabaseName = '192.168.115.25:test.fdb'
    FieldsDisplayLabel.Strings = (
      'AVG=AA'
      'C_ERW=ERW'
      'BELEG_R=O-#'
      'AUSGABEART_R=AA'
      'MENGE_ERWARTET=ERW'
      'MENGE_UNBESTELLT=UNB')
    FieldsDisplayWidth.Strings = (
      'AVG=30'
      'C_ERW=40'
      'BELEG_R=70'
      'AUSGABEART_R=30'
      'MENGE_ERWARTET=40'
      'MENGE_UNBESTELLT=40')
    FieldsVisible.Strings = (
      'RID=FALSE')
    IB_Connection = DataModuleDatenbank.IB_Connection1
    SQL.Strings = (
      'SELECT '
      ' BELEG_R,'
      ' AUSGABEART_R,'
      ' MENGE_ERWARTET,'
      ' MENGE_UNBESTELLT,'
      ' RID'
      'FROM'
      ' BPOSTEN '
      'WHERE '
      ' (ARTIKEL_R=:CROSSREF) AND'
      ' ((MENGE_ERWARTET>0) or'
      '  (MENGE_UNBESTELLT>0)'
      ' )')
    Left = 368
    Top = 121
  end
  object IB_Query3: TIB_Query
    DatabaseName = '192.168.115.25:test.fdb'
    FieldsDisplayLabel.Strings = (
      'UEFACH='#220'-Fach'
      'MENGE_AGENT=AGE'
      'AUSGABEART_R=AA'
      'MENGE_RECHNUNG=REC'
      'RID=B-#')
    FieldsDisplayWidth.Strings = (
      'UEFACH=70'
      'MENGE_AGENT=30'
      'AUSGABEART_R=30'
      'MENGE_RECHNUNG=40'
      'RID=70')
    FieldsVisible.Strings = (
      'POSTEN_R=FALSE')
    IB_Connection = DataModuleDatenbank.IB_Connection1
    SQL.Strings = (
      'SELECT'
      ' BELEG.RID,'
      
        ' (SELECT LAGER.NAME FROM LAGER WHERE BELEG.LAGER_R=LAGER.RID) UE' +
        'FACH,'
      ' POSTEN.AUSGABEART_R,'
      ' POSTEN.MENGE_RECHNUNG,'
      ' POSTEN.RID POSTEN_R'
      'FROM'
      ' BELEG'
      'JOIN'
      ' POSTEN'
      'ON'
      ' POSTEN.BELEG_R=BELEG.RID'
      'WHERE'
      ' (POSTEN.ARTIKEL_R=:CROSSREF) AND'
      ' (POSTEN.MENGE_RECHNUNG>0) AND'
      ' (BELEG.LAGER_R IS NOT NULL)')
    Left = 80
    Top = 433
    ParamValues = (
      'CROSSREF=')
  end
  object IB_DataSource1: TIB_DataSource
    Dataset = IB_Query1
    Left = 128
    Top = 129
  end
  object IB_DataSource2: TIB_DataSource
    Dataset = IB_Query2
    Left = 448
    Top = 121
  end
  object IB_DataSource3: TIB_DataSource
    Dataset = IB_Query3
    Left = 184
    Top = 433
  end
  object IB_QueryOrderHistorie: TIB_Query
    DatabaseName = '192.168.115.25:test.fdb'
    FieldsDisplayLabel.Strings = (
      'BELEG_R=O-#'
      'MOTIVATION=MOT'
      'MENGE_UNBESTELLT=UNB'
      'MENGE_ERWARTET=ERW'
      'MENGE_GELIEFERT=GEL'
      'AUSGABEART_R=AA')
    FieldsDisplayWidth.Strings = (
      'BELEG_R=60'
      'MOTIVATION=40'
      'MENGE_UNBESTELLT=40'
      'MENGE_ERWARTET=40'
      'MENGE_GELIEFERT=40'
      'AUSGABEART_R=25')
    FieldsVisible.Strings = (
      'RID=FALSE')
    IB_Connection = DataModuleDatenbank.IB_Connection1
    SQL.Strings = (
      'select '
      ' RID,'
      ' BELEG_R,'
      ' MOTIVATION,'
      ' AUSGABEART_R,'
      ' MENGE_UNBESTELLT,'
      ' MENGE_ERWARTET,'
      ' MENGE_GELIEFERT,'
      
        ' (select BESTELLT from BBELEG where RID=BPOSTEN.BELEG_R) BESTELL' +
        'T '
      'from'
      ' BPOSTEN '
      'where '
      ' ARTIKEL_R=:CROSSREF'
      'order by '
      ' RID '
      'descending')
    Left = 64
    Top = 281
    ParamValues = (
      'CROSSREF=')
  end
  object IB_DataSourceOrderHistroie: TIB_DataSource
    Dataset = IB_QueryOrderHistorie
    Left = 192
    Top = 281
  end
end
