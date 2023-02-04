object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 502
  ClientWidth = 662
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  inline fraSaldo1: TfraSaldo
    Left = 368
    Top = 0
    Width = 289
    Height = 105
    TabOrder = 0
    ExplicitLeft = 368
    ExplicitWidth = 289
    ExplicitHeight = 105
    inherited lblCreditos: TLabel
      Left = 232
      Top = 41
      ExplicitLeft = 232
      ExplicitTop = 41
    end
    inherited lblDebitos: TLabel
      Left = 232
      ExplicitLeft = 232
    end
    inherited lblSaldo: TLabel
      Left = 232
      ExplicitLeft = 232
    end
  end
  inline fraHistorico1: TfraHistorico
    Left = 373
    Top = 111
    Width = 289
    Height = 203
    TabOrder = 1
    ExplicitLeft = 373
    ExplicitTop = 111
    ExplicitWidth = 289
    inherited Label1: TLabel
      Top = 19
      ExplicitTop = 19
    end
    inherited DBGrid1: TDBGrid
      Left = 3
      Top = 41
      Width = 275
      Height = 159
      Columns = <
        item
          Expanded = False
          FieldName = 'Categoria'
          Width = 150
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Total'
          Width = 107
          Visible = True
        end>
    end
  end
  inline fraLog1: TfraLog
    Left = 370
    Top = 320
    Width = 292
    Height = 177
    TabOrder = 2
    ExplicitLeft = 370
    ExplicitTop = 320
    ExplicitWidth = 292
    ExplicitHeight = 177
    inherited Label1: TLabel
      Left = 102
      Top = 3
      ExplicitLeft = 102
      ExplicitTop = 3
    end
    inherited Memo1: TMemo
      Left = 6
      Top = 22
      Width = 275
      Height = 154
      ExplicitLeft = 6
      ExplicitTop = 22
      ExplicitWidth = 275
      ExplicitHeight = 154
    end
  end
  inline fraCadastro1: TfraCadastro
    Left = 0
    Top = 0
    Width = 370
    Height = 499
    TabOrder = 3
    ExplicitWidth = 370
    ExplicitHeight = 499
    inherited cmbOperacao: TComboBox
      Top = 23
      ExplicitTop = 23
    end
    inherited btnGravar: TButton
      Left = 276
      ExplicitLeft = 276
    end
    inherited DBGrid1: TDBGrid
      Left = 6
      Width = 356
      Height = 396
      Columns = <
        item
          Expanded = False
          FieldName = 'Opera'#231#227'o'
          Width = 90
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Categoria'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Valor'
          Visible = True
        end>
    end
    inherited Cli: TDataSource
      Left = 120
      Top = 408
    end
    inherited ClientDataSet1: TClientDataSet
      Left = 48
      Top = 408
    end
  end
end
