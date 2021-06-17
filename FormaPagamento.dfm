object frmFormPagto: TfrmFormPagto
  Left = 0
  Top = 0
  Caption = 'Forma de Pagamento'
  ClientHeight = 345
  ClientWidth = 354
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
  object LabeledEdit1: TLabeledEdit
    Left = 89
    Top = 25
    Width = 258
    Height = 21
    EditLabel.Width = 46
    EditLabel.Height = 13
    EditLabel.Caption = 'Descri'#231#227'o'
    TabOrder = 0
  end
  object Button1: TButton
    Left = 28
    Top = 195
    Width = 75
    Height = 25
    Caption = 'Salvar'
    TabOrder = 2
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 271
    Top = 195
    Width = 75
    Height = 25
    Caption = 'Cancelar'
    TabOrder = 3
    OnClick = Button2Click
  end
  object Button3: TButton
    Left = 190
    Top = 195
    Width = 75
    Height = 25
    Caption = 'Excluir'
    TabOrder = 4
    OnClick = Button3Click
  end
  object Button4: TButton
    Left = 109
    Top = 195
    Width = 75
    Height = 25
    Caption = 'Atualizar'
    TabOrder = 5
    OnClick = Button4Click
  end
  object DBGrid1: TDBGrid
    Left = 8
    Top = 52
    Width = 339
    Height = 137
    DataSource = DataSource1
    TabOrder = 6
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    OnCellClick = DBGrid1CellClick
  end
  object Button5: TButton
    Left = 271
    Top = 226
    Width = 75
    Height = 25
    Caption = 'Listar'
    TabOrder = 7
    OnClick = Button5Click
  end
  object LabeledEdit2: TLabeledEdit
    Left = 8
    Top = 25
    Width = 75
    Height = 21
    EditLabel.Width = 11
    EditLabel.Height = 13
    EditLabel.Caption = 'ID'
    MaxLength = 4
    NumbersOnly = True
    TabOrder = 1
    OnExit = LabeledEdit2Exit
  end
  object Edit1: TEdit
    Left = 104
    Top = 96
    Width = 121
    Height = 21
    TabOrder = 8
    Text = 'Edit1'
  end
  object ADQuery1: TADQuery
    Connection = DataModuleLivraria.ADConnection1
    SQL.Strings = (
      'select * from TBFORM_PAGAMENTO')
    Left = 304
    Top = 280
  end
  object DataSource1: TDataSource
    DataSet = ADQuery1
    Left = 240
    Top = 280
  end
end
