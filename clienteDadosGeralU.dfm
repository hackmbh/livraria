inherited frmClienteDadosGeral: TfrmClienteDadosGeral
  Left = 199
  Top = 236
  Caption = 'Clientes'
  ClientHeight = 571
  ClientWidth = 749
  KeyPreview = True
  Position = poOwnerFormCenter
  OnClose = FormClose
  OnKeyDown = FormKeyDown
  OnShow = FormShow
  ExplicitWidth = 765
  ExplicitHeight = 610
  PixelsPerInch = 96
  TextHeight = 13
  object lbCodigo: TLabel [0]
    Left = 15
    Top = 8
    Width = 33
    Height = 13
    Caption = 'C'#243'digo'
  end
  object lbClienteFornecedor: TLabel [1]
    Left = 353
    Top = 8
    Width = 117
    Height = 13
    Caption = 'Cliente ou Fornecedor?*'
  end
  object lbStatus: TLabel [2]
    Left = 491
    Top = 8
    Width = 37
    Height = 13
    Caption = 'Status*'
  end
  object Label6: TLabel [3]
    Left = 141
    Top = 209
    Width = 44
    Height = 13
    Caption = 'Profiss'#227'o'
  end
  object lbCadastroReg: TLabel [4]
    Left = 14
    Top = 209
    Width = 73
    Height = 13
    Caption = 'Cadastrado em'
  end
  object gbDadosPJ: TGroupBox [5]
    Left = 0
    Top = 54
    Width = 750
    Height = 155
    Caption = 'Dados espec'#237'ficos de Pessoa Jur'#237'dica'
    TabOrder = 5
    Visible = False
    object lbFantasia: TLabel
      Left = 15
      Top = 61
      Width = 71
      Height = 13
      Caption = 'Nome Fantasia'
    end
    object lbCNPJ: TLabel
      Left = 15
      Top = 15
      Width = 97
      Height = 13
      Caption = 'CNPJ* (com pontos)'
    end
    object lbNomePJ: TLabel
      Left = 142
      Top = 15
      Width = 66
      Height = 13
      Caption = 'Raz'#227'o Social*'
    end
    object lbInscEstadual: TLabel
      Left = 294
      Top = 61
      Width = 87
      Height = 13
      Caption = 'Inscri'#231#227'o Estadual'
    end
    object lbIndicadorIE: TLabel
      Left = 421
      Top = 61
      Width = 62
      Height = 13
      Caption = 'Indicador I.E'
    end
    object lbNatJuri: TLabel
      Left = 552
      Top = 61
      Width = 83
      Height = 13
      Caption = 'Natureza Jur'#237'dica'
    end
    object lbContato: TLabel
      Left = 15
      Top = 104
      Width = 39
      Height = 13
      Caption = 'Contato'
    end
    object lbCNAE: TLabel
      Left = 142
      Top = 104
      Width = 56
      Height = 13
      Caption = 'CNAE Fiscal'
    end
    object lbInscMuni: TLabel
      Left = 623
      Top = 15
      Width = 89
      Height = 13
      Caption = 'Inscri'#231#227'o Municipal'
    end
    object editNomeFantasia: TEdit
      Left = 15
      Top = 80
      Width = 273
      Height = 21
      TabOrder = 3
    end
    object editCNPJ: TEdit
      Left = 15
      Top = 34
      Width = 121
      Height = 21
      MaxLength = 18
      TabOrder = 0
    end
    object editRazaoSocial: TEdit
      Left = 142
      Top = 34
      Width = 475
      Height = 21
      TabOrder = 1
    end
    object editInscEst: TEdit
      Left = 294
      Top = 80
      Width = 121
      Height = 21
      TabOrder = 4
    end
    object cbIndicadorIE: TComboBox
      Left = 421
      Top = 80
      Width = 125
      Height = 21
      TabOrder = 5
      Items.Strings = (
        '1 - Contribuinte do ICMS'
        '2 - Contribuinte Isento de Inscri'#231#227'o'
        '9 - N'#227'o Contribuinde')
    end
    object editNatJurCod: TEdit
      Left = 552
      Top = 80
      Width = 33
      Height = 21
      TabOrder = 6
    end
    object editNatJurDesc: TEdit
      Left = 591
      Top = 80
      Width = 138
      Height = 21
      TabOrder = 7
    end
    object editContato: TEdit
      Left = 15
      Top = 122
      Width = 121
      Height = 21
      TabOrder = 8
    end
    object editCNAEDesc: TEdit
      Left = 208
      Top = 122
      Width = 247
      Height = 21
      TabOrder = 10
    end
    object editCNAECod: TEdit
      Left = 142
      Top = 122
      Width = 60
      Height = 21
      TabOrder = 9
    end
    object editInscMun: TEdit
      Left = 623
      Top = 34
      Width = 106
      Height = 21
      TabOrder = 2
    end
    object cboxEmpSimples: TCheckBox
      Left = 463
      Top = 124
      Width = 171
      Height = 17
      Caption = 'Empresa optante pelo Simmples'
      TabOrder = 11
    end
    object cboxIsentoICMS: TCheckBox
      Left = 640
      Top = 123
      Width = 97
      Height = 17
      Caption = 'Isento de ICMS'
      TabOrder = 12
    end
  end
  inherited gbDados: TGroupBox
    Top = 54
    Width = 750
    Height = 155
    Align = alNone
    Caption = 'Dados espec'#237'ficos de Pessoa F'#237'sica'
    TabOrder = 4
    ExplicitTop = 54
    ExplicitWidth = 750
    ExplicitHeight = 155
    object Label3: TLabel
      Left = 141
      Top = 15
      Width = 33
      Height = 13
      Caption = 'Nome*'
    end
    object Label4: TLabel
      Left = 14
      Top = 59
      Width = 96
      Height = 13
      Caption = 'Data de Nascimento'
    end
    object Label8: TLabel
      Left = 333
      Top = 59
      Width = 55
      Height = 13
      Caption = 'Estado Civil'
    end
    object Label13: TLabel
      Left = 453
      Top = 59
      Width = 24
      Height = 13
      Caption = 'Sexo'
    end
    object lbRG: TLabel
      Left = 141
      Top = 59
      Width = 29
      Height = 13
      Caption = 'RG N'#186
    end
    object lbFormacao: TLabel
      Left = 552
      Top = 59
      Width = 47
      Height = 13
      Caption = 'Forma'#231#227'o'
    end
    object Nacionalidade: TLabel
      Left = 14
      Top = 102
      Width = 66
      Height = 13
      Caption = 'Nacionalidade'
    end
    object Label1: TLabel
      Left = 182
      Top = 102
      Width = 61
      Height = 13
      Caption = 'Naturalidade'
    end
    object lbCPFCNPJ: TLabel
      Left = 15
      Top = 15
      Width = 91
      Height = 13
      Caption = 'CPF* (com pontos)'
    end
    object lbRGOrgao: TLabel
      Left = 268
      Top = 59
      Width = 47
      Height = 13
      Caption = 'RG Org'#227'o'
    end
    object editNome: TEdit
      Left = 141
      Top = 34
      Width = 588
      Height = 21
      TabOrder = 1
    end
    object editDataNasc: TEdit
      Left = 14
      Top = 78
      Width = 121
      Height = 21
      MaxLength = 10
      TabOrder = 2
    end
    object cbEstadoCivil: TComboBox
      Left = 333
      Top = 78
      Width = 114
      Height = 21
      Style = csDropDownList
      TabOrder = 5
      Items.Strings = (
        'Solteiro(a)'
        'Casado(a)'
        'Vi'#250'vo(a)'
        'Divorciado(a)')
    end
    object cbSexo: TComboBox
      Left = 453
      Top = 78
      Width = 93
      Height = 21
      Style = csDropDownList
      TabOrder = 6
      Items.Strings = (
        'Feminino'
        'Masculino')
    end
    object editRGNumero: TEdit
      Left = 141
      Top = 78
      Width = 121
      Height = 21
      TabOrder = 3
    end
    object editFormacao: TEdit
      Left = 552
      Top = 78
      Width = 177
      Height = 21
      TabOrder = 7
    end
    object editNacionalidadeCod: TEdit
      Left = 14
      Top = 121
      Width = 33
      Height = 21
      TabOrder = 8
      OnKeyDown = editNacionalidadeCodKeyDown
    end
    object editNacionalidadeDesc: TEdit
      Left = 53
      Top = 121
      Width = 121
      Height = 21
      TabOrder = 9
    end
    object editNaturalidade: TEdit
      Left = 182
      Top = 121
      Width = 265
      Height = 21
      TabOrder = 10
    end
    object editCPF: TEdit
      Left = 14
      Top = 34
      Width = 121
      Height = 21
      MaxLength = 14
      TabOrder = 0
    end
    object editRGOrgao: TEdit
      Left = 268
      Top = 78
      Width = 59
      Height = 21
      TabOrder = 4
    end
  end
  inherited pnControle: TPanel
    Top = 491
    Width = 749
    TabOrder = 10
    ExplicitTop = 491
    ExplicitWidth = 749
    inherited btnFechar: TBitBtn
      Left = 664
      ExplicitLeft = 664
    end
    inherited btnCancelar: TBitBtn
      Left = 575
      ExplicitLeft = 575
    end
    inherited btnSalvar: TBitBtn
      Left = 491
      OnClick = btnSalvarClick
      ExplicitLeft = 491
    end
  end
  object pnEndereco: TPanel [8]
    Left = 0
    Top = 255
    Width = 750
    Height = 202
    TabOrder = 9
    object lbEndereco: TLabel
      Left = 94
      Top = 11
      Width = 51
      Height = 13
      Caption = 'Endere'#231'o*'
    end
    object lbTelefone: TLabel
      Left = 481
      Top = 11
      Width = 48
      Height = 13
      Caption = 'Telefone*'
    end
    object lbCEP: TLabel
      Left = 14
      Top = 11
      Width = 25
      Height = 13
      Caption = 'CEP*'
    end
    object lbNumero: TLabel
      Left = 425
      Top = 11
      Width = 37
      Height = 13
      Caption = 'N'#250'mero'
    end
    object lbComplemento: TLabel
      Left = 14
      Top = 57
      Width = 65
      Height = 13
      Caption = 'Complemento'
    end
    object lbCidade: TLabel
      Left = 320
      Top = 57
      Width = 33
      Height = 13
      Caption = 'Cidade'
    end
    object lbEstado: TLabel
      Left = 569
      Top = 57
      Width = 33
      Height = 13
      Caption = 'Estado'
    end
    object lbBairro: TLabel
      Left = 320
      Top = 104
      Width = 34
      Height = 13
      Caption = 'Bairro*'
    end
    object lbPais: TLabel
      Left = 569
      Top = 104
      Width = 19
      Height = 13
      Caption = 'Pa'#237's'
    end
    object lbTelefone2: TLabel
      Left = 608
      Top = 11
      Width = 33
      Height = 13
      Caption = 'Celular'
    end
    object lbEmail: TLabel
      Left = 268
      Top = 150
      Width = 28
      Height = 13
      Caption = 'E-mail'
    end
    object lbSite: TLabel
      Left = 15
      Top = 150
      Width = 18
      Height = 13
      Caption = 'Site'
    end
    object editTelefone: TEdit
      Left = 481
      Top = 30
      Width = 121
      Height = 21
      MaxLength = 15
      TabOrder = 3
    end
    object editCEP: TEdit
      Left = 14
      Top = 30
      Width = 74
      Height = 21
      MaxLength = 9
      TabOrder = 0
    end
    object editEndereco: TEdit
      Left = 94
      Top = 30
      Width = 325
      Height = 21
      TabOrder = 1
    end
    object editNumero: TEdit
      Left = 425
      Top = 30
      Width = 50
      Height = 21
      TabOrder = 2
    end
    object editCidadeCod: TEdit
      Left = 320
      Top = 76
      Width = 33
      Height = 21
      TabOrder = 6
    end
    object editCidadeDesc: TEdit
      Left = 359
      Top = 76
      Width = 204
      Height = 21
      TabOrder = 7
    end
    object editEstadoCod: TEdit
      Left = 569
      Top = 76
      Width = 33
      Height = 21
      TabOrder = 8
    end
    object editEstadoDesc: TEdit
      Left = 608
      Top = 76
      Width = 121
      Height = 21
      TabOrder = 9
    end
    object editBairroCod: TEdit
      Left = 320
      Top = 123
      Width = 33
      Height = 21
      TabOrder = 10
    end
    object editBairroDesc: TEdit
      Left = 359
      Top = 123
      Width = 204
      Height = 21
      TabOrder = 11
    end
    object editPaisCod: TEdit
      Left = 569
      Top = 123
      Width = 33
      Height = 21
      TabOrder = 12
    end
    object editPaisDesc: TEdit
      Left = 608
      Top = 123
      Width = 121
      Height = 21
      TabOrder = 13
    end
    object editCelular: TEdit
      Left = 608
      Top = 30
      Width = 121
      Height = 21
      TabOrder = 4
    end
    object editEmail: TEdit
      Left = 268
      Top = 169
      Width = 461
      Height = 21
      TabOrder = 15
    end
    object editSite: TEdit
      Left = 15
      Top = 169
      Width = 247
      Height = 21
      TabOrder = 14
    end
    object memoComplemento: TMemo
      Left = 14
      Top = 76
      Width = 300
      Height = 68
      TabOrder = 5
    end
  end
  object editID: TEdit [9]
    Left = 15
    Top = 27
    Width = 73
    Height = 21
    TabOrder = 0
  end
  object rgPessoa: TRadioGroup [10]
    Left = 104
    Top = 8
    Width = 227
    Height = 40
    Caption = 'Pessoa*'
    Columns = 3
    ItemIndex = 0
    Items.Strings = (
      'F'#237'sica'
      'Jur'#237'dica'
      'Estrangeira')
    TabOrder = 1
    OnClick = rgPessoaClick
  end
  object cbTipoCliFor: TComboBox [11]
    Left = 352
    Top = 27
    Width = 121
    Height = 21
    Style = csDropDownList
    TabOrder = 2
    Items.Strings = (
      'Cliente'
      'Fornecedor'
      'Ambos')
  end
  object cbStatus: TComboBox [12]
    Left = 491
    Top = 27
    Width = 145
    Height = 21
    Style = csDropDownList
    TabOrder = 3
    Items.Strings = (
      'Inativo'
      'Ativo')
  end
  object editProfissaoCod: TEdit [13]
    Left = 141
    Top = 228
    Width = 33
    Height = 21
    TabOrder = 7
  end
  object editProfissao: TEdit [14]
    Left = 180
    Top = 228
    Width = 158
    Height = 21
    TabOrder = 8
  end
  object editCadastroReg: TEdit [15]
    Left = 14
    Top = 228
    Width = 121
    Height = 21
    TabOrder = 6
  end
  inherited dsModelo: TDataSource
    DataSet = adqClientes
    Left = 648
    Top = 8
  end
  object adqClientes: TADQuery
    Connection = DataModuleLivraria.adConnectionLivro
    SQL.Strings = (
      'select * from tbclifor')
    Left = 704
    Top = 8
  end
end
