object frmRelPedidos: TfrmRelPedidos
  Left = 0
  Top = 0
  Caption = 'Relat'#243'rio - Pedidos'
  ClientHeight = 302
  ClientWidth = 566
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
  object GroupBox1: TGroupBox
    Left = 8
    Top = 8
    Width = 337
    Height = 177
    Caption = 'Filtros'
    TabOrder = 0
    object Label1: TLabel
      Left = 8
      Top = 24
      Width = 53
      Height = 13
      Caption = 'Comprador'
    end
    object Label2: TLabel
      Left = 8
      Top = 80
      Width = 55
      Height = 13
      Caption = 'Fornecedor'
    end
    object btnExportar: TButton
      Left = 152
      Top = 141
      Width = 75
      Height = 25
      Caption = 'Exportar'
      TabOrder = 0
      OnClick = btnExportarClick
    end
    object btnVisualizar: TButton
      Left = 238
      Top = 141
      Width = 75
      Height = 25
      Caption = 'Visualizar'
      TabOrder = 1
      OnClick = btnVisualizarClick
    end
    object DBLookupComprador: TDBLookupComboBox
      Left = 8
      Top = 43
      Width = 305
      Height = 21
      KeyField = 'Id'
      ListField = 'Nome'
      ListSource = dtsLookupComprador
      TabOrder = 2
    end
    object DBLookupFornecedor: TDBLookupComboBox
      Left = 8
      Top = 99
      Width = 305
      Height = 21
      KeyField = 'Id'
      ListField = 'Nome'
      ListSource = dtsFornecedor
      TabOrder = 3
    end
  end
  object dtsLookupComprador: TDataSource
    DataSet = LookupComprador
    Left = 384
    Top = 24
  end
  object dtsFornecedor: TDataSource
    DataSet = LookupFornecedor
    Left = 384
    Top = 88
  end
  object LookupComprador: TFDTable
    IndexFieldNames = 'Id'
    Connection = dmPedidos.FDConexao
    TableName = 'devs2blu.comprador'
    Left = 488
    Top = 24
  end
  object LookupFornecedor: TFDTable
    IndexFieldNames = 'Id'
    Connection = dmPedidos.FDConexao
    TableName = 'devs2blu.fornecedor'
    Left = 488
    Top = 88
  end
  object QryPedido: TFDQuery
    Active = True
    Connection = dmPedidos.FDConexao
    SQL.Strings = (
      'SELECT PEDIDOCOMPRA.ID,'
      '       PEDIDOCOMPRA.NUMERO,'
      '       PEDIDOCOMPRA.DATAPEDIDO,'
      '       COMPRADOR.NOME COMPRADOR,'
      '       COMPRADOR.CARGO,'
      '       FORNECEDOR.NOME FORNECEDOR,'
      '       FORNECEDOR.CNPJ'
      ' FROM  PEDIDOCOMPRA'
      ' LEFT  JOIN COMPRADOR ON PEDIDOCOMPRA.IDCOMPRADOR = COMPRADOR.ID'
      
        ' LEFT  JOIN FORNECEDOR ON PEDIDOCOMPRA.IDFORNECEDOR = FORNECEDOR' +
        '.ID'
      
        ' WHERE (IDCOMPRADOR = :IDCOMPRADOR OR COALESCE(:IDCOMPRADOR, 0) ' +
        '=0)'
      
        '  AND  (IDFORNECEDOR = :IDFORNECEDOR OR COALESCE(:IDFORNECEDOR, ' +
        '0) = 0)')
    Left = 224
    Top = 200
    ParamData = <
      item
        Name = 'IDCOMPRADOR'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'IDFORNECEDOR'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
  end
  object frxDBDataset1: TfrxDBDataset
    UserName = 'frxDBDataset1'
    CloseDataSource = False
    DataSet = QryPedido
    BCDToCurrency = False
    Left = 144
    Top = 200
  end
  object frxReport1: TfrxReport
    Version = '6.7'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick, pbCopy, pbSelection]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 44938.856818912000000000
    ReportOptions.LastChange = 44938.864439907400000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    Left = 56
    Top = 200
    Datasets = <
      item
        DataSet = frxDBDataset1
        DataSetName = 'frxDBDataset1'
      end
      item
        DataSet = frxDBDataset2
        DataSetName = 'frxDBDataset2'
      end>
    Variables = <>
    Style = <>
    object Data: TfrxDataPage
      Height = 1000.000000000000000000
      Width = 1000.000000000000000000
    end
    object Page1: TfrxReportPage
      PaperWidth = 210.000000000000000000
      PaperHeight = 297.000000000000000000
      PaperSize = 9
      LeftMargin = 10.000000000000000000
      RightMargin = 10.000000000000000000
      TopMargin = 10.000000000000000000
      BottomMargin = 10.000000000000000000
      Frame.Typ = []
      MirrorMode = []
      object ReportTitle1: TfrxReportTitle
        FillType = ftBrush
        Frame.Typ = []
        Height = 56.692950000000000000
        Top = 18.897650000000000000
        Width = 718.110700000000000000
        object Memo1: TfrxMemoView
          AllowVectorExport = True
          Left = 171.968615000000000000
          Top = 15.118120000000000000
          Width = 272.126160000000000000
          Height = 26.456710000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -27
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'Relat'#243'rio de Pedidos')
          ParentFont = False
        end
      end
      object Header1: TfrxHeader
        FillType = ftBrush
        Frame.Typ = []
        Height = 41.574830000000000000
        Top = 136.063080000000000000
        Width = 718.110700000000000000
        object Memo2: TfrxMemoView
          AllowVectorExport = True
          Left = 7.559060000000000000
          Top = 15.118120000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -15
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'N'#250'mero')
          ParentFont = False
        end
        object Memo3: TfrxMemoView
          AllowVectorExport = True
          Left = 94.488250000000000000
          Top = 15.118120000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -15
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'Data')
          ParentFont = False
        end
        object Memo4: TfrxMemoView
          AllowVectorExport = True
          Left = 185.196970000000000000
          Top = 15.118120000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -15
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'Comprador')
          ParentFont = False
        end
        object Memo5: TfrxMemoView
          AllowVectorExport = True
          Left = 396.850650000000000000
          Top = 15.118120000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -15
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'Fornecedor')
          ParentFont = False
        end
      end
      object MasterData1: TfrxMasterData
        FillType = ftBrush
        Frame.Typ = []
        Height = 30.236240000000000000
        Top = 200.315090000000000000
        Width = 718.110700000000000000
        DataSet = frxDBDataset1
        DataSetName = 'frxDBDataset1'
        RowCount = 0
        object frxDBDataset1NUMERO: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 7.559060000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          DataField = 'NUMERO'
          DataSet = frxDBDataset1
          DataSetName = 'frxDBDataset1'
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxDBDataset1."NUMERO"]')
        end
        object frxDBDataset1DATAPEDIDO: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 94.488250000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          DataField = 'DATAPEDIDO'
          DataSet = frxDBDataset1
          DataSetName = 'frxDBDataset1'
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxDBDataset1."DATAPEDIDO"]')
        end
        object frxDBDataset1COMPRADOR: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 185.196970000000000000
          Width = 200.315090000000000000
          Height = 18.897650000000000000
          DataField = 'COMPRADOR'
          DataSet = frxDBDataset1
          DataSetName = 'frxDBDataset1'
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxDBDataset1."COMPRADOR"]')
        end
        object frxDBDataset1FORNECEDOR: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 396.850650000000000000
          Width = 400.630180000000000000
          Height = 18.897650000000000000
          DataField = 'FORNECEDOR'
          DataSet = frxDBDataset1
          DataSetName = 'frxDBDataset1'
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxDBDataset1."FORNECEDOR"]')
        end
      end
      object Header2: TfrxHeader
        FillType = ftBrush
        Frame.Typ = []
        Height = 37.795300000000000000
        Top = 253.228510000000000000
        Width = 718.110700000000000000
        object Memo6: TfrxMemoView
          AllowVectorExport = True
          Left = 52.913420000000000000
          Top = 11.338590000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          Frame.Typ = []
          Memo.UTF8W = (
            'Id.Produto')
        end
        object Memo7: TfrxMemoView
          AllowVectorExport = True
          Left = 158.740260000000000000
          Top = 11.338590000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          Frame.Typ = []
          Memo.UTF8W = (
            'Descri'#231#227'o')
        end
        object Memo8: TfrxMemoView
          AllowVectorExport = True
          Left = 347.716760000000000000
          Top = 11.338590000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          Frame.Typ = []
          Memo.UTF8W = (
            'Quantidade')
        end
      end
      object DetailData1: TfrxDetailData
        FillType = ftBrush
        Frame.Typ = []
        Height = 26.456710000000000000
        Top = 313.700990000000000000
        Width = 718.110700000000000000
        DataSet = frxDBDataset2
        DataSetName = 'frxDBDataset2'
        RowCount = 0
        object frxDBDataset2IDPRODUTO: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 52.913420000000000000
          Top = 3.779530000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          DataField = 'IDPRODUTO'
          DataSet = frxDBDataset2
          DataSetName = 'frxDBDataset2'
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxDBDataset2."IDPRODUTO"]')
        end
        object frxDBDataset2PRODUTO: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 158.740260000000000000
          Width = 181.417440000000000000
          Height = 18.897650000000000000
          DataField = 'PRODUTO'
          DataSet = frxDBDataset2
          DataSetName = 'frxDBDataset2'
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxDBDataset2."PRODUTO"]')
        end
        object frxDBDataset2QUANTIDADE: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 347.716760000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          DataField = 'QUANTIDADE'
          DataSet = frxDBDataset2
          DataSetName = 'frxDBDataset2'
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxDBDataset2."QUANTIDADE"]')
        end
      end
    end
  end
  object frxPDFExport1: TfrxPDFExport
    UseFileCache = True
    ShowProgress = True
    OverwritePrompt = False
    DataOnly = False
    OpenAfterExport = False
    PrintOptimized = False
    Outline = False
    Background = False
    HTMLTags = True
    Quality = 95
    Transparency = False
    Author = 'FastReport'
    Subject = 'FastReport PDF export'
    ProtectionFlags = [ePrint, eModify, eCopy, eAnnot]
    HideToolbar = False
    HideMenubar = False
    HideWindowUI = False
    FitWindow = False
    CenterWindow = False
    PrintScaling = False
    PdfA = False
    PDFStandard = psNone
    PDFVersion = pv17
    Left = 440
    Top = 168
  end
  object QryItemCompra: TFDQuery
    Active = True
    IndexFieldNames = 'idPedidoCompra'
    MasterSource = dstPedido
    MasterFields = 'ID'
    Connection = dmPedidos.FDConexao
    SQL.Strings = (
      'SELECT   ITEMCOMPRA.IDPEDIDOCOMPRA,'
      '               ITEMCOMPRA.IDPRODUTO,'
      '               PRODUTO.DESCRICAO PRODUTO,'
      '               ITEMCOMPRA.QUANTIDADE'
      '   FROM  ITEMCOMPRA'
      '   LEFT    JOIN  PRODUTO ON PRODUTO.ID = ITEMCOMPRA.IDPRODUTO')
    Left = 224
    Top = 256
  end
  object frxDBDataset2: TfrxDBDataset
    UserName = 'frxDBDataset2'
    CloseDataSource = False
    DataSet = QryItemCompra
    BCDToCurrency = False
    Left = 144
    Top = 256
  end
  object dstPedido: TDataSource
    DataSet = QryPedido
    Left = 296
    Top = 200
  end
end
