program Hospital;

uses
  Vcl.Forms,
  ufrmPrincipal in 'ufrmPrincipal.pas' {Form1},
  UPaciente in 'UPaciente.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
