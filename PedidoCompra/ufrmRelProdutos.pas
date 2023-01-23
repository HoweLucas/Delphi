unit ufrmRelProdutos;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, frxClass, frxDBSet,
  frxExportBaseDialog, frxExportPDF;

type
  TfrmRelProduto = class(TForm)
    GroupBox1: TGroupBox;
    Label1: TLabel;
    edtDescricao: TEdit;
    btnExportar: TButton;
    btnVisualizar: TButton;
    FDQuery1: TFDQuery;
    frxDBDataset2: TfrxDBDataset;
    frxReport1: TfrxReport;
    frxPDFExport1: TfrxPDFExport;
    Label2: TLabel;
    edtUNMedida: TEdit;
    procedure btnVisualizarClick(Sender: TObject);
    procedure PrepararFiltro;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnExportarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmRelProduto: TfrmRelProduto;

implementation

{$R *.dfm}

uses UdmPedidos;

procedure TfrmRelProduto.btnExportarClick(Sender: TObject);
var
  xCaminho: String;
begin
  Self.PrepararFiltro;

  xCaminho := ExtractFilePath(AppLication.ExeName) + 'temp';

  if not DirectoryExists(xCaminho) then
    ForceDirectories (xCaminho);

    frxPDFExport1.Filename := Format('%s\Produto.pdf', [xCaminho]);
    frxReport1.PrepareReport;
    frxReport1.Export(frxPDFExport1);
end;

procedure TfrmRelProduto.btnVisualizarClick(Sender: TObject);
begin
  Self.PrepararFiltro;

  frxReport1.ShowReport;
end;

procedure TfrmRelProduto.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
  FDQuery1.Close;

  frmRelProduto := nil;
end;

procedure TfrmRelProduto.PrepararFiltro;
begin
  FDQuery1.Close;
  FDQuery1.ParamByName('DESCRICAO').AsString := '';
  FDQuery1.ParamByName('UNDMEDIDA').AsString := '';

  if Trim(edtDescricao.Text) <> EmptyStr then
    FDQuery1.ParamByName('DESCRICAO').AsString := '%' + Trim(edtDescricao.Text) + '%';

  if Trim(edtUNMEDIDA.Text) <> EmptyStr then
    FDQuery1.ParamByName('UNDMEDIDA').AsString := '%' + Trim(edtDescricao.Text) + '%';

  FDQuery1.Open;
end;

end.
