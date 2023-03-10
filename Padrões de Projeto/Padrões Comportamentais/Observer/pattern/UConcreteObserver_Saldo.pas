unit UConcreteObserver_Saldo;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, UObserver,
  UNotificacao;

type
  TfraSaldo = class(TFrame, IObserver)
    Label1: TLabel;
    Label2: TLabel;
    lblCreditos: TLabel;
    Label4: TLabel;
    lblDebitos: TLabel;
    Label6: TLabel;
    lblSaldo: TLabel;
  private
    { Private declarations }
    FCreditos: Real;
    FDebitos:Real;
  public
    { Public declarations }
    procedure Atualizar(aNotificacao: TNotificacao);
  end;

implementation

{$R *.dfm}

{ TFrame1 }

procedure TfraSaldo.Atualizar(aNotificacao: TNotificacao);
var
  xSaldo: Real;
begin
  // Soma o valor ? variavel conforme o tipo de opera??o
  if aNotificacao.Operacao = 'Cr?dito' then
    FCreditos := FCreditos + aNotificacao.Valor
  else if aNotificacao.Operacao = 'D?bito' then
    FDebitos := FDebitos + aNotificacao.Valor;

  // Calcula o saldo
  xSaldo := FCreditos - FDebitos;

  lblCreditos.Caption := FormatFloat('###,##0,00', FCreditos);
  lblDebitos.Caption  := FormatFloat('###,##0,00', FDebitos);
  lblSaldo.Caption    := FormatFloat('###,##0,00', xSaldo);
end;

end.
