program Decorator;

uses
  Vcl.Forms,
  ufrmPrincipal in 'ufrmPrincipal.pas' {Form1},
  UInterfaceComponent in 'Pattern\Decorator\UInterfaceComponent.pas',
  UDecorator in 'Pattern\Decorator\UDecorator.pas',
  UConcreteDecorator_Windows in 'Pattern\Decorator\UConcreteDecorator_Windows.pas',
  UConcreteDecorator_Usuario in 'Pattern\Decorator\UConcreteDecorator_Usuario.pas',
  UConcreteDecorator_DataHora in 'Pattern\Decorator\UConcreteDecorator_DataHora.pas',
  UConcreteComponent in 'Pattern\Decorator\UConcreteComponent.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
