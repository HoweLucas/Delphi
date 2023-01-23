unit UfrmRelCompradores;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Vcl.StdCtrls, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, frxClass, frxDBSet,
  frxExportBaseDialog, frxExportPDF;

type
  TfrmRelCompradores = class(TForm)
    GroupBox1: TGroupBox;
    Label1: TLabel;
    edtDescricao: TEdit;
    FDQuery1: TFDQuery;
    btnExportar: TButton;
    btnVisualizar: TButton;
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
  frmRelCompradores: TfrmRelCompradores;

implementation

{$R *.dfm}

uses UdmPedidos;

procedure TfrmRelCompradores.btnExportarClick(Sender: TObject);
var
  xCaminho: String;
begin
  Self.PrepararFiltro;

  xCaminho := ExtractFilePath(AppLication.ExeName) + 'temp';

  if not DirectoryExists(xCaminho) then
    ForceDirectories (xCaminho);

    frxPDFExport1.Filename := Format('%s\Comprador.pdf', [xCaminho]);
    frxReport1.PrepareReport;
    frxReport1.Export(frxPDFExport1);

end;

procedure TfrmRelCompradores.btnVisualizarClick(Sender: TObject);
begin
  Self.PrepararFiltro;

  frxReport1.ShowReport;
end;

procedure TfrmRelCompradores.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
  FDQuery1.Close;

  frmRelCompradores := nil;
end;

procedure TfrmRelCompradores.PrepararFiltro;
begin
  FDQuery1.Close;
  FDQuery1.ParamByName('NOME').AsString := '';
  if Trim(edtDescricao.Text) <> EmptyStr then
    FDQuery1.ParamByName('NOME').AsString := '%' + Trim(edtDescricao.Text) + '%';
  FDQuery1.Open;
end;

end.
