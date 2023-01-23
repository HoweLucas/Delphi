object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 249
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
    Left = 16
    Top = 16
    Width = 121
    Height = 21
    TabOrder = 0
    Text = 'Edit1'
  end
  object btnAdd: TButton
    Left = 16
    Top = 56
    Width = 75
    Height = 25
    Caption = 'Add'
    TabOrder = 1
    OnClick = btnAddClick
  end
  object btnRemove: TButton
    Left = 16
    Top = 87
    Width = 75
    Height = 25
    Caption = 'Remove'
    TabOrder = 2
    OnClick = btnRemoveClick
  end
  object btnListar: TButton
    Left = 16
    Top = 118
    Width = 75
    Height = 25
    Caption = 'Listar'
    TabOrder = 3
    OnClick = btnListarClick
  end
  object btnCapacity: TButton
    Left = 16
    Top = 149
    Width = 75
    Height = 25
    Caption = 'Capacity'
    TabOrder = 4
    OnClick = btnCapacityClick
  end
  object btnCount: TButton
    Left = 16
    Top = 180
    Width = 75
    Height = 25
    Caption = 'Count'
    TabOrder = 5
    OnClick = btnCountClick
  end
  object btnNotify: TButton
    Left = 16
    Top = 211
    Width = 75
    Height = 25
    Caption = 'OnNotify'
    TabOrder = 6
    OnClick = btnNotifyClick
  end
  object Memo1: TMemo
    Left = 176
    Top = 16
    Width = 226
    Height = 220
    Lines.Strings = (
      'Memo1')
    TabOrder = 7
  end
end
