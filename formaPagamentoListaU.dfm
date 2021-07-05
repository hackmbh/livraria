inherited frmFormaPagamentoLista: TfrmFormaPagamentoLista
  Caption = 'Formas de Pagamento'
  OnActivate = FormActivate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  inherited gbFiltro: TGroupBox
    inherited btnFiltro: TBitBtn
      OnClick = btnFiltroClick
    end
  end
  inherited gbDados: TGroupBox
    inherited dbgDados: TDBGrid
      OnDblClick = dbgDadosDblClick
      OnTitleClick = dbgDadosTitleClick
    end
  end
  inherited pnControle: TPanel
    inherited btnExcluir: TBitBtn
      OnClick = btnExcluirClick
    end
    inherited btnAdicionar: TBitBtn
      OnClick = btnAdicionarClick
    end
  end
  inherited dsModelo: TDataSource
    DataSet = adqFormPgto
    Top = 24
  end
  object adqFormPgto: TADQuery
    Connection = DataModuleLivraria.adConnectionLivro
    Left = 552
    Top = 24
  end
end
