object frmUsuarios: TfrmUsuarios
  Left = 0
  Top = 0
  Caption = 'Usu'#225'rio'
  ClientHeight = 423
  ClientWidth = 309
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsMDIChild
  OldCreateOrder = False
  Position = poOwnerFormCenter
  Visible = True
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label2: TLabel
    Left = 111
    Top = 50
    Width = 31
    Height = 13
    Caption = 'Status'
  end
  object bntExcluir: TButton
    Left = 178
    Top = 241
    Width = 48
    Height = 25
    Caption = 'Excluir'
    TabOrder = 0
    OnClick = bntExcluirClick
  end
  object editNome: TLabeledEdit
    Left = 111
    Top = 23
    Width = 187
    Height = 21
    EditLabel.Width = 27
    EditLabel.Height = 13
    EditLabel.Caption = 'Nome'
    TabOrder = 1
  end
  object editSenha: TLabeledEdit
    Left = 8
    Top = 66
    Width = 97
    Height = 21
    EditLabel.Width = 30
    EditLabel.Height = 13
    EditLabel.Caption = 'Senha'
    TabOrder = 2
  end
  object comboStatus: TComboBox
    Left = 111
    Top = 66
    Width = 140
    Height = 21
    TabOrder = 3
    Text = 'Escolha um status'
    Items.Strings = (
      '0'
      '1')
  end
  object btnCancelar: TButton
    Left = 232
    Top = 241
    Width = 66
    Height = 25
    Caption = 'Cancelar'
    TabOrder = 4
    OnClick = btnCancelarClick
  end
  object editID: TLabeledEdit
    Left = 8
    Top = 23
    Width = 97
    Height = 21
    EditLabel.Width = 11
    EditLabel.Height = 13
    EditLabel.Caption = 'ID'
    TabOrder = 5
  end
  object btnAtualizar: TButton
    Left = 107
    Top = 241
    Width = 65
    Height = 25
    Caption = 'Atualizar'
    TabOrder = 6
    OnClick = btnAtualizarClick
  end
  object btnSalvar: TButton
    Left = 52
    Top = 241
    Width = 49
    Height = 25
    Caption = 'Salvar'
    TabOrder = 7
    OnClick = btnSalvarClick
  end
  object btnListar: TButton
    Left = 232
    Top = 272
    Width = 65
    Height = 25
    Caption = 'Listar'
    TabOrder = 8
    OnClick = btnListarClick
  end
  object dbGridUsuarios: TDBGrid
    Left = 8
    Top = 104
    Width = 290
    Height = 120
    DataSource = DataSource1
    TabOrder = 9
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    OnCellClick = dbGridUsuariosCellClick
  end
  object ADQuery1: TADQuery
    Connection = DataModuleLivraria.ADConnection1
    Left = 256
    Top = 328
  end
  object DataSource1: TDataSource
    DataSet = ADQuery1
    Left = 192
    Top = 328
  end
end
