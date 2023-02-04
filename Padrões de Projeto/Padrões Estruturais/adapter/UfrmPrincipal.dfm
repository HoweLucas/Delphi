object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 140
  ClientWidth = 311
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
    Left = 8
    Top = 8
    Width = 23
    Height = 13
    Caption = 'CEP:'
  end
  object lblLoGradouro: TLabel
    Left = 8
    Top = 61
    Width = 86
    Height = 14
    Caption = 'lblLoGradouro'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object lblBairro: TLabel
    Left = 8
    Top = 85
    Width = 36
    Height = 14
    Caption = 'Bairro'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object lblCidade: TLabel
    Left = 8
    Top = 104
    Width = 41
    Height = 14
    Caption = 'Cidade'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object edtCEP: TEdit
    Left = 8
    Top = 27
    Width = 137
    Height = 21
    TabOrder = 0
  end
  object btnConsultar: TButton
    Left = 176
    Top = 25
    Width = 105
    Height = 25
    Caption = 'Consultar ViaCep'
    TabOrder = 1
    OnClick = btnConsultarClick
  end
  object button1: TButton
    Left = 176
    Top = 56
    Width = 105
    Height = 25
    Caption = 'Consultar Correios'
    TabOrder = 2
    OnClick = button1Click
  end
end
