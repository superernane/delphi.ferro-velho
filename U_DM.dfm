object Dm: TDm
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 175
  Width = 320
  object conexao: TFDConnection
    Params.Strings = (
      'Database=C:\CAP\exe\DADOS.FDB'
      'User_Name=sysdba'
      'Password=masterkey'
      'CharacterSet=WIN1252'
      'DriverID=FB')
    LoginPrompt = False
    Left = 64
    Top = 24
  end
  object T_Trans: TFDTransaction
    Connection = conexao
    Left = 152
    Top = 24
  end
end
