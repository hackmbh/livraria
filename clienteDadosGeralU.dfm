inherited frmClienteDadosGeral: TfrmClienteDadosGeral
  Caption = 'Clientes'
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  inherited gbDados: TGroupBox
    object lbCodigo: TLabel
      Left = 24
      Top = 29
      Width = 33
      Height = 13
      Caption = 'C'#243'digo'
    end
    object Label2: TLabel
      Left = 168
      Top = 29
      Width = 31
      Height = 13
      Caption = 'Status'
    end
    object Label3: TLabel
      Left = 24
      Top = 77
      Width = 27
      Height = 13
      Caption = 'Nome'
    end
    object Label4: TLabel
      Left = 168
      Top = 77
      Width = 96
      Height = 13
      Caption = 'Data de Nascimento'
    end
    object Label5: TLabel
      Left = 24
      Top = 125
      Width = 48
      Height = 13
      Caption = 'CPF/CNPJ'
    end
    object Label6: TLabel
      Left = 168
      Top = 125
      Width = 44
      Height = 13
      Caption = 'Profiss'#227'o'
    end
    object Label7: TLabel
      Left = 24
      Top = 181
      Width = 45
      Height = 13
      Caption = 'Endere'#231'o'
    end
    object Label8: TLabel
      Left = 168
      Top = 181
      Width = 55
      Height = 13
      Caption = 'Estado Civil'
    end
    object Label9: TLabel
      Left = 24
      Top = 229
      Width = 42
      Height = 13
      Caption = 'Telefone'
    end
    object Label10: TLabel
      Left = 168
      Top = 229
      Width = 57
      Height = 13
      Caption = 'Tipo Pessoa'
    end
    object Label11: TLabel
      Left = 24
      Top = 282
      Width = 19
      Height = 13
      Caption = 'CEP'
    end
    object Label12: TLabel
      Left = 168
      Top = 282
      Width = 111
      Height = 13
      Caption = 'Cliente ou Fornecedor?'
    end
    object Label13: TLabel
      Left = 324
      Top = 282
      Width = 24
      Height = 13
      Caption = 'Sexo'
    end
    object editID: TEdit
      Left = 24
      Top = 48
      Width = 121
      Height = 21
      TabOrder = 0
      Text = 'editID'
    end
    object editNome: TEdit
      Left = 24
      Top = 96
      Width = 121
      Height = 21
      TabOrder = 1
      Text = 'editNome'
    end
    object editCPFCNPJ: TEdit
      Left = 24
      Top = 144
      Width = 121
      Height = 21
      TabOrder = 2
      Text = 'editCPFCNPJ'
    end
    object editEndereco: TEdit
      Left = 24
      Top = 200
      Width = 121
      Height = 21
      TabOrder = 3
      Text = 'editEndereco'
    end
    object editTelefone: TEdit
      Left = 24
      Top = 248
      Width = 121
      Height = 21
      TabOrder = 4
      Text = 'editTelefone'
    end
    object editCEP: TEdit
      Left = 24
      Top = 301
      Width = 121
      Height = 21
      TabOrder = 5
      Text = 'editCEP'
    end
    object editDataNasc: TEdit
      Left = 168
      Top = 96
      Width = 121
      Height = 21
      TabOrder = 6
      Text = 'editDataNasc'
    end
    object editProfissao: TEdit
      Left = 168
      Top = 144
      Width = 121
      Height = 21
      TabOrder = 7
      Text = 'editProfissao'
    end
    object editTipoPessoa: TEdit
      Left = 168
      Top = 248
      Width = 121
      Height = 21
      TabOrder = 8
      Text = 'editTipoPessoa'
    end
    object cbStatus: TComboBox
      Left = 168
      Top = 50
      Width = 145
      Height = 21
      Style = csDropDownList
      TabOrder = 9
      Items.Strings = (
        'Inativo'
        'Ativo')
    end
    object cbSexo: TComboBox
      Left = 324
      Top = 301
      Width = 145
      Height = 21
      Style = csDropDownList
      TabOrder = 10
      Items.Strings = (
        'Feminino'
        'Masculino')
    end
    object cbTipoCliente: TComboBox
      Left = 168
      Top = 301
      Width = 145
      Height = 21
      Style = csDropDownList
      TabOrder = 11
      Items.Strings = (
        'Cliente'
        'Fornecedor'
        'Ambos')
    end
    object cbEstadoCivil: TComboBox
      Left = 168
      Top = 200
      Width = 145
      Height = 21
      Style = csDropDownList
      TabOrder = 12
      Items.Strings = (
        'Solteiro(a)'
        'Casado(a)'
        'Vi'#250'vo(a)'
        'Divorciado(a)')
    end
    object rgPessoa: TRadioGroup
      Left = 352
      Top = 243
      Width = 241
      Height = 33
      Caption = 'Pessoa'
      Columns = 3
      Items.Strings = (
        'F'#237'sica'
        'Jur'#237'dica'
        'Estrangeira')
      TabOrder = 13
    end
  end
  inherited pnControle: TPanel
    inherited btnSalvar: TBitBtn
      OnClick = btnSalvarClick
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
