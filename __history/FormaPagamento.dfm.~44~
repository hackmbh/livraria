inherited frmFormPagto: TfrmFormPagto
  Caption = 'Forma de Pagamento'
  ClientHeight = 158
  ClientWidth = 364
  Position = poOwnerFormCenter
  OnShow = FormShow
  ExplicitWidth = 380
  ExplicitHeight = 197
  PixelsPerInch = 96
  TextHeight = 13
  inherited gbDados: TGroupBox
    Width = 364
    Height = 78
    ExplicitTop = -2
    ExplicitWidth = 374
    ExplicitHeight = 265
    object editDescricao: TLabeledEdit
      Left = 95
      Top = 33
      Width = 258
      Height = 21
      EditLabel.Width = 46
      EditLabel.Height = 13
      EditLabel.Caption = 'Descri'#231#227'o'
      TabOrder = 1
    end
    object editID: TLabeledEdit
      Left = 14
      Top = 33
      Width = 75
      Height = 21
      EditLabel.Width = 11
      EditLabel.Height = 13
      EditLabel.Caption = 'ID'
      Enabled = False
      MaxLength = 4
      NumbersOnly = True
      TabOrder = 0
      OnExit = editIDExit
    end
  end
  inherited pnControle: TPanel
    Top = 78
    Width = 364
    ExplicitTop = 265
    ExplicitWidth = 374
    inherited btnFechar: TBitBtn
      Left = 279
      TabOrder = 2
      ExplicitLeft = 289
    end
    inherited btnCancelar: TBitBtn
      Left = 190
      OnClick = btnCancelarClick
      ExplicitLeft = 200
    end
    inherited btnSalvar: TBitBtn
      Left = 106
      TabOrder = 0
      OnClick = btnSalvarClick
      ExplicitLeft = 116
      ExplicitTop = 4
    end
  end
  object ADQuery1: TADQuery
    Connection = DataModuleLivraria.adConnectionLivro
    SQL.Strings = (
      '')
    Left = 56
    Top = 96
  end
  object DataSource1: TDataSource
    DataSet = ADQuery1
    Left = 16
    Top = 96
  end
end
