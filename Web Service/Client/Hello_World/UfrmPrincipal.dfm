object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 81
  ClientWidth = 320
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
    Left = 16
    Top = 12
    Width = 28
    Height = 13
    Caption = 'Valor:'
  end
  object lblResultado: TLabel
    Left = 143
    Top = 60
    Width = 65
    Height = 16
    Caption = 'Resultado'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object edtValor: TEdit
    Left = 16
    Top = 31
    Width = 121
    Height = 21
    TabOrder = 0
  end
  object btnEchoDouble: TButton
    Left = 143
    Top = 29
    Width = 81
    Height = 25
    Caption = 'echoDouble'
    TabOrder = 1
    OnClick = btnEchoDoubleClick
  end
  object btnHelloWorld: TButton
    Left = 230
    Top = 29
    Width = 81
    Height = 25
    Caption = 'Hello World'
    TabOrder = 2
    OnClick = btnHelloWorldClick
  end
end
