program Calculadora;

uses
  Vcl.Forms,
  uCalculadora in 'uCalculadora.pas' {Form1},
  uTCalculadora in 'uTCalculadora.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
