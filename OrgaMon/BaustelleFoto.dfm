object FormBaustelleFoto: TFormBaustelleFoto
  Left = 0
  Top = 0
  Caption = 'Speicherkarte leerlesen'
  ClientHeight = 310
  ClientWidth = 522
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Verdana'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 16
  object Label1: TLabel
    Left = 16
    Top = 56
    Width = 218
    Height = 16
    Caption = '1. Speicherkarte identifizieren'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Verdana'
    Font.Style = [fsBold, fsUnderline]
    ParentFont = False
  end
  object Label2: TLabel
    Left = 16
    Top = 112
    Width = 201
    Height = 16
    Caption = '2. Fotos zwischenspeichern'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Verdana'
    Font.Style = [fsBold, fsUnderline]
    ParentFont = False
  end
  object Label3: TLabel
    Left = 37
    Top = 81
    Width = 169
    Height = 16
    Caption = '3-stellige Ger'#228'te-Nummer'
  end
  object SpeedButton4: TSpeedButton
    Left = 489
    Top = 75
    Width = 22
    Height = 22
    Hint = 'Speicherkarte '#246'ffnen'
    Glyph.Data = {
      36030000424D3603000000000000360000002800000010000000100000000100
      1800000000000003000000000000000000000000000000000000FFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00000000000000000000000000
      0000000000000000000000000000000000000000000000000000FFFFFFFFFFFF
      009E9C009E9C009E9C009E9C009E9C009E9C009E9C009E9C009E9C009E9C009E
      9C009E9C000000000000FFFFFFFFFFFF009E9CFFFFFF9CCFFF9CFFFF9CCFFF9C
      FFFF9CCFFF9CCFFF9CCFFF9CCFFF63CFCE009E9C000000000000FFFFFF009E9C
      FFFFFF9CFFFF9CFFFF9CCFFF9CFFFF9CCFFF9CFFFF9CCFFF9CCFFF9CCFFF63CF
      CE000000009E9C000000FFFFFF009E9CFFFFFF9CFFFF9CFFFF9CFFFF9CFFFF9C
      FFFF9CCFFF9CFFFF9CCFFF9CCFFF009E9C000000009E9C000000009E9CFFFFFF
      9CFFFF9CFFFF9CFFFF9CFFFF9CCFFF9CFFFF9CFFFF9CCFFF9CFFFF63CFCE0000
      0063CFCE63CFCE000000009E9CFFFFFF9CFFFF9CFFFF9CFFFF9CFFFF9CFFFF9C
      FFFF9CCFFF9CFFFF9CCFFF63CFCE00000063CFCE63CFCE000000009E9C009E9C
      009E9C009E9C009E9C009E9C009E9C009E9C009E9C009E9C009E9C009E9C63CF
      CE9CFFFF63CFCE000000FFFFFF009E9CFFFFFF9CFFFF9CFFFF9CFFFF9CFFFF9C
      FFFF9CFFFF9CFFFF9CFFFF9CFFFF9CFFFF9CFFFF63CFCE000000FFFFFF009E9C
      FFFFFF9CFFFF9CFFFF9CFFFF9CFFFF9CFFFF9CFFFF9CFFFFFFFFFFFFFFFFFFFF
      FFFFFFFF63CFCE000000FFFFFF009E9CFFFFFF9CFFFF9CFFFF9CFFFF9CFFFF9C
      FFFFFFFFFF009E9C009E9C009E9C009E9C009E9C009E9CFFFFFFFFFFFFFFFFFF
      009E9CFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF009E9CFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF009E9C009E9C009E9C009E9C00
      9E9CFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
    ParentShowHint = False
    ShowHint = True
    OnClick = SpeedButton4Click
  end
  object SpeedButton1: TSpeedButton
    Left = 489
    Top = 112
    Width = 22
    Height = 22
    Hint = 'Zwischenspeicher '#246'ffnen'
    Glyph.Data = {
      36030000424D3603000000000000360000002800000010000000100000000100
      1800000000000003000000000000000000000000000000000000FFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00000000000000000000000000
      0000000000000000000000000000000000000000000000000000FFFFFFFFFFFF
      009E9C009E9C009E9C009E9C009E9C009E9C009E9C009E9C009E9C009E9C009E
      9C009E9C000000000000FFFFFFFFFFFF009E9CFFFFFF9CCFFF9CFFFF9CCFFF9C
      FFFF9CCFFF9CCFFF9CCFFF9CCFFF63CFCE009E9C000000000000FFFFFF009E9C
      FFFFFF9CFFFF9CFFFF9CCFFF9CFFFF9CCFFF9CFFFF9CCFFF9CCFFF9CCFFF63CF
      CE000000009E9C000000FFFFFF009E9CFFFFFF9CFFFF9CFFFF9CFFFF9CFFFF9C
      FFFF9CCFFF9CFFFF9CCFFF9CCFFF009E9C000000009E9C000000009E9CFFFFFF
      9CFFFF9CFFFF9CFFFF9CFFFF9CCFFF9CFFFF9CFFFF9CCFFF9CFFFF63CFCE0000
      0063CFCE63CFCE000000009E9CFFFFFF9CFFFF9CFFFF9CFFFF9CFFFF9CFFFF9C
      FFFF9CCFFF9CFFFF9CCFFF63CFCE00000063CFCE63CFCE000000009E9C009E9C
      009E9C009E9C009E9C009E9C009E9C009E9C009E9C009E9C009E9C009E9C63CF
      CE9CFFFF63CFCE000000FFFFFF009E9CFFFFFF9CFFFF9CFFFF9CFFFF9CFFFF9C
      FFFF9CFFFF9CFFFF9CFFFF9CFFFF9CFFFF9CFFFF63CFCE000000FFFFFF009E9C
      FFFFFF9CFFFF9CFFFF9CFFFF9CFFFF9CFFFF9CFFFF9CFFFFFFFFFFFFFFFFFFFF
      FFFFFFFF63CFCE000000FFFFFF009E9CFFFFFF9CFFFF9CFFFF9CFFFF9CFFFF9C
      FFFFFFFFFF009E9C009E9C009E9C009E9C009E9C009E9CFFFFFFFFFFFFFFFFFF
      009E9CFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF009E9CFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF009E9C009E9C009E9C009E9C00
      9E9CFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
    ParentShowHint = False
    ShowHint = True
    OnClick = SpeedButton1Click
  end
  object Label4: TLabel
    Left = 16
    Top = 12
    Width = 356
    Height = 33
    Caption = 'OrgaMon'#8482' Foto-Zuordnung'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -24
    Font.Name = 'Arial Black'
    Font.Style = []
    ParentFont = False
  end
  object SpeedButton6: TSpeedButton
    Left = 357
    Top = 80
    Width = 23
    Height = 22
    Hint = 'Auf dem Server gespeicherte Eingabemomente des Ger'#228'tes anzeigen'
    Glyph.Data = {
      36050000424D3605000000000000360400002800000010000000100000000100
      08000000000000010000C40E0000C40E00000001000000000000CCD0D000CBCF
      CF00C0C2C100B4AFAC00B2AEAC00C2C4C400CDD2D200CCD1D100B8A8A200C389
      7200E1987700EDAA8800E6A58100CF8A6900AF7A6400B4AAA500CED3D300B38A
      7900EC9C7A00FDBD9A00FDC2A000FCC8A800FAC6A500FDC3A100FCC09E00D98D
      6C00A6877B00D0D4D400CFD3D300B28D7E00F19A7900FDB08E00FEBA9800FCC0
      9F00FCF7F300F6F2EE00F9BF9E00FEBB9900FDB39100E7937100A78E8400D1D5
      D500BBB6B300D87C5B00FCA28000FEAC8B00FEB49200FCBA9800EDE1D800E4D8
      D000FABA9800FEB69500FEB08E00FDA68400CA775800BEBFBE00D2D6D600D3D6
      D600AC7F6F00EE906E00FA9D7B00FEA68400FEAE8C00FDB79600FAB79700F9BA
      9A00FDB69400FEA98800FCA07E00F3947200A7887C00D4D7D700AF6A5100E98C
      6B00F4967400FC9F7D00FAA68600EDE7E200FCFBFA00FBFCFC00F1AC8D00FEA8
      8600FEA17F00F8997700EE917000AA746000D3D7D700CACECE00B3654A00E185
      6300EB8D6C00FA9C7A00F49C7B00FAF6F300FBFDFC00F2A48500FC9E7D00F798
      7700F0927000E78A6900AF6F5800CCCFCF00AB634900D97D5C00E2846400EA8C
      6A00F1967400F9F5F200FCFDFD00ED9B7C00F2947300ED8F6D00E7896800DF83
      6200A86F5A00D4D6D6009C695600D3765500DA7C5B00E0836100E5886600E68B
      6A00F8F4F000FCFEFD00E4927400E4866400DE816000DA7C5A009A746600D7D9
      D900D7DBDB009A8B8500C76A4900D0745200D5785700DA7D5C00DA7E5C00F7F2
      ED00FCFEFC00DA866700DD805F00D5795700C26848009D979400D8DCDC00DCE0
      E000C3C7C700985F4C00C96C4B00CC704F00D0785800F1E6DD00F6F6EF00F6F8
      F200F2EBE300D3846700D1755400CE71500082574900DEE0E000DADCDC00AAA8
      A7009E5C4500C4684700C76C4C00C4735500C5745600C4745600C3735500C96F
      4F00C86B4A00824A3600B0B1B100DBDDDD00E0E2E200D9DADA00ABABAA008B61
      5300AE5B3D00C2664500C6694800C2664600A152350078584C00B0B2B200E1E4
      E400DCDFDF00C5C8C8009998980084716A0082625500805F54007F6E68009C9C
      9C00C9CBCB00DDE0E000E2E4E400DCDEDE00CFD1D100D0D2D200D5D7D700DDDF
      DF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00C4C4C4C4C4C5
      73C6C7C8C9C4C4C4C4C4B9B9B9BABBBCBDBEBFC0C1C2C3B9B9B9AEAEAFB0B1B2
      B3B4B4B5B6B7B8A0AEAE9FA0A1A2A3A4A5A6A7A8A9AAABACAD9F919293949596
      9798999A9B9C9D9E579182838485868788898A8B8C878D8E8F90737475767778
      797A7B7C637D7E7F80816566676869626A6B6C6D6E6F707172385758595A4A5B
      5C5D5E5F60616263641B1B48494A4B4C4D4E4F50515253545556393A3B3C3D3E
      3F404142344344454647292A2B2C2D2E2F3031323334353637381B1C1D1E1F20
      21222324252627281C1B1010071112131415161718191A061010060606070809
      0A0B0C0D0E0F0706060600000000010102030405010100000000}
    ParentShowHint = False
    ShowHint = True
    OnClick = SpeedButton6Click
  end
  object SpeedButton2: TSpeedButton
    Left = 465
    Top = 112
    Width = 22
    Height = 22
    Hint = 'Datensicherungsverzeichnis '#246'ffnen'
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    Glyph.Data = {
      36030000424D3603000000000000360000002800000010000000100000000100
      18000000000000030000C30E0000C30E00000000000000000000FFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00000000000000000000000000
      0000000000000000000000000000000000000000000000000000FFFFFFFFFFFF
      9B52009B52009B52009B52009B52009B52009B52009B52009B52009B52009B52
      009B5200000000000000FFFFFFFFFFFF9B5200FFFFFFFBFF9EFFD19EFBFF9EFF
      D19EFBFF9EFBFF9EFBFF9EFBFF9ECE9C639B5200000000000000FFFFFF9B5200
      FFFFFFFFD19EFFD19EFBFF9EFFD19EFBFF9EFFD19EFBFF9EFBFF9EFBFF9ECE9C
      630000009B5200000000FFFFFF9B5200FFFFFFFFD19EFFD19EFFD19EFFD19EFF
      D19EFBFF9EFFD19EFBFF9EFBFF9E9B52000000009B52000000009B5200FFFFFF
      FFD19EFFD19EFFD19EFFD19EFBFF9EFFD19EFFD19EFBFF9EFFD19ECE9C630000
      00CE9C63CE9C630000009B5200FFFFFFFFD19EFFD19EFFD19EFFD19EFFD19EFF
      D19EFBFF9EFFD19EFBFF9ECE9C63000000CE9C63CE9C630000009B52009B5200
      9B52009B52009B52009B52009B52009B52009B52009B52009B52009B5200CE9C
      63FFD19ECE9C63000000FFFFFF9B5200FFFFFFFFD19EFFD19EFFD19EFFD19EFF
      D19EFFD19EFFD19EFFD19EFFD19EFFD19EFFD19ECE9C63000000FFFFFF9B5200
      FFFFFFFFD19EFFD19EFFD19EFFD19EFFD19EFFD19EFFD19EFFFFFFFFFFFFFFFF
      FFFFFFFFCE9C63000000FFFFFF9B5200FFFFFFFFD19EFFD19EFFD19EFFD19EFF
      D19EFFFFFF9B52009B52009B52009B52009B52009B5200FFFFFFFFFFFFFFFFFF
      9B5200FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9B5200FFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9B52009B52009B52009B52009B
      5200FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
    ParentShowHint = False
    ShowHint = True
    OnClick = SpeedButton2Click
  end
  object Image3: TImage
    Left = 457
    Top = 12
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
    OnClick = Image3Click
  end
  object Edit1: TEdit
    Left = 212
    Top = 78
    Width = 58
    Height = 24
    TabOrder = 0
    Text = '###'
  end
  object Button3: TButton
    Left = 276
    Top = 78
    Width = 75
    Height = 25
    Caption = 'speichern'
    TabOrder = 1
    OnClick = Button3Click
  end
  object ListBox1: TListBox
    Left = 16
    Top = 140
    Width = 495
    Height = 121
    TabOrder = 2
  end
  object ProgressBar1: TProgressBar
    Left = 16
    Top = 271
    Width = 207
    Height = 25
    TabOrder = 3
  end
  object Button1: TButton
    Left = 312
    Top = 271
    Width = 199
    Height = 25
    Caption = 'Speicherkarte leer&lesen'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Verdana'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 4
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 230
    Top = 271
    Width = 75
    Height = 25
    Caption = 'ab&bruch'
    TabOrder = 5
    OnClick = Button2Click
  end
end
