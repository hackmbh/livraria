object frmPCodDesc: TfrmPCodDesc
  Left = 0
  Top = 0
  Caption = 'Pesquisa'
  ClientHeight = 314
  ClientWidth = 584
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object gbDados: TGroupBox
    Left = 0
    Top = 0
    Width = 584
    Height = 256
    Align = alClient
    Caption = 'Resultados'
    TabOrder = 0
    object dbgPesquisa: TDBGrid
      Left = 2
      Top = 15
      Width = 580
      Height = 239
      Align = alClient
      DataSource = dsPesquisa
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      OnTitleClick = dbgPesquisaTitleClick
    end
  end
  object gbFiltro: TGroupBox
    Left = 0
    Top = 256
    Width = 584
    Height = 58
    Align = alBottom
    Caption = 
      'Clique no t'#237'tulo da coluna para alterar o campo utilizado como f' +
      'iltro de pesquisa:'
    TabOrder = 1
    object lbFiltro: TLabel
      Left = 56
      Top = 32
      Width = 32
      Height = 13
      Caption = 'lbFiltro'
    end
    object editFiltro: TEdit
      Left = 120
      Top = 24
      Width = 369
      Height = 21
      TabOrder = 0
      OnChange = editFiltroChange
    end
  end
  object dsPesquisa: TDataSource
    DataSet = cdPesquisa
    Left = 176
    Top = 72
  end
  object adqPesquisaCodDesc: TADQuery
    Connection = DataModuleLivraria.ADConnection1
    Left = 496
    Top = 48
  end
  object cdPesquisa: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dsProvider'
    Left = 272
    Top = 56
  end
  object dsProvider: TDataSetProvider
    DataSet = adqPesquisaCodDesc
    Left = 384
    Top = 56
  end
end
