object DataModuleLivraria: TDataModuleLivraria
  OldCreateOrder = False
  Height = 421
  Width = 694
  object adConnectionLivro: TADConnection
    Params.Strings = (
      'Server=BDMARCELON'
      'Database=livraria'
      'User_Name=dba'
      'Password=sql'
      'DriverID=ASA')
    Connected = True
    Left = 72
    Top = 40
  end
  object ADPhysASADriverLink1: TADPhysASADriverLink
    Left = 200
    Top = 40
  end
  object ADGUIxWaitCursor1: TADGUIxWaitCursor
    Left = 344
    Top = 40
  end
end
