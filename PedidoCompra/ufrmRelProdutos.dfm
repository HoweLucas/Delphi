object frmRelProduto: TfrmRelProduto
  Left = 0
  Top = 0
  Caption = 'frmRelProduto'
  ClientHeight = 194
  ClientWidth = 418
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object GroupBox1: TGroupBox
    Left = 16
    Top = 16
    Width = 394
    Height = 105
    Caption = 'Filtros'
    TabOrder = 0
    object Label1: TLabel
      Left = 8
      Top = 16
      Width = 46
      Height = 13
      Caption = 'Descri'#231#227'o'
    end
    object Label2: TLabel
      Left = 232
      Top = 16
      Width = 54
      Height = 13
      Caption = 'Un. Medida'
    end
    object edtDescricao: TEdit
      Left = 14
      Top = 35
      Width = 203
      Height = 21
      TabOrder = 0
    end
    object btnExportar: TButton
      Left = 216
      Top = 71
      Width = 75
      Height = 25
      Caption = 'Exportar'
      TabOrder = 1
      OnClick = btnExportarClick
    end
    object btnVisualizar: TButton
      Left = 302
      Top = 71
      Width = 75
      Height = 25
      Caption = 'Visualizar'
      TabOrder = 2
      OnClick = btnVisualizarClick
    end
    object edtUNMedida: TEdit
      Left = 232
      Top = 35
      Width = 145
      Height = 21
      TabOrder = 3
    end
  end
  object FDQuery1: TFDQuery
    Active = True
    Connection = dmPedidos.FDConexao
    SQL.Strings = (
      'SELECT PRODUTO.ID, '
      '       PRODUTO.DESCRICAO,'
      '       UNIDADEMEDIDA.DESCRICAO UNDMEDIDA  '
      ' FROM PRODUTO '
      
        ' LEFT JOIN UNIDADEMEDIDA ON PRODUTO.IDUNIDADEMEDIDA = UNIDADEMED' +
        'IDA.ID '
      
        'WHERE ((PRODUTO.DESCRICAO LIKE :DESCRICAO) OR (COALESCE(:DESCRIC' +
        'AO, '#39#39') = '#39#39'))'
      
        '  AND ((UNIDADEMEDIDA.DESCRICAO LIKE :UNDMEDIDA) OR (COALESCE(:U' +
        'NDMEDIDA, '#39#39') = '#39#39'))')
    Left = 216
    Top = 144
    ParamData = <
      item
        Name = 'DESCRICAO'
        DataType = ftString
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'UNDMEDIDA'
        DataType = ftString
        ParamType = ptInput
        Value = Null
      end>
  end
  object frxDBDataset2: TfrxDBDataset
    UserName = 'frxDBDataset2'
    CloseDataSource = False
    DataSet = FDQuery1
    BCDToCurrency = False
    Left = 128
    Top = 144
  end
  object frxReport1: TfrxReport
    Version = '6.7'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick, pbCopy, pbSelection]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 44937.884883020800000000
    ReportOptions.LastChange = 44938.806801678240000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    Left = 40
    Top = 144
    Datasets = <
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
      HGuides.Strings = (
        '124')
      object ReportTitle1: TfrxReportTitle
        FillType = ftBrush
        Frame.Typ = []
        Height = 56.692950000000000000
        Top = 18.897650000000000000
        Width = 718.110700000000000000
        object Memo1: TfrxMemoView
          AllowVectorExport = True
          Left = 196.535560000000000000
          Top = 13.228355000000000000
          Width = 325.039580000000000000
          Height = 30.236240000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -27
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'Relat'#243'rio de Produtos')
          ParentFont = False
        end
      end
      object Header1: TfrxHeader
        FillType = ftBrush
        Frame.Typ = []
        Height = 37.795300000000000000
        Top = 136.063080000000000000
        Width = 718.110700000000000000
        object Memo2: TfrxMemoView
          AllowVectorExport = True
          Left = 3.110235000000000000
          Top = 15.007885000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -15
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'Id')
          ParentFont = False
        end
        object Memo3: TfrxMemoView
          AllowVectorExport = True
          Left = 106.606370000000000000
          Top = 15.118120000000000000
          Width = 192.756030000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -15
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'Descri'#231#227'o')
          ParentFont = False
        end
        object Memo4: TfrxMemoView
          AllowVectorExport = True
          Left = 309.921460000000000000
          Top = 14.393630000000000000
          Width = 196.535560000000000000
          Height = 18.897650000000000000
          Frame.Typ = []
          Memo.UTF8W = (
            'Un. Medida')
        end
      end
      object MasterData1: TfrxMasterData
        FillType = ftBrush
        Frame.Typ = []
        Height = 68.031540000000000000
        Top = 196.535560000000000000
        Width = 718.110700000000000000
        DataSet = frxDBDataset2
        DataSetName = 'frxDBDataset2'
        RowCount = 0
        object frxDBDataset2ID: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 3.779530000000000000
          Top = 10.614100000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          DataField = 'ID'
          DataSet = frxDBDataset2
          DataSetName = 'frxDBDataset2'
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxDBDataset2."ID"]')
        end
        object frxDBDataset2DESCRICAO: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 105.826840000000000000
          Top = 10.614100000000000000
          Width = 192.756030000000000000
          Height = 18.897650000000000000
          DataField = 'DESCRICAO'
          DataSet = frxDBDataset2
          DataSetName = 'frxDBDataset2'
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxDBDataset2."DESCRICAO"]')
        end
        object frxDBDataset2UNDMEDIDA: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 309.921460000000000000
          Top = 10.614100000000000000
          Width = 196.535560000000000000
          Height = 18.897650000000000000
          DataField = 'UNDMEDIDA'
          DataSet = frxDBDataset2
          DataSetName = 'frxDBDataset2'
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxDBDataset2."UNDMEDIDA"]')
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
    Left = 312
    Top = 146
  end
end
