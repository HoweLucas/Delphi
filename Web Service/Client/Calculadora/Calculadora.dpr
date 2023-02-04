program Calculadora;

uses
  Vcl.Forms,
  UfrmPrincipal in 'UfrmPrincipal.pas' {Form1},
  ICalculadora1 in 'ICalculadora1.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
