object frmInicial: TfrmInicial
  Left = 0
  Top = 0
  Caption = 'Inicial'
  ClientHeight = 460
  ClientWidth = 820
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poOwnerFormCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Button1: TButton
    Left = 312
    Top = 41
    Width = 75
    Height = 25
    Caption = 'Livros'
    TabOrder = 2
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 400
    Top = 41
    Width = 75
    Height = 25
    Caption = 'Editora'
    TabOrder = 3
    OnClick = Button2Click
  end
  object Button3: TButton
    Left = 504
    Top = 41
    Width = 75
    Height = 25
    Caption = 'Usu'#225'rios'
    TabOrder = 4
    OnClick = Button3Click
  end
  object Button4: TButton
    Left = 35
    Top = 41
    Width = 127
    Height = 25
    Caption = 'Clientes e Fornecedores'
    TabOrder = 0
    OnClick = Button4Click
  end
  object Button5: TButton
    Left = 177
    Top = 41
    Width = 129
    Height = 25
    Caption = 'Formas de pagamento'
    TabOrder = 1
    OnClick = Button5Click
  end
end
