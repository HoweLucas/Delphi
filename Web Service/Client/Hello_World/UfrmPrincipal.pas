unit UfrmPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TForm1 = class(TForm)
    Label1: TLabel;
    edtValor: TEdit;
    btnEchoDouble: TButton;
    btnHelloWorld: TButton;
    lblResultado: TLabel;
    procedure btnEchoDoubleClick(Sender: TObject);
    procedure btnHelloWorldClick(Sender: TObject);
  private
    { Private declarations }
    procedure echoDouble;
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

uses IHello_World1;

procedure TForm1.btnEchoDoubleClick(Sender: TObject);
begin
  Self.EchoDouble;
end;

procedure TForm1.btnHelloWorldClick(Sender: TObject);
begin
  lblResultado.Caption := GetIHello_world.echoHelloWorld;
end;

procedure TForm1.echoDouble;
var
  xValor     : Double;
  xResultado : Double;
begin
  if not TryStrToFloat(edtValor.Text, xValor) then
    raise Exception.Create('Valor Inv�lido');

  xResultado := GetIHello_World.echoDouble(xValor);
  lblresultado.Caption := 'Resultado: ' + xResultado.ToString;
end;

end.
