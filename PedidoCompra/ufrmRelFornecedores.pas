unit ufrmRelFornecedores;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.StdCtrls, frxClass, frxDBSet,
  frxExportBaseDialog, frxExportPDF;

type
  TfrmRelFornecedores = class(TForm)
    GroupBox1: TGroupBox;
    Label1: TLabel;
    edtDescricao: TEdit;
    btnExportar: TButton;
    btnVisualizar: TButton;
    FDQuery1: TFDQuery;
    frxDBDataset1: TfrxDBDataset;
    frxReport1: TfrxReport;
    frxPDFExport1: TfrxPDFExport;
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
  frmRelFornecedores: TfrmRelFornecedores;

implementation

{$R *.dfm}

uses UdmPedidos;

procedure TfrmRelFornecedores.btnExportarClick(Sender: TObject);
var
  xCaminho: String;
begin
  Self.PrepararFiltro;

  xCaminho := ExtractFilePath(AppLication.ExeName) + 'temp';

  if not DirectoryExists(xCaminho) then
    ForceDirectories (xCaminho);

    frxPDFExport1.Filename := Format('%s\Fornecedor.pdf', [xCaminho]);
    frxReport1.PrepareReport;
    frxReport1.Export(frxPDFExport1);
end;

procedure TfrmRelFornecedores.btnVisualizarClick(Sender: TObject);
begin
  Self.PrepararFiltro;

  frxReport1.ShowReport;
end;

procedure TfrmRelFornecedores.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
  FDQuery1.Close;

  frmRelFornecedores := nil;
end;

procedure TfrmRelFornecedores.PrepararFiltro;
begin
  FDQuery1.Close;
  FDQuery1.ParamByName('cnpj').AsString := '';
  if Trim(edtDescricao.Text) <> EmptyStr then
    FDQuery1.ParamByName('cnpj').AsString := '%' + Trim(edtDescricao.Text) + '%';
  FDQuery1.Open;
end;

end.
