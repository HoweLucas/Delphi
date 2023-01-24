program Calculadora;

uses
  Vcl.Forms,
  ufrmPrincipal in 'ufrmPrincipal.pas' {Form1},
  UCalculadoraServiceDefault in 'Services\UCalculadoraServiceDefault.pas',
  UCalculadoraService in 'Services\UCalculadoraService.pas',
  UCalculatorService in 'Services\UCalculatorService.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
