object FormVersand: TFormVersand
  Left = 146
  Top = 156
  Width = 603
  Height = 200
  Caption = 'Belege'
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Verdana'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object GroupBox1: TGroupBox
    Left = 0
    Top = 0
    Width = 593
    Height = 73
    Caption = 'Beleg-Status neu buchen'
    TabOrder = 0
    object Label2: TLabel
      Left = 8
      Top = 54
      Width = 7
      Height = 13
      Caption = '0'
    end
    object ProgressBar1: TProgressBar
      Left = 8
      Top = 31
      Width = 489
      Height = 16
      Min = 0
      Max = 100
      TabOrder = 0
    end
    object Button1: TButton
      Left = 506
      Top = 24
      Width = 75
      Height = 43
      Caption = 'Start'
      TabOrder = 1
      OnClick = Button1Click
    end
  end
  object GroupBox2: TGroupBox
    Left = 0
    Top = 80
    Width = 593
    Height = 73
    Caption = 'Posten Integrit'#228't herstellen'
    TabOrder = 1
    object Label1: TLabel
      Left = 16
      Top = 24
      Width = 37
      Height = 13
      Caption = 'Label1'
    end
    object Label3: TLabel
      Left = 16
      Top = 40
      Width = 37
      Height = 13
      Caption = 'Label3'
    end
    object Button2: TButton
      Left = 208
      Top = 32
      Width = 75
      Height = 25
      Caption = 'Start'
      TabOrder = 0
      OnClick = Button2Click
    end
  end
  object IB_Query1: TIB_Query
    DatabaseName = '192.168.115.92:/ablage/fdb/hebu/hebu.404.fdb'
    IB_Connection = DataModuleHeBu.IB_Connection1
    SQL.Strings = (
      'SELECT *'
      'FROM BELEG'
      'ORDER BY RID'
      'FOR UPDATE')
    ColorScheme = False
    MasterSearchFlags = [msfOpenMasterOnOpen, msfSearchAppliesToMasterOnly]
    RequestLive = True
    BufferSynchroFlags = []
    FetchWholeRows = True
    Left = 440
    Top = 16
  end
  object IB_Query2: TIB_Query
    DatabaseName = '192.168.115.92:/ablage/fdb/hebu/hebu.404.fdb'
    IB_Connection = DataModuleHeBu.IB_Connection1
    SQL.Strings = (
      'SELECT *'
      'FROM POSTEN'
      'WHERE BELEG_R=:CROSSREF')
    ColorScheme = False
    MasterSearchFlags = [msfOpenMasterOnOpen, msfSearchAppliesToMasterOnly]
    BufferSynchroFlags = []
    FetchWholeRows = True
    Left = 472
    Top = 16
  end
  object IB_Query3: TIB_Query
    DatabaseName = '192.168.115.92:/ablage/fdb/hebu/hebu.404.fdb'
    IB_Connection = DataModuleHeBu.IB_Connection1
    SQL.Strings = (
      'SELECT BELEG_R,RID'
      'FROM POSTEN')
    ColorScheme = False
    MasterSearchFlags = [msfOpenMasterOnOpen, msfSearchAppliesToMasterOnly]
    BufferSynchroFlags = []
    FetchWholeRows = True
    Left = 48
    Top = 104
  end
  object IB_Query4: TIB_Query
    DatabaseName = '192.168.115.92:/ablage/fdb/hebu/hebu.404.fdb'
    IB_Connection = DataModuleHeBu.IB_Connection1
    SQL.Strings = (
      'SELECT RID FROM'
      'BELEG')
    ColorScheme = False
    MasterSearchFlags = [msfOpenMasterOnOpen, msfSearchAppliesToMasterOnly]
    BufferSynchroFlags = []
    FetchWholeRows = True
    Left = 80
    Top = 104
  end
end
