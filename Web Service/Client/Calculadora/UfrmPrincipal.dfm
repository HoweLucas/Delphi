object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 281
  ClientWidth = 197
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
    Left = 32
    Top = 24
    Width = 40
    Height = 13
    Caption = 'Valor 1: '
  end
  object Label2: TLabel
    Left = 32
    Top = 80
    Width = 37
    Height = 13
    Caption = 'Valor 2:'
  end
  object lblResultado: TLabel
    Left = 56
    Top = 232
    Width = 75
    Height = 16
    Caption = 'Resultado'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object edtValor1: TEdit
    Left = 32
    Top = 43
    Width = 121
    Height = 21
    TabOrder = 0
  end
  object edtValor2: TEdit
    Left = 32
    Top = 99
    Width = 121
    Height = 21
    TabOrder = 1
  end
  object btnCalcular: TButton
    Left = 40
    Top = 188
    Width = 91
    Height = 25
    Caption = 'Calcular'
    TabOrder = 2
    OnClick = btnCalcularClick
  end
  object cmbOperacao: TComboBox
    Left = 32
    Top = 144
    Width = 121
    Height = 21
    TabOrder = 3
    Items.Strings = (
      'Somar'
      'Subtrair'
      'Multiplicar'
      'Dividir')
  end
end
