object frmPesquisa: TfrmPesquisa
  Left = 0
  Top = 0
  Caption = 'Pesquisa'
  ClientHeight = 345
  ClientWidth = 613
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object editFiltro: TEdit
    Left = 8
    Top = 261
    Width = 597
    Height = 21
    TabOrder = 0
    OnChange = editFiltroChange
  end
  object dbgPesquisa: TDBGrid
    Left = 8
    Top = 8
    Width = 597
    Height = 247
    DataSource = dsPesquisa
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    OnDblClick = dbgPesquisaDblClick
  end
  object dsPesquisa: TDataSource
    DataSet = adqPesquisa
    Left = 24
    Top = 296
  end
  object adqPesquisa: TADQuery
    Connection = DataModuleLivraria.ADConnection1
    Left = 88
    Top = 296
  end
end
