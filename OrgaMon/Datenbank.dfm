object DataModuleDatenbank: TDataModuleDatenbank
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  OnDestroy = DataModuleDestroy
  Height = 143
  Width = 339
  object IB_Session1: TIB_Session
    AllowDefaultConnection = True
    AllowDefaultTransaction = True
    DefaultConnection = IB_Connection1
    StoreActive = False
    TimerInterval = 5000
    UseCursor = False
    Left = 240
    Top = 24
  end
  object IB_Connection1: TIB_Connection
    IB_Session = IB_Session1
    CacheStatementHandles = False
    DefaultTransaction = IB_Transaction_W
    PasswordStorage = psNotSecure
    SQLDialect = 3
    Params.Strings = (
      'PATH=test.fdb'
      'USER NAME=SYSDBA'
      'SQL DIALECT=3'
      'SERVER=192.168.115.1'
      'PROTOCOL=TCP/IP'
      'CHARACTER SET=NONE'
      'SWEEP INTERVAL=20000'
      'PAGE SIZE=16384')
    ParameterOrder = poNew
    BeforeConnect = IB_Connection1BeforeConnect
    Left = 32
    Top = 24
    SavedPassword = '.JuMbLe.01.77783D1A2A7F327969'
  end
  object IB_Transaction_W: TIB_Transaction
    IB_Session = IB_Session1
    IB_Connection = IB_Connection1
    ServerAutoCommit = True
    Isolation = tiCommitted
    LockWait = True
    Left = 136
    Top = 24
  end
  object IB_Transaction_R: TIB_Transaction
    IB_Session = IB_Session1
    IB_Connection = IB_Connection1
    ServerAutoCommit = True
    ReadOnly = True
    Isolation = tiCommitted
    LockWait = True
    Left = 136
    Top = 80
  end
  object IB_Monitor1: TIB_Monitor
    IncludeTimeStamp = True
    ItemEnd = '----*/'
    MinTicks = 10
    NewLineText = #13#10
    OnMonitorOutputItem = IB_Monitor1MonitorOutputItem
    ProfilerConnection = IB_Connection1
    Left = 240
    Top = 80
  end
end
