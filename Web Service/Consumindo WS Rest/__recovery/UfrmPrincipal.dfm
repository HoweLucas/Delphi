object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 190
  ClientWidth = 335
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object lblResultado: TLabel
    Left = 120
    Top = 52
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
  object btnPingPong: TButton
    Left = 48
    Top = 8
    Width = 75
    Height = 25
    Caption = 'PingPong'
    TabOrder = 0
    OnClick = btnPingPongClick
  end
  object btnHelloWorld: TButton
    Left = 137
    Top = 8
    Width = 75
    Height = 25
    Caption = 'Hello World'
    TabOrder = 1
    OnClick = btnHelloWorldClick
  end
  object RESTClient1: TRESTClient
    BaseURL = 'http://localhost:9090/ping'
    Params = <>
    Left = 40
    Top = 112
  end
  object RESTRequest1: TRESTRequest
    AssignedValues = [rvConnectTimeout, rvReadTimeout]
    Client = RESTClient1
    Params = <>
    Response = RESTResponse1
    Left = 128
    Top = 112
  end
  object RESTResponse1: TRESTResponse
    Left = 224
    Top = 112
  end
end
