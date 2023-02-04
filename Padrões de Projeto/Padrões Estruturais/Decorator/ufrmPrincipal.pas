unit ufrmPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.AppEvnts,UInterfaceComponent,
  Vcl.StdCtrls;

type
  TForm1 = class(TForm)
    ApplicationEvents1: TApplicationEvents;
    btnExcecao: TButton;
    procedure ApplicationEvents1Exception(Sender: TObject; E: Exception);
    procedure btnExcecaoClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation


{$R *.dfm}

uses UConcreteComponent, UConcreteDecorator_DataHora,
  UConcreteDecorator_Usuario, UConcreteDecorator_Windows;


procedure TForm1.ApplicationEvents1Exception(Sender: TObject; E: Exception);
var
  xLogExcecao: ILogExcecao;
begin
  xLogExcecao := TLogExcecao.create(E);
  xLogExcecao := TDataHoraDecorator.Create(xLogExcecao);
  xLogExcecao := TUsuarioDecorator.Create(xLogExcecao);
  xLogExcecao := TWindowsDecorator.Create(xLogExcecao);

  ShowMessage(xLogExcecao.ObterDadosExcecao)
end;

procedure TForm1.btnExcecaoClick(Sender: TObject);
begin
  raise Exception.Create('Qualquer Exceção!');
end;

end.
