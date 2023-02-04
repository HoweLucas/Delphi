program Observer;

uses
  Vcl.Forms,
  ufrmPrincipal in 'ufrmPrincipal.pas' {Form1},
  UObserver in 'pattern\UObserver.pas',
  UNotificacao in 'pattern\UNotificacao.pas',
  Usubject in 'pattern\Usubject.pas',
  UConcreteObserver_Log in 'pattern\UConcreteObserver_Log.pas' {fraLog: TFrame},
  UConcreteObserver_Saldo in 'pattern\UConcreteObserver_Saldo.pas' {fraSaldo: TFrame},
  UConcreteObserver_Historico in 'pattern\UConcreteObserver_Historico.pas' {fraHistorico: TFrame},
  UConcreteSubject in 'pattern\UConcreteSubject.pas' {fraCadastro: TFrame};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
