unit ufrmPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UConcreteSubject, UConcreteObserver_Log,
  UConcreteObserver_Historico, UConcreteObserver_Saldo;

type
  TForm1 = class(TForm)
    fraSaldo1: TfraSaldo;
    fraHistorico1: TfraHistorico;
    fraLog1: TfraLog;
    fraCadastro1: TfraCadastro;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.FormCreate(Sender: TObject);
begin
  fraCadastro1.AdicionarObserver(fraSaldo1);
  fraCadastro1.AdicionarObserver(fraHistorico1);
  fraCadastro1.AdicionarObserver(fraLog1);
end;

end.
