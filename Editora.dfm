object frmEditora: TfrmEditora
  Left = 0
  Top = 0
  Caption = 'Editora'
  ClientHeight = 447
  ClientWidth = 361
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
  object editNome: TLabeledEdit
    Left = 71
    Top = 22
    Width = 282
    Height = 21
    EditLabel.Width = 27
    EditLabel.Height = 13
    EditLabel.Caption = 'Nome'
    TabOrder = 0
  end
  object editDescricao: TLabeledEdit
    Left = 8
    Top = 64
    Width = 345
    Height = 21
    EditLabel.Width = 46
    EditLabel.Height = 13
    EditLabel.Caption = 'Descri'#231#227'o'
    TabOrder = 1
  end
  object btnExcluir: TButton
    Left = 197
    Top = 265
    Width = 75
    Height = 25
    Caption = 'Excluir'
    TabOrder = 2
    OnClick = btnExcluirClick
  end
  object bntCancelar: TButton
    Left = 278
    Top = 265
    Width = 75
    Height = 25
    Caption = 'Cancelar'
    TabOrder = 3
    OnClick = bntCancelarClick
  end
  object btnSalvar: TButton
    Left = 35
    Top = 265
    Width = 75
    Height = 25
    Caption = 'Salvar'
    TabOrder = 4
    OnClick = btnSalvarClick
  end
  object btnAtualizar: TButton
    Left = 116
    Top = 265
    Width = 75
    Height = 25
    Caption = 'Atualizar'
    TabOrder = 5
    OnClick = btnAtualizarClick
  end
  object editID: TLabeledEdit
    Left = 8
    Top = 22
    Width = 57
    Height = 21
    EditLabel.Width = 11
    EditLabel.Height = 13
    EditLabel.Caption = 'ID'
    TabOrder = 6
  end
  object dbGridEditora: TDBGrid
    Left = 8
    Top = 119
    Width = 345
    Height = 120
    DataSource = DataSource1
    TabOrder = 7
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    OnCellClick = dbGridEditoraCellClick
  end
  object btnListar: TButton
    Left = 278
    Top = 296
    Width = 75
    Height = 25
    Caption = 'Listar'
    TabOrder = 8
    OnClick = btnListarClick
  end
  object ADQuery1: TADQuery
    Connection = DataModuleLivraria.ADConnection1
    SQL.Strings = (
      'select * from tbeditora')
    Left = 296
    Top = 392
  end
  object DataSource1: TDataSource
    DataSet = ADQuery1
    Left = 232
    Top = 392
  end
end
