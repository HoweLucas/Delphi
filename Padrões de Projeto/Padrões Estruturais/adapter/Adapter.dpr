program Adapter;

uses
  Vcl.Forms,
  UfrmPrincipal in 'UfrmPrincipal.pas' {Form1},
  UWebServiceCorreios in 'Pattern\UWebServiceCorreios.pas',
  UInterfaceViaCEP in 'Pattern\UInterfaceViaCEP.pas',
  UAdaptee in 'Pattern\UAdaptee.pas',
  UAdapter in 'Pattern\UAdapter.pas',
  UTarget in 'Pattern\UTarget.pas',
  UWebServiceViaCEP in 'Pattern\UWebServiceViaCEP.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
