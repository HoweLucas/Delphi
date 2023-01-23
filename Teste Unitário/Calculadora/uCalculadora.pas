unit uCalculadora;

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
    Label3: TLabel;
    ComboBox1: TComboBox;
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

{$R *.dfm}

uses uTCalculadora;

procedure TForm1.Button1Click(Sender: TObject);
var
  xCalculadora : TCalculadora;
begin
  xCalculadora := TCalculadora.create;
  try
    case Toperacao(ComboBox1.ItemIndex) of
    opSomar:
     resultado.Caption :=
     FloatToStr(xCalculadora.Somar(StrToFloat(EdtNumero1.text),(StrToFloat(edtNumero2.text))));

    opSubtrair:
     Resultado.Caption :=
     FloatToStr(xCalculadora.Subtrair(StrToFloat(EdtNumero1.text),(StrToFloat(edtNumero2.text))));

    opMultiplicar:
     Resultado.Caption :=
     FloatToStr(xCalculadora.Multiplicar(StrToFloat(EdtNumero1.text),(StrToFloat(edtNumero2.text))));

    opDividir:
     Resultado.Caption :=
     FloatToStr(xCalculadora.Dividir(StrToFloat(EdtNumero1.text),(StrToFloat(edtNumero2.text))));
      end;

  finally
   freeandNil(xCalculadora);
  end;

end;



end.
