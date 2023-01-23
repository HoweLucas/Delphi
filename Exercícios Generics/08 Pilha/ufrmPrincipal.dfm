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
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Edit1: TEdit
    Left = 8
    Top = 16
    Width = 121
    Height = 21
    TabOrder = 0
    Text = 'Edit1'
  end
  object BtnPush: TButton
    Left = 8
    Top = 43
    Width = 75
    Height = 25
    Caption = 'Push'
    TabOrder = 1
    OnClick = BtnPushClick
  end
  object BtnPop: TButton
    Left = 8
    Top = 74
    Width = 75
    Height = 25
    Caption = 'Pop'
    TabOrder = 2
    OnClick = BtnPopClick
  end
  object BtnExtract: TButton
    Left = 8
    Top = 105
    Width = 75
    Height = 25
    Caption = 'Extract'
    TabOrder = 3
    OnClick = BtnExtractClick
  end
  object btnPeek: TButton
    Left = 8
    Top = 136
    Width = 75
    Height = 25
    Caption = 'Peek'
    TabOrder = 4
    OnClick = btnPeekClick
  end
  object btnTrimExcess: TButton
    Left = 8
    Top = 167
    Width = 75
    Height = 25
    Caption = 'TrimExcess'
    TabOrder = 5
    OnClick = btnTrimExcessClick
  end
  object btnCount: TButton
    Left = 8
    Top = 198
    Width = 75
    Height = 25
    Caption = 'Count'
    TabOrder = 6
    OnClick = btnCountClick
  end
  object btnCapacity: TButton
    Left = 8
    Top = 229
    Width = 75
    Height = 25
    Caption = 'Capacity'
    TabOrder = 7
    OnClick = btnCapacityClick
  end
  object Memo1: TMemo
    Left = 168
    Top = 16
    Width = 233
    Height = 238
    Lines.Strings = (
      'Memo1')
    TabOrder = 8
  end
end
