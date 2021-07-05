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
    ExplicitTop = -2
    ExplicitWidth = 374
    ExplicitHeight = 265
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
    object LabeledEdit2: TLabeledEdit
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
    object DBGrid1: TDBGrid
      Left = 8
      Top = 52
      Width = 339
      Height = 137
      DataSource = DataSource1
      TabOrder = 2
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      OnCellClick = DBGrid1CellClick
    end
    object Button1: TButton
      Left = 28
      Top = 195
      Width = 75
      Height = 25
      Caption = 'Salvar'
      TabOrder = 3
      Visible = False
      OnClick = Button1Click
    end
    object Button2: TButton
      Left = 271
      Top = 195
      Width = 75
      Height = 25
      Caption = 'Cancelar'
      TabOrder = 4
      OnClick = Button2Click
    end
    object Button3: TButton
      Left = 190
      Top = 195
      Width = 75
      Height = 25
      Caption = 'Excluir'
      TabOrder = 5
      OnClick = Button3Click
    end
    object Button4: TButton
      Left = 109
      Top = 195
      Width = 75
      Height = 25
      Caption = 'Atualizar'
      TabOrder = 6
      Visible = False
      OnClick = Button4Click
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
  end
  inherited pnControle: TPanel
    Top = 265
    Width = 374
    ExplicitTop = 265
    ExplicitWidth = 374
    inherited btnFechar: TBitBtn
      Left = 289
      ExplicitLeft = 289
    end
    inherited btnCancelar: TBitBtn
      Left = 200
      OnClick = btnCancelarClick
      ExplicitLeft = 200
    end
    inherited btnSalvar: TBitBtn
      Left = 116
      OnClick = btnSalvarClick
      ExplicitLeft = 116
      ExplicitTop = 4
    end
  end
  object ADQuery1: TADQuery
    Connection = DataModuleLivraria.adConnectionLivro
    SQL.Strings = (
      '')
    Left = 24
    Top = 248
  end
  object DataSource1: TDataSource
    DataSet = ADQuery1
    Left = 24
    Top = 296
  end
end
