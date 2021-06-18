inherited frmClienteDadosGeral: TfrmClienteDadosGeral
  Caption = 'Clientes'
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  inherited gbDados: TGroupBox
    object editID: TEdit
      Left = 16
      Top = 24
      Width = 121
      Height = 21
      TabOrder = 0
      Text = 'editID'
    end
    object editNome: TEdit
      Left = 16
      Top = 72
      Width = 121
      Height = 21
      TabOrder = 1
      Text = 'editNome'
    end
    object editStatus: TEdit
      Left = 160
      Top = 24
      Width = 121
      Height = 21
      TabOrder = 2
      Text = 'editStatus'
    end
    object editCPFCNPJ: TEdit
      Left = 16
      Top = 120
      Width = 121
      Height = 21
      TabOrder = 3
      Text = 'editCPFCNPJ'
    end
    object editEndereco: TEdit
      Left = 16
      Top = 160
      Width = 121
      Height = 21
      TabOrder = 4
      Text = 'editEndereco'
    end
    object editTelefone: TEdit
      Left = 16
      Top = 200
      Width = 121
      Height = 21
      TabOrder = 5
      Text = 'editTelefone'
    end
    object editCEP: TEdit
      Left = 16
      Top = 240
      Width = 121
      Height = 21
      TabOrder = 6
      Text = 'editCEP'
    end
    object editSexo: TEdit
      Left = 16
      Top = 280
      Width = 121
      Height = 21
      TabOrder = 7
      Text = 'editSexo'
    end
    object editDataNasc: TEdit
      Left = 160
      Top = 72
      Width = 121
      Height = 21
      TabOrder = 8
      Text = 'editDataNasc'
    end
    object editProfissao: TEdit
      Left = 160
      Top = 120
      Width = 121
      Height = 21
      TabOrder = 9
      Text = 'editProfissao'
    end
    object editEstadoCivil: TEdit
      Left = 160
      Top = 160
      Width = 121
      Height = 21
      TabOrder = 10
      Text = 'editEstadoCivil'
    end
    object editTipoPessoa: TEdit
      Left = 160
      Top = 200
      Width = 121
      Height = 21
      TabOrder = 11
      Text = 'editTipoPessoa'
    end
    object editCliFor: TEdit
      Left = 160
      Top = 240
      Width = 121
      Height = 21
      TabOrder = 12
      Text = 'editCliFor'
    end
  end
  inherited dsModelo: TDataSource
    DataSet = adqClientes
    Left = 624
  end
  object adqClientes: TADQuery
    Connection = DataModuleLivraria.ADConnection1
    SQL.Strings = (
      'select * from tbclifor')
    Left = 680
    Top = 16
  end
end
