inherited frmFormPagto: TfrmFormPagto
  Caption = 'Forma de Pagamento'
  ClientHeight = 345
  ClientWidth = 374
  Position = poOwnerFormCenter
  OnShow = FormShow
  ExplicitWidth = 390
  ExplicitHeight = 384
  PixelsPerInch = 96
  TextHeight = 13
  inherited gbDados: TGroupBox
    Width = 374
    Height = 265
    TabOrder = 8
    ExplicitWidth = 354
    ExplicitHeight = 265
  end
  inherited pnControle: TPanel
    Top = 265
    Width = 374
    TabOrder = 9
    ExplicitTop = 265
    ExplicitWidth = 354
    inherited btnFechar: TBitBtn
      Left = 289
      ExplicitLeft = 269
    end
    inherited btnCancelar: TBitBtn
      Left = 200
      ExplicitLeft = 180
    end
    inherited btnSalvar: TBitBtn
      Left = 116
      ExplicitLeft = 96
    end
  end
  object LabeledEdit1: TLabeledEdit [2]
    Left = 89
    Top = 25
    Width = 258
    Height = 21
    EditLabel.Width = 46
    EditLabel.Height = 13
    EditLabel.Caption = 'Descri'#231#227'o'
    TabOrder = 0
  end
  object Button1: TButton [3]
    Left = 28
    Top = 195
    Width = 75
    Height = 25
    Caption = 'Salvar'
    TabOrder = 2
    OnClick = Button1Click
  end
  object Button2: TButton [4]
    Left = 271
    Top = 195
    Width = 75
    Height = 25
    Caption = 'Cancelar'
    TabOrder = 3
    OnClick = Button2Click
  end
  object Button3: TButton [5]
    Left = 190
    Top = 195
    Width = 75
    Height = 25
    Caption = 'Excluir'
    TabOrder = 4
    OnClick = Button3Click
  end
  object Button4: TButton [6]
    Left = 109
    Top = 195
    Width = 75
    Height = 25
    Caption = 'Atualizar'
    TabOrder = 5
    OnClick = Button4Click
  end
  object DBGrid1: TDBGrid [7]
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
  object Button5: TButton [8]
    Left = 271
    Top = 226
    Width = 75
    Height = 25
    Caption = 'Listar'
    TabOrder = 7
    OnClick = Button5Click
  end
  object LabeledEdit2: TLabeledEdit [9]
    Left = 8
    Top = 25
    Width = 75
    Height = 21
    EditLabel.Width = 11
    EditLabel.Height = 13
    EditLabel.Caption = 'ID'
    Enabled = False
    MaxLength = 4
    NumbersOnly = True
    TabOrder = 1
    OnExit = LabeledEdit2Exit
  end
  object ADQuery1: TADQuery
    Connection = DataModuleLivraria.adConnectionLivro
    SQL.Strings = (
      '')
    Left = 24
    Top = 280
  end
  object DataSource1: TDataSource
    DataSet = ADQuery1
    Left = 24
    Top = 224
  end
end
