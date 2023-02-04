object fraCadastro: TfraCadastro
  Left = 0
  Top = 0
  Width = 408
  Height = 256
  TabOrder = 0
  object Label1: TLabel
    Left = 11
    Top = 24
    Width = 51
    Height = 13
    Caption = 'Opera'#231#227'o:'
  end
  object label2: TLabel
    Left = 11
    Top = 50
    Width = 51
    Height = 13
    Caption = 'Categoria:'
  end
  object Label3: TLabel
    Left = 34
    Top = 75
    Width = 28
    Height = 13
    Caption = 'Valor:'
  end
  object Shape1: TShape
    Left = 248
    Top = 21
    Width = 3
    Height = 73
  end
  object cmbOperacao: TComboBox
    Left = 68
    Top = 21
    Width = 145
    Height = 21
    TabOrder = 0
    OnChange = cmbOperacaoChange
    Items.Strings = (
      'Cr'#233'dito'
      'D'#233'bito')
  end
  object cmbCategoria: TComboBox
    Left = 68
    Top = 48
    Width = 145
    Height = 21
    TabOrder = 1
  end
  object edtValor: TEdit
    Left = 68
    Top = 73
    Width = 145
    Height = 21
    TabOrder = 2
  end
  object btnGravar: TButton
    Left = 288
    Top = 29
    Width = 65
    Height = 57
    Caption = 'Gravar'
    TabOrder = 3
    OnClick = btnGravarClick
  end
  object DBGrid1: TDBGrid
    Left = 0
    Top = 100
    Width = 405
    Height = 153
    DataSource = Cli
    TabOrder = 4
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'Operacao'
        Width = 150
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Categoria'
        Width = 150
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Valor'
        Visible = True
      end>
  end
  object Cli: TDataSource
    DataSet = ClientDataSet1
    Left = 128
    Top = 184
  end
  object ClientDataSet1: TClientDataSet
    PersistDataPacket.Data = {
      770000009619E0BD0100000018000000030000000000030000007700084F7065
      726163616F01004900000001000557494454480200020032000943617465676F
      72696101004900000001000557494454480200020064000556616C6F72080004
      000000010007535542545950450200490006004D6F6E6579000000}
    Active = True
    Aggregates = <>
    Params = <>
    Left = 40
    Top = 184
    object ClientDataSet1Operacao: TStringField
      FieldName = 'Operacao'
      Size = 50
    end
    object ClientDataSet1Categoria: TStringField
      FieldName = 'Categoria'
      Size = 100
    end
    object ClientDataSet1Valor: TCurrencyField
      FieldName = 'Valor'
    end
  end
end
