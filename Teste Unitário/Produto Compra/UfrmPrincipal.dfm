object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 297
  ClientWidth = 251
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 24
    Top = 24
    Width = 68
    Height = 13
    Caption = 'Nome Produto'
  end
  object Label2: TLabel
    Left = 24
    Top = 80
    Width = 56
    Height = 13
    Caption = 'Quantidade'
  end
  object Label3: TLabel
    Left = 24
    Top = 136
    Width = 67
    Height = 13
    Caption = 'Pre'#231'o Unitario'
  end
  object lblValor: TLabel
    Left = 24
    Top = 256
    Width = 107
    Height = 16
    Caption = 'Valor a ser pago'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object edtQuantidade: TEdit
    Left = 24
    Top = 99
    Width = 185
    Height = 21
    TabOrder = 0
  end
  object edtPrecoUnitario: TEdit
    Left = 24
    Top = 155
    Width = 185
    Height = 21
    TabOrder = 1
  end
  object Button1: TButton
    Left = 24
    Top = 200
    Width = 185
    Height = 33
    Caption = 'Button1'
    TabOrder = 2
    OnClick = Button1Click
  end
  object edtNomeProduto: TEdit
    Left = 24
    Top = 43
    Width = 185
    Height = 21
    TabOrder = 3
  end
end
