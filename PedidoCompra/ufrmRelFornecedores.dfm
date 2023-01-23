object frmRelFornecedores: TfrmRelFornecedores
  Left = 0
  Top = 0
  Caption = 'Fornecedores'
  ClientHeight = 221
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
    Top = 8
    Width = 394
    Height = 121
    Caption = 'Filtro'
    TabOrder = 0
    object Label1: TLabel
      Left = 8
      Top = 22
      Width = 46
      Height = 13
      Caption = 'Descri'#231#227'o'
    end
    object edtDescricao: TEdit
      Left = 3
      Top = 41
      Width = 358
      Height = 21
      TabOrder = 0
    end
    object btnExportar: TButton
      Left = 184
      Top = 80
      Width = 75
      Height = 25
      Caption = 'Exportar'
      TabOrder = 1
      OnClick = btnExportarClick
    end
    object btnVisualizar: TButton
      Left = 286
      Top = 80
      Width = 75
      Height = 25
      Caption = 'Visualizar'
      TabOrder = 2
      OnClick = btnVisualizarClick
    end
  end
  object FDQuery1: TFDQuery
    Connection = dmPedidos.FDConexao
    SQL.Strings = (
      
        'SELECT ID, CNPJ, NOME  FROM Fornecedor WHERE (CNPJ LIKE :CNPJ) O' +
        'R (COALESCE(:CNPJ, '#39#39') = '#39#39')')
    Left = 224
    Top = 160
    ParamData = <
      item
        Name = 'CNPJ'
        DataType = ftString
        ParamType = ptInput
        Value = Null
      end>
  end
  object frxDBDataset1: TfrxDBDataset
    UserName = 'frxDBDataset1'
    CloseDataSource = False
    DataSet = FDQuery1
    BCDToCurrency = False
    Left = 144
    Top = 160
  end
  object frxReport1: TfrxReport
    Version = '6.7'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick, pbCopy, pbSelection]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 44938.772510671300000000
    ReportOptions.LastChange = 44938.780301261580000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    Left = 64
    Top = 160
    Datasets = <
      item
        DataSet = frxDBDataset1
        DataSetName = 'frxDBDataset1'
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
        Height = 52.913420000000000000
        Top = 18.897650000000000000
        Width = 718.110700000000000000
        object Memo1: TfrxMemoView
          AllowVectorExport = True
          Left = 164.409555000000000000
          Top = 11.338590000000000000
          Width = 389.291590000000000000
          Height = 30.236240000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -27
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'Relat'#243'rio de Fornecedores')
          ParentFont = False
        end
      end
      object Header1: TfrxHeader
        FillType = ftBrush
        Frame.Typ = []
        Height = 34.015770000000000000
        Top = 132.283550000000000000
        Width = 718.110700000000000000
        object Memo2: TfrxMemoView
          AllowVectorExport = True
          Left = 3.779530000000000000
          Top = 7.559060000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          Frame.Typ = []
          Memo.UTF8W = (
            'Id')
        end
        object Memo3: TfrxMemoView
          AllowVectorExport = True
          Left = 128.504020000000000000
          Top = 7.559060000000000000
          Width = 147.401670000000000000
          Height = 18.897650000000000000
          Frame.Typ = []
          Memo.UTF8W = (
            'CNPJ')
        end
        object Memo4: TfrxMemoView
          AllowVectorExport = True
          Left = 302.362400000000000000
          Top = 7.559060000000000000
          Width = 200.315090000000000000
          Height = 18.897650000000000000
          Frame.Typ = []
          Memo.UTF8W = (
            'Nome')
        end
      end
      object MasterData1: TfrxMasterData
        FillType = ftBrush
        Frame.Typ = []
        Height = 60.472480000000000000
        Top = 188.976500000000000000
        Width = 718.110700000000000000
        DataSet = frxDBDataset1
        DataSetName = 'frxDBDataset1'
        RowCount = 0
        object frxDBDataset1ID: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 3.779530000000000000
          Top = 15.118120000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          DataField = 'ID'
          DataSet = frxDBDataset1
          DataSetName = 'frxDBDataset1'
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxDBDataset1."ID"]')
        end
        object frxDBDataset1CNPJ: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 128.504020000000000000
          Top = 15.118120000000000000
          Width = 147.401670000000000000
          Height = 18.897650000000000000
          DataField = 'CNPJ'
          DataSet = frxDBDataset1
          DataSetName = 'frxDBDataset1'
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxDBDataset1."CNPJ"]')
        end
        object frxDBDataset1NOME: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 298.582870000000000000
          Top = 7.559060000000000000
          Width = 204.094620000000000000
          Height = 18.897650000000000000
          DataField = 'NOME'
          DataSet = frxDBDataset1
          DataSetName = 'frxDBDataset1'
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxDBDataset1."NOME"]')
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
    Top = 160
  end
end
