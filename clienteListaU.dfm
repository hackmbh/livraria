inherited frmClientesLista: TfrmClientesLista
  Caption = 'Lista de Clientes'
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  inherited gbFiltro: TGroupBox
    ExplicitTop = -6
  end
  inherited gbDados: TGroupBox
    ExplicitLeft = 0
    ExplicitTop = 81
    ExplicitWidth = 734
    ExplicitHeight = 288
    inherited dbgDados: TDBGrid
      Columns = <
        item
          Expanded = False
          FieldName = 'ID'
          Title.Caption = 'C'#243'digo'
          Width = 40
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'NOME'
          Title.Caption = 'Nome'
          Width = 180
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'PROFISSAO'
          Title.Caption = 'Profiss'#227'o'
          Visible = True
        end>
    end
  end
  inherited pnControle: TPanel
    inherited btnFechar: TBitBtn
      ExplicitLeft = 650
      ExplicitTop = 4
      ExplicitHeight = 64
    end
    inherited btnExcluir: TBitBtn
      ExplicitLeft = 564
      ExplicitTop = 4
      ExplicitHeight = 64
    end
    inherited btnAdicionar: TBitBtn
      ExplicitLeft = 478
      ExplicitTop = 4
      ExplicitHeight = 64
    end
    inherited btnEditar: TBitBtn
      ExplicitLeft = 392
      ExplicitTop = 4
      ExplicitHeight = 64
    end
  end
  inherited dsModelo: TDataSource
    DataSet = adqClientes
  end
  object adqClientes: TADQuery
    Connection = DataModuleLivraria.ADConnection1
    SQL.Strings = (
      'select * from tbclifor')
    Left = 536
    Top = 32
  end
end
