object frmCadLivro: TfrmCadLivro
  Left = 0
  Top = 0
  Caption = 'Livro'
  ClientHeight = 426
  ClientWidth = 389
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
  object Label1: TLabel
    Left = 16
    Top = 100
    Width = 34
    Height = 13
    Caption = 'Editora'
  end
  object editTitulo: TLabeledEdit
    Left = 79
    Top = 28
    Width = 298
    Height = 21
    EditLabel.Width = 26
    EditLabel.Height = 13
    EditLabel.Caption = 'T'#237'tulo'
    TabOrder = 0
  end
  object editAutor: TLabeledEdit
    Left = 167
    Top = 115
    Width = 153
    Height = 21
    EditLabel.Width = 27
    EditLabel.Height = 13
    EditLabel.Caption = 'Autor'
    TabOrder = 1
  end
  object editDescricao: TLabeledEdit
    Left = 15
    Top = 72
    Width = 362
    Height = 21
    EditLabel.Width = 46
    EditLabel.Height = 13
    EditLabel.Caption = 'Descri'#231#227'o'
    TabOrder = 2
  end
  object comboEditora: TComboBox
    Left = 15
    Top = 115
    Width = 146
    Height = 21
    TabOrder = 3
    Text = 'Seleciona uma editora'
    Items.Strings = (
      '1'
      '2'
      '3'
      '4')
  end
  object editValor: TLabeledEdit
    Left = 16
    Top = 160
    Width = 121
    Height = 21
    EditLabel.Width = 24
    EditLabel.Height = 13
    EditLabel.Caption = 'Valor'
    TabOrder = 4
  end
  object editAno: TLabeledEdit
    Left = 326
    Top = 115
    Width = 51
    Height = 21
    EditLabel.Width = 19
    EditLabel.Height = 13
    EditLabel.Caption = 'Ano'
    TabOrder = 5
  end
  object btnSalvar: TButton
    Left = 16
    Top = 319
    Width = 57
    Height = 25
    Caption = 'Salvar'
    TabOrder = 6
    OnClick = btnSalvarClick
  end
  object btnExcluir: TButton
    Left = 149
    Top = 319
    Width = 75
    Height = 25
    Caption = 'Excluir'
    TabOrder = 7
    OnClick = btnExcluirClick
  end
  object btnAtualizar: TButton
    Left = 79
    Top = 319
    Width = 64
    Height = 25
    Caption = 'Atualizar'
    TabOrder = 8
    OnClick = btnAtualizarClick
  end
  object btnCancelar: TButton
    Left = 230
    Top = 319
    Width = 75
    Height = 25
    Caption = 'Cancelar'
    TabOrder = 9
    OnClick = btnCancelarClick
  end
  object dbGridLivros: TDBGrid
    Left = 16
    Top = 191
    Width = 361
    Height = 122
    DataSource = DataSource1
    TabOrder = 10
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    OnCellClick = dbGridLivrosCellClick
  end
  object editID: TLabeledEdit
    Left = 16
    Top = 28
    Width = 57
    Height = 21
    EditLabel.Width = 11
    EditLabel.Height = 13
    EditLabel.Caption = 'ID'
    TabOrder = 11
  end
  object btnListar: TButton
    Left = 311
    Top = 319
    Width = 51
    Height = 25
    Caption = 'Listar'
    TabOrder = 12
    OnClick = btnListarClick
  end
  object ADQuery1: TADQuery
    Connection = DataModuleLivraria.ADConnection1
    SQL.Strings = (
      'select * from tblivro')
    Left = 344
    Top = 368
  end
  object DataSource1: TDataSource
    DataSet = ADQuery1
    Left = 248
    Top = 368
  end
end
