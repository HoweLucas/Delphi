program JogoDaVelha;

uses
  System.StartUpCopy,
  FMX.Forms,
  ufrmPrincipal in 'ufrmPrincipal.pas' {Form1},
  UJogoVelha in 'UJogoVelha.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
