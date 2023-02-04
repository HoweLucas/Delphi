unit UfrmPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TOperacao = (USomar, USubtrair, UMultiplicar, UDividir);
  TForm1 = class(TForm)
    Label1: TLabel;
    edtValor1: TEdit;
    Label2: TLabel;
    edtValor2: TEdit;
    btnCalcular: TButton;
    cmbOperacao: TComboBox;
    lblResultado: TLabel;
    procedure btnCalcularClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

uses ICalculadora1;

procedure TForm1.btnCalcularClick(Sender: TObject);
var
  xValor1, xValor2: Double;
begin
  xValor1 := StrToFloat(edtValor1.Text);
  xValor2 := StrToFloat(edtValor2.Text);

  case TOperacao(cmbOperacao.ItemIndex) of
  USomar:
   lblResultado.Caption := GetICalculadora.Somar(xValor1, xValor2).ToString;

  USubtrair:
   lblResultado.Caption := GetICalculadora.Subtracao(xValor1, xValor2).ToString;

  UMultiplicar:
   lblResultado.Caption := GetiCalculadora.Multiplicacao(xValor1, xValor2).ToString;

  UDividir:
   lblResultado.Caption := GetICalculadora.Dividir(XValor1, xValor2).ToString;
  end;


end;

end.
