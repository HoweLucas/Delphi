object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 364
  ClientWidth = 500
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 24
    Top = 8
    Width = 33
    Height = 16
    Caption = 'Nome'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label2: TLabel
    Left = 24
    Top = 65
    Width = 19
    Height = 16
    Caption = 'Cpf'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label3: TLabel
    Left = 24
    Top = 121
    Width = 77
    Height = 16
    Caption = 'Especialidade'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object edtNome: TEdit
    Left = 24
    Top = 30
    Width = 145
    Height = 21
    TabOrder = 0
  end
  object edtCPF: TEdit
    Left = 24
    Top = 87
    Width = 145
    Height = 21
    TabOrder = 1
  end
  object edtEspecialidade: TEdit
    Left = 24
    Top = 143
    Width = 145
    Height = 21
    TabOrder = 2
  end
  object btnAdicionar: TButton
    Left = 40
    Top = 170
    Width = 121
    Height = 33
    Caption = 'Adicionar Paciente'
    TabOrder = 3
  end
  object Memo1: TMemo
    Left = 256
    Top = 10
    Width = 185
    Height = 98
    Lines.Strings = (
      'Memo1')
    TabOrder = 4
  end
  object Memo2: TMemo
    Left = 256
    Top = 128
    Width = 185
    Height = 98
    Lines.Strings = (
      'Memo2')
    TabOrder = 5
  end
  object btnProximo: TButton
    Left = 287
    Top = 239
    Width = 121
    Height = 33
    Caption = 'Proximo Paciente'
    TabOrder = 6
  end
  object btnFechar: TButton
    Left = 394
    Top = 329
    Width = 98
    Height = 27
    Caption = 'Fechar'
    TabOrder = 7
  end
end
