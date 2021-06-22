inherited frmClienteDadosGeral: TfrmClienteDadosGeral
  Caption = 'Clientes'
  ClientHeight = 421
  ClientWidth = 676
  KeyPreview = True
  OnClose = FormClose
  OnKeyDown = FormKeyDown
  OnShow = FormShow
  ExplicitWidth = 692
  ExplicitHeight = 460
  PixelsPerInch = 96
  TextHeight = 13
  inherited gbDados: TGroupBox
    Width = 676
    Height = 341
    object lbCodigo: TLabel
      Left = 24
      Top = 29
      Width = 33
      Height = 13
      Caption = 'C'#243'digo'
    end
    object Label2: TLabel
      Left = 352
      Top = 280
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
      Left = 24
      Top = 125
      Width = 96
      Height = 13
      Caption = 'Data de Nascimento'
    end
    object Label5: TLabel
      Left = 351
      Top = 29
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
      Left = 352
      Top = 125
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
    object Label11: TLabel
      Left = 168
      Top = 229
      Width = 19
      Height = 13
      Caption = 'CEP'
    end
    object Label12: TLabel
      Left = 24
      Top = 282
      Width = 111
      Height = 13
      Caption = 'Cliente ou Fornecedor?'
    end
    object Label13: TLabel
      Left = 168
      Top = 282
      Width = 24
      Height = 13
      Caption = 'Sexo'
    end
    object lbJuridica: TLabel
      Left = 526
      Top = 159
      Width = 36
      Height = 13
      Caption = 'Jur'#237'dica'
      Visible = False
    end
    object lbEstrangeira: TLabel
      Left = 526
      Top = 229
      Width = 55
      Height = 13
      Caption = 'Estrangeira'
      Visible = False
    end
    object lbFisica: TLabel
      Left = 591
      Top = 51
      Width = 26
      Height = 13
      Caption = 'F'#237'sica'
      Visible = False
    end
    object editID: TEdit
      Left = 24
      Top = 48
      Width = 73
      Height = 21
      TabOrder = 0
      Text = 'editID'
    end
    object editNome: TEdit
      Left = 24
      Top = 96
      Width = 473
      Height = 21
      TabOrder = 1
      Text = 'editNome'
    end
    object editCPFCNPJ: TEdit
      Left = 351
      Top = 48
      Width = 146
      Height = 21
      TabOrder = 2
      Text = 'editCPFCNPJ'
    end
    object editEndereco: TEdit
      Left = 24
      Top = 200
      Width = 473
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
      Left = 168
      Top = 248
      Width = 121
      Height = 21
      TabOrder = 5
      Text = 'editCEP'
    end
    object editDataNasc: TEdit
      Left = 24
      Top = 144
      Width = 121
      Height = 21
      TabOrder = 6
      Text = 'editDataNasc'
    end
    object editProfissao: TEdit
      Left = 168
      Top = 144
      Width = 161
      Height = 21
      TabOrder = 7
      Text = 'editProfissao'
    end
    object cbStatus: TComboBox
      Left = 352
      Top = 301
      Width = 145
      Height = 21
      Style = csDropDownList
      TabOrder = 8
      Items.Strings = (
        'Inativo'
        'Ativo')
    end
    object cbSexo: TComboBox
      Left = 168
      Top = 301
      Width = 145
      Height = 21
      Style = csDropDownList
      TabOrder = 9
      Items.Strings = (
        'Feminino'
        'Masculino')
    end
    object cbTipoCliente: TComboBox
      Left = 24
      Top = 301
      Width = 121
      Height = 21
      Style = csDropDownList
      TabOrder = 10
      Items.Strings = (
        'Cliente'
        'Fornecedor'
        'Ambos')
    end
    object cbEstadoCivil: TComboBox
      Left = 352
      Top = 144
      Width = 145
      Height = 21
      Style = csDropDownList
      TabOrder = 11
      Items.Strings = (
        'Solteiro(a)'
        'Casado(a)'
        'Vi'#250'vo(a)'
        'Divorciado(a)')
    end
    object rgPessoa: TRadioGroup
      Left = 110
      Top = 29
      Width = 227
      Height = 40
      Caption = 'Pessoa'
      Columns = 3
      ItemIndex = 0
      Items.Strings = (
        'F'#237'sica'
        'Jur'#237'dica'
        'Estrangeira')
      TabOrder = 12
      OnClick = rgPessoaClick
    end
    object editJuridica: TEdit
      Left = 526
      Top = 178
      Width = 121
      Height = 21
      TabOrder = 13
      Text = 'editJuridica'
      Visible = False
    end
    object editEstrangeira: TEdit
      Left = 526
      Top = 248
      Width = 121
      Height = 21
      TabOrder = 14
      Text = 'editEstrangeira'
      Visible = False
    end
    object editFisica: TEdit
      Left = 534
      Top = 70
      Width = 121
      Height = 21
      TabOrder = 15
      Text = 'editFisica'
    end
  end
  inherited pnControle: TPanel
    Top = 341
    Width = 676
    inherited btnFechar: TBitBtn
      Left = 591
    end
    inherited btnCancelar: TBitBtn
      Left = 502
    end
    inherited btnSalvar: TBitBtn
      Left = 418
      OnClick = btnSalvarClick
    end
  end
  inherited dsModelo: TDataSource
    DataSet = adqClientes
    Left = 24
    Top = 360
  end
  object adqClientes: TADQuery
    Connection = DataModuleLivraria.ADConnection1
    SQL.Strings = (
      'select * from tbclifor')
    Left = 88
    Top = 360
  end
end
