unit UfrmPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TForm1 = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    edtQuantidade: TEdit;
    Label3: TLabel;
    edtPrecoUnitario: TEdit;
    Button1: TButton;
    lblValor: TLabel;
    edtNomeProduto: TEdit;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

uses uProdutos;

procedure TForm1.Button1Click(Sender: TObject);
var
  xCompras : Tpedido;
begin
  xCompras := Tpedido.Create;

  xCompras.NomeProduto   := edtNomeProduto.Text;
  xCompras.Quantidade    := StrToInt(edtQuantidade.Text);
  xCompras.PrecoUnitario := StrToFloat(edtPrecoUnitario.Text);

  lblvalor.Caption := FloatToStr(xCompras.Calculo);

end;

end.
