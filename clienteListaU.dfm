inherited frmClientesLista: TfrmClientesLista
  Caption = 'Lista de Clientes'
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  inherited gbFiltro: TGroupBox
    inherited editFiltro: TEdit
      OnChange = editFiltroChange
    end
    inherited btnFiltro: TBitBtn
      OnClick = btnFiltroClick
    end
  end
  inherited gbDados: TGroupBox
    inherited dbgDados: TDBGrid
      OnDblClick = dbgDadosDblClick
      OnTitleClick = dbgDadosTitleClick
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
    inherited btnExcluir: TBitBtn
      OnClick = btnExcluirClick
    end
    inherited btnAdicionar: TBitBtn
      OnClick = btnAdicionarClick
    end
    inherited btnEditar: TBitBtn
      OnClick = btnEditarClick
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
