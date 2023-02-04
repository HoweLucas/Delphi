unit UfrmPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, REST.Types, REST.Client,
  Data.Bind.Components, Data.Bind.ObjectScope, Vcl.StdCtrls;

type
  TForm1 = class(TForm)
    lblResultado: TLabel;
    btnPingPong: TButton;
    btnHelloWorld: TButton;
    RESTClient1: TRESTClient;
    RESTRequest1: TRESTRequest;
    RESTResponse1: TRESTResponse;
    procedure btnPingPongClick(Sender: TObject);
  private
    { Private declarations }
    procedure PingPong;
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.btnPingPongClick(Sender: TObject);
begin
  Self.PingPong;
end;

procedure TForm1.PingPong;
begin
  RESTCLIENT1.BaseURL := 'http://localhost:9090/ping';
  RESTRequest1.Execute;

  Self.TratarResposta;
end;

end.
