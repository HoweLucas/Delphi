program FactoryMethod;

uses
  Vcl.Forms,
  ufrmPrincipal in 'ufrmPrincipal.pas' {Form1},
  UTipoPrazo in 'Pattern\FactoryMethod\UTipoPrazo.pas',
  UPrazoMensal in 'Pattern\FactoryMethod\UPrazoMensal.pas',
  UPrazoAnual in 'Pattern\FactoryMethod\UPrazoAnual.pas',
  UFabricaPrazos in 'Pattern\FactoryMethod\UFabricaPrazos.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
