unit ufrmPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TForm1 = class(TForm)
    Label1: TLabel;
    edtNumero1: TEdit;
    Label2: TLabel;
    edtNumero2: TEdit;
    ComboBox1: TComboBox;
    Label3: TLabel;
    Button1: TButton;
    Resultado: TLabel;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

uses
  UCalculatorService, UCalculadoraServiceDefault;

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
var
  xCalculadora : TCalculatorService;
begin
  xCalculadora := TCalculatorService.create(StrToFloat(EdtNumero1.Text),
                                                       StrToFloat(edtNumero2.Text),
                                                       ICalculadoraService.create);
try
 Resultado.Caption := xCalculadora.Calculo(Toperacao(ComboBox1.ItemIndex)).ToString;


finally
FreeAndNil(xCalculadora);
end;
end;

end.
