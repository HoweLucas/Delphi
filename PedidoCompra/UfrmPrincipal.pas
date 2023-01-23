unit UfrmPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons,
  Vcl.Imaging.pngimage, Vcl.ExtCtrls, Vcl.Menus;

type
  TfrmPrincipal = class(TForm)
    imgProdutos: TImage;
    imgCompradores: TImage;
    imgFornecedores: TImage;
    imgUnMedida: TImage;
    imgPedidos: TImage;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Image6: TImage;
    Panel1: TPanel;
    imgRelatorio: TImage;
    Label6: TLabel;
    PopupMenu1: TPopupMenu;
    produtos: TMenuItem;
    Compradores: TMenuItem;
    Fornecedores: TMenuItem;
    Fornecedores2: TMenuItem;
    Pedidos: TMenuItem;
    procedure imgProdutosClick(Sender: TObject);
    procedure imgCompradoresClick(Sender: TObject);
    procedure imgFornecedoresClick(Sender: TObject);
    procedure imgUnMedidaClick(Sender: TObject);
    procedure imgPedidosClick(Sender: TObject);
    procedure Fornecedores2Click(Sender: TObject);
    procedure produtosClick(Sender: TObject);
    procedure CompradoresClick(Sender: TObject);
    procedure FornecedoresClick(Sender: TObject);
    procedure PedidosClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

{$R *.dfm}

uses UfrmProdutos, UfrmUnidadeMedida, UfrmFornecedores, UfrmCompradores,
  UfrmPedidos, ufrmRelUnidadeMedida, ufrmRelProdutos, UfrmRelCompradores,
  ufrmRelFornecedores, ufrmRelPedidos;


procedure TfrmPrincipal.CompradoresClick(Sender: TObject);
begin
  if not Assigned(frmRelCompradores) then
    frmRelCompradores := TfrmRelCompradores.Create(Self);

  frmRelCompradores.Show;
end;

procedure TfrmPrincipal.Fornecedores2Click(Sender: TObject);
begin
  if not Assigned(frmRelUnidadeMedida) then
    frmRelUnidadeMedida := TfrmRelUnidadeMedida.Create(Self);

  frmRelUnidadeMedida.Show;
end;

procedure TfrmPrincipal.FornecedoresClick(Sender: TObject);
begin
  if not Assigned(frmRelFornecedores) then
    frmRelFornecedores := TfrmRelFornecedores.Create(Self);

  frmRelFornecedores.Show;
end;

procedure TfrmPrincipal.imgCompradoresClick(Sender: TObject);
begin
  if not Assigned(frmCompradores) then
    frmCompradores := TfrmCompradores.Create(Self);

  frmCompradores.Show;
end;

procedure TfrmPrincipal.imgFornecedoresClick(Sender: TObject);
begin
  if not Assigned(frmFornecedores) then
    frmFornecedores := TfrmFornecedores.Create(Self);

  frmFornecedores.Show;
end;

procedure TfrmPrincipal.imgPedidosClick(Sender: TObject);
begin
  if not Assigned(frmPedidos) then
    frmPedidos := TfrmPedidos.Create(Self);

  frmPedidos.Show;
end;

procedure TfrmPrincipal.imgProdutosClick(Sender: TObject);
begin
  if not Assigned(frmProdutos) then
    frmProdutos := TfrmProdutos.Create(Self);

  frmProdutos.Show;
end;

procedure TfrmPrincipal.imgUnMedidaClick(Sender: TObject);
begin
  if not Assigned(frmUnidadeMedida) then
    frmUnidadeMedida := TfrmUnidadeMedida.Create(Self);

  frmUnidadeMedida.Show;
end;

procedure TfrmPrincipal.PedidosClick(Sender: TObject);
begin
  if not Assigned(frmRelPedidos) then
    frmRelPedidos := TfrmRelpedidos.Create(Self);


  frmRelPedidos.Show;
end;

procedure TfrmPrincipal.produtosClick(Sender: TObject);
begin
   if not Assigned(frmRelProduto) then
    frmRelProduto := TfrmRelproduto.Create(Self);


  frmRelProduto.Show;
end;

end.
