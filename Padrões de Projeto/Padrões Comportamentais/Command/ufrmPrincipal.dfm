object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 307
  ClientWidth = 598
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
    Top = 56
    Width = 55
    Height = 13
    Caption = 'Programas:'
  end
  object Label2: TLabel
    Left = 207
    Top = 56
    Width = 52
    Height = 13
    Caption = 'Processos:'
  end
  object Label3: TLabel
    Left = 398
    Top = 56
    Width = 110
    Height = 13
    Caption = 'Vari'#225'veis de Ambiente:'
  end
  object btnExecutar: TButton
    Left = 256
    Top = 8
    Width = 121
    Height = 33
    Caption = 'Executar Comandos'
    TabOrder = 0
    OnClick = btnExecutarClick
  end
  object memoProgramas: TMemo
    Left = 16
    Top = 75
    Width = 185
    Height = 222
    Lines.Strings = (
      'memoProcessos')
    ScrollBars = ssBoth
    TabOrder = 1
  end
  object memoProcessos: TMemo
    Left = 207
    Top = 75
    Width = 185
    Height = 222
    Lines.Strings = (
      'btnProgramas')
    ScrollBars = ssBoth
    TabOrder = 2
  end
  object memoVariaveis: TMemo
    Left = 398
    Top = 75
    Width = 185
    Height = 222
    Lines.Strings = (
      'memoVariaveis')
    ScrollBars = ssBoth
    TabOrder = 3
  end
end
