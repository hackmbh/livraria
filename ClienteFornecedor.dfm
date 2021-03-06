object frmCliFor: TfrmCliFor
  Left = 0
  Top = 0
  Caption = 'Cliente e Fornecedor'
  ClientHeight = 437
  ClientWidth = 720
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsMDIChild
  OldCreateOrder = False
  Position = poMainFormCenter
  Visible = True
  OnClose = FormClose
  OnCreate = FormCreate
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 602
    Top = 8
    Width = 31
    Height = 13
    Caption = 'Status'
  end
  object Label2: TLabel
    Left = 267
    Top = 95
    Width = 55
    Height = 13
    Caption = 'Estado Civil'
  end
  object Label3: TLabel
    Left = 407
    Top = 50
    Width = 86
    Height = 13
    Caption = 'Cliente / Forcedor'
  end
  object Label4: TLabel
    Left = 588
    Top = 93
    Width = 24
    Height = 13
    Caption = 'Sexo'
  end
  object editNomeRazao: TLabeledEdit
    Left = 160
    Top = 23
    Width = 297
    Height = 21
    EditLabel.Width = 97
    EditLabel.Height = 13
    EditLabel.Caption = 'Nome / Raz'#227'o Social'
    TabOrder = 1
  end
  object editCpfCnpj: TLabeledEdit
    Left = 463
    Top = 23
    Width = 133
    Height = 21
    EditLabel.Width = 54
    EditLabel.Height = 13
    EditLabel.Caption = 'CPF / CNPJ'
    TabOrder = 2
  end
  object editEndereco: TLabeledEdit
    Left = 70
    Top = 66
    Width = 331
    Height = 21
    EditLabel.Width = 45
    EditLabel.Height = 13
    EditLabel.Caption = 'Endere'#231'o'
    TabOrder = 5
  end
  object editTelefone: TLabeledEdit
    Left = 8
    Top = 111
    Width = 121
    Height = 21
    EditLabel.Width = 42
    EditLabel.Height = 13
    EditLabel.Caption = 'Telefone'
    TabOrder = 8
  end
  object editCep: TLabeledEdit
    Left = 616
    Top = 66
    Width = 96
    Height = 21
    EditLabel.Width = 19
    EditLabel.Height = 13
    EditLabel.Caption = 'CEP'
    TabOrder = 7
  end
  object editDataNasc: TLabeledEdit
    Left = 138
    Top = 111
    Width = 121
    Height = 21
    EditLabel.Width = 81
    EditLabel.Height = 13
    EditLabel.Caption = 'Data Nascimento'
    TabOrder = 9
  end
  object editProfissao: TLabeledEdit
    Left = 394
    Top = 111
    Width = 188
    Height = 21
    EditLabel.Width = 44
    EditLabel.Height = 13
    EditLabel.Caption = 'Profiss'#227'o'
    TabOrder = 11
  end
  object comboStatus: TComboBox
    Left = 602
    Top = 23
    Width = 111
    Height = 21
    TabOrder = 3
    Text = 'Definir status'
    Items.Strings = (
      '0'
      '1')
  end
  object radioTipoPessoa: TRadioGroup
    Left = 8
    Top = 23
    Width = 57
    Height = 64
    Caption = 'Tipo'
    Items.Strings = (
      'PF'
      'PJ')
    TabOrder = 4
  end
  object comboEstadoCivil: TComboBox
    Left = 267
    Top = 111
    Width = 121
    Height = 21
    TabOrder = 10
    Text = 'Estado Civil'
    Items.Strings = (
      'Solteiro(a)'
      'Casado(a)'
      'Vi'#250'vo(a)'
      'Divorciado(a)')
  end
  object btnSalvar: TButton
    Left = 313
    Top = 400
    Width = 75
    Height = 25
    Caption = 'Salvar'
    TabOrder = 13
    OnClick = btnSalvarClick
  end
  object btnAtualizar: TButton
    Left = 394
    Top = 400
    Width = 75
    Height = 25
    Caption = 'Atualizar'
    TabOrder = 14
    OnClick = btnAtualizarClick
  end
  object btnExcluir: TButton
    Left = 475
    Top = 400
    Width = 75
    Height = 25
    Caption = 'Excluir'
    TabOrder = 15
  end
  object btnCancelar: TButton
    Left = 556
    Top = 400
    Width = 75
    Height = 25
    Caption = 'Cancelar'
    TabOrder = 16
  end
  object dbGridCliFor: TDBGrid
    Left = 8
    Top = 138
    Width = 704
    Height = 256
    DataSource = DataSource1
    Options = [dgTitles, dgIndicator, dgColLines, dgRowLines, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
    TabOrder = 17
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    OnCellClick = dbGridCliForCellClick
    Columns = <
      item
        Expanded = False
        FieldName = 'ID'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NOME'
        Title.Caption = 'Nome'
        Width = 300
        Visible = True
      end>
  end
  object btnListar: TButton
    Left = 637
    Top = 400
    Width = 75
    Height = 25
    Caption = 'Listar'
    TabOrder = 18
    OnClick = btnListarClick
  end
  object editID: TLabeledEdit
    Left = 71
    Top = 23
    Width = 80
    Height = 21
    EditLabel.Width = 11
    EditLabel.Height = 13
    EditLabel.Caption = 'ID'
    TabOrder = 0
  end
  object comboTipoCliFor: TComboBox
    Left = 407
    Top = 66
    Width = 203
    Height = 21
    TabOrder = 6
    Text = '1-Cliente, 2-Fornecedor ou 3-Ambos'
    Items.Strings = (
      '1'
      '2'
      '3')
  end
  object comboGenero: TComboBox
    Left = 588
    Top = 111
    Width = 124
    Height = 21
    TabOrder = 12
    Text = 'Escolha o g'#234'nero'
    Items.Strings = (
      'Feminino'
      'Masculino')
  end
  object ADQuery1: TADQuery
    Connection = DataModuleLivraria.ADConnection1
    SQL.Strings = (
      'select * from tbclifor')
    Left = 656
    Top = 456
  end
  object DataSource1: TDataSource
    DataSet = ADQuery1
    Left = 584
    Top = 456
  end
end
