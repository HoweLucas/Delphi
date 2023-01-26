unit ufrmPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TForm1 = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    edtValor: TEdit;
    edtQtdParcelas: TEdit;
    cmbPrazoPagamento: TComboBox;
    btnGerar: TButton;
    Memo1: TMemo;
    procedure btnGerarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

uses
   UFabricaPrazos, UTipoPrazo, UPrazoMensal, UPrazoAnual;
{$R *.dfm}


procedure TForm1.btnGerarClick(Sender: TObject);
var
  xTipoPrazo   : ITipoPrazo;
  xFactoryMethod : IfactoryMethod;
begin
  xFactoryMethod := TFabricaPrazos.create;

  xTipoPrazo := xFactoryMethod.ConsultarPrazo(cmbPrazoPagamento.Text);

  Memo1.Clear;
  Memo1.Lines.Add(xTipoPrazo.ConsultarDescricao);
  Memo1.Lines.Add(xTipoPrazo.ConsultarJuros);
  Memo1.Lines.Add(xTipoPrazo.ConsultarProjecao(StrToFloat(edtValor.Text),(StrToInt(edtQtdParcelas.Text))));
  Memo1.Lines.Add(xTipoPrazo.ConsultarTotal)

end;

end.
