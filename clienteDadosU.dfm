inherited frmClienteDados: TfrmClienteDados
  Caption = 'Dados do Cliente'
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  inherited gbDados: TGroupBox
    Enabled = False
    object Label1: TLabel
      Left = 24
      Top = 40
      Width = 33
      Height = 13
      Caption = 'C'#243'digo'
    end
    object Label2: TLabel
      Left = 216
      Top = 40
      Width = 31
      Height = 13
      Caption = 'Status'
    end
    object Label3: TLabel
      Left = 24
      Top = 96
      Width = 27
      Height = 13
      Caption = 'Nome'
    end
    object Label4: TLabel
      Left = 176
      Top = 96
      Width = 48
      Height = 13
      Caption = 'CPF/CNPJ'
    end
    object Label5: TLabel
      Left = 24
      Top = 152
      Width = 45
      Height = 13
      Caption = 'Endere'#231'o'
    end
    object Label6: TLabel
      Left = 176
      Top = 152
      Width = 42
      Height = 13
      Caption = 'Telefone'
    end
    object Label7: TLabel
      Left = 24
      Top = 218
      Width = 19
      Height = 13
      Caption = 'CEP'
    end
    object Label8: TLabel
      Left = 176
      Top = 218
      Width = 24
      Height = 13
      Caption = 'Sexo'
    end
    object Label9: TLabel
      Left = 24
      Top = 266
      Width = 96
      Height = 13
      Caption = 'Data de Nascimento'
    end
    object Label10: TLabel
      Left = 176
      Top = 266
      Width = 44
      Height = 13
      Caption = 'Profiss'#227'o'
    end
    object Label11: TLabel
      Left = 384
      Top = 179
      Width = 55
      Height = 13
      Caption = 'Estado Civil'
    end
    object Label12: TLabel
      Left = 456
      Top = 208
      Width = 103
      Height = 13
      Caption = 'Pessoa F'#237'sica/Jur'#237'dica'
    end
    object Label13: TLabel
      Left = 424
      Top = 248
      Width = 100
      Height = 13
      Caption = 'Cliente e Fornecedor'
    end
    object Edit1: TEdit
      Left = 63
      Top = 37
      Width = 121
      Height = 21
      TabOrder = 0
      Text = 'Edit1'
    end
    object Edit2: TEdit
      Left = 264
      Top = 37
      Width = 121
      Height = 21
      TabOrder = 1
      Text = 'Edit2'
    end
    object Edit3: TEdit
      Left = 24
      Top = 115
      Width = 121
      Height = 21
      TabOrder = 2
      Text = 'Edit3'
    end
    object Edit5: TEdit
      Left = 24
      Top = 171
      Width = 121
      Height = 21
      TabOrder = 3
      Text = 'Edit3'
    end
    object Edit6: TEdit
      Left = 176
      Top = 171
      Width = 121
      Height = 21
      TabOrder = 4
      Text = 'Edit3'
    end
  end
  object Edit4: TEdit [2]
    Left = 176
    Top = 115
    Width = 121
    Height = 21
    TabOrder = 2
    Text = 'Edit3'
  end
  object Edit7: TEdit [3]
    Left = 24
    Top = 237
    Width = 121
    Height = 21
    TabOrder = 3
    Text = 'Edit3'
  end
  object Edit8: TEdit [4]
    Left = 176
    Top = 237
    Width = 121
    Height = 21
    TabOrder = 4
    Text = 'Edit3'
  end
  object Edit9: TEdit [5]
    Left = 24
    Top = 285
    Width = 121
    Height = 21
    TabOrder = 5
    Text = 'Edit3'
  end
  object Edit10: TEdit [6]
    Left = 176
    Top = 285
    Width = 121
    Height = 21
    TabOrder = 6
    Text = 'Edit3'
  end
  object Edit11: TEdit [7]
    Left = 24
    Top = 325
    Width = 121
    Height = 21
    TabOrder = 7
    Text = 'Edit3'
  end
  object Edit12: TEdit [8]
    Left = 176
    Top = 325
    Width = 121
    Height = 21
    TabOrder = 8
    Text = 'Edit3'
  end
  object Edit13: TEdit [9]
    Left = 416
    Top = 299
    Width = 121
    Height = 21
    TabOrder = 9
    Text = 'Edit3'
  end
  inherited dsModelo: TDataSource
    DataSet = adqClientes
    Left = 616
  end
  object adqClientes: TADQuery
    Connection = DataModuleLivraria.ADConnection1
    SQL.Strings = (
      'select * from tbclifor')
    Left = 680
    Top = 16
  end
end