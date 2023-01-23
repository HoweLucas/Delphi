object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 281
  ClientWidth = 418
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object ComboBox1: TComboBox
    Left = 136
    Top = 24
    Width = 169
    Height = 21
    TabOrder = 0
  end
  object btnDias: TButton
    Left = 230
    Top = 80
    Width = 75
    Height = 25
    Caption = 'Dias'
    TabOrder = 1
    OnClick = btnDiasClick
  end
  object btnMes: TButton
    Left = 136
    Top = 80
    Width = 75
    Height = 25
    Caption = 'M'#234's'
    TabOrder = 2
    OnClick = btnMesClick
  end
end
