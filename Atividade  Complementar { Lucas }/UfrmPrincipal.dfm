object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Funcinario'
  ClientHeight = 208
  ClientWidth = 229
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
    Top = 26
    Width = 116
    Height = 13
    Caption = 'Selecione o Funcion'#225'rio:'
  end
  object btnExecutar: TButton
    Left = 78
    Top = 72
    Width = 75
    Height = 25
    Caption = 'Executar'
    TabOrder = 0
    OnClick = btnExecutarClick
  end
  object cmbFuncionario: TComboBox
    Left = 24
    Top = 45
    Width = 145
    Height = 21
    TabOrder = 1
    Text = 'cmbFuncionario'
    Items.Strings = (
      'Funcionario1'
      'Funcionario2')
  end
  object mmResultado: TMemo
    Left = 24
    Top = 111
    Width = 185
    Height = 89
    TabOrder = 2
  end
end
