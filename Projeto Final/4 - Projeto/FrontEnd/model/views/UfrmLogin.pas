unit UfrmLogin;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FMX.Controls.Presentation, FMX.StdCtrls, FMX.Objects, FMX.Layouts;

type
  TfrmLogin = class(TForm)
    rectPrincipal: TRectangle;
    lytPrincipal: TLayout;
    imgLogo: TImage;
    lytBotoes: TLayout;
    RectLogin: TRectangle;
    Label1: TLabel;
    rectRegistrar: TRectangle;
    Label2: TLabel;
    RectSair: TRectangle;
    Label3: TLabel;
    procedure RectLoginClick(Sender: TObject);
    procedure rectRegistrarClick(Sender: TObject);
    procedure RectSairClick(Sender: TObject);
  private
    { Private declarations }
    procedure AbrirLoginAuthentication;
    procedure AbrirLoginRegistry;
  public
    { Public declarations }
  end;

var
  frmLogin: TfrmLogin;

implementation

{$R *.fmx}

Uses
  UfrmLogin.Authentication,
  UfrmLogin.Registry;

{ TfrmLogin }

procedure TfrmLogin.AbrirLoginAuthentication;
begin
  if not Assigned(frmLoginAuthentication) then
    frmLoginAuthentication := TfrmLoginAuthentication.Create(Application);

  frmLoginAuthentication.Show;
  Application.MainForm := frmLoginAuthentication;
  Self.Close;
end;

procedure TfrmLogin.AbrirLoginRegistry;
begin
  if not Assigned(frmLoginRegistry) then
    frmLoginRegistry := TFrmLoginRegistry.Create(Application);

  frmLoginRegistry.Show;
  Application.MainForm := frmLoginRegistry;
  Self.Close;
end;

procedure TfrmLogin.RectLoginClick(Sender: TObject);
begin
  Self.AbrirLoginAuthentication;
end;

procedure TfrmLogin.rectRegistrarClick(Sender: TObject);
begin
  Self.AbrirLoginRegistry;
end;

procedure TfrmLogin.RectSairClick(Sender: TObject);
begin
  Self.Close;
end;

end.
