object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 281
  ClientWidth = 209
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
    Width = 46
    Height = 13
    Caption = 'Numero 1'
  end
  object Label2: TLabel
    Left = 32
    Top = 80
    Width = 46
    Height = 13
    Caption = 'Numero 2'
  end
  object Label3: TLabel
    Left = 32
    Top = 133
    Width = 47
    Height = 13
    Caption = 'Opera'#231#227'o'
  end
  object Resultado: TLabel
    Left = 32
    Top = 240
    Width = 75
    Height = 18
    Caption = 'Resultado'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object edtNumero1: TEdit
    Left = 32
    Top = 43
    Width = 145
    Height = 21
    TabOrder = 0
  end
  object edtNumero2: TEdit
    Left = 32
    Top = 99
    Width = 145
    Height = 21
    TabOrder = 1
  end
  object ComboBox1: TComboBox
    Left = 32
    Top = 152
    Width = 145
    Height = 21
    TabOrder = 2
    Items.Strings = (
      'Somar'
      'Subtrair'
      'Multiplicar'
      'Dividir')
  end
  object Button1: TButton
    Left = 32
    Top = 192
    Width = 145
    Height = 33
    Caption = 'Button1'
    TabOrder = 3
    OnClick = Button1Click
  end
end
