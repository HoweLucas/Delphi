unit UfrmPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TForm1 = class(TForm)
    Label1: TLabel;
    edtCEP: TEdit;
    btnConsultar: TButton;
    button1: TButton;
    lblLoGradouro: TLabel;
    lblBairro: TLabel;
    lblCidade: TLabel;
    procedure btnConsultarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

uses
  UTarget, UWebServiceViaCEP, UInterfaceViaCEP;

{$R *.dfm}

procedure TForm1.btnConsultarClick(Sender: TObject);
var
  xWebServiceViaCEP: IWebServiceViaCEP;
  xComunicador: TComunicador;
  xRetorno: TStringList;
begin
  //Instacia o objeto da classe de consulta
  xWebServiceViaCEP := TWebServiceViaCEP.create;

  //Instancia o comunicador (target), injetando o objeto de consulta
  xComunicador := TComunicador.Create(xWebServiceViaCEP);

  xRetorno := TStringList.Create;
  try
    //O Target consulta o endereço (utilizando o objeto onjetado) e retorna os dados
    xRetorno := xComunicador.ConsultarEndereco(edtCep.Text);

    lblLogradouro.Caption := xRetorno.Values['Logradouro'];
    lblBairro.Caption     := xRetorno.Values['Bairro'];
    lblCidade.Caption     := xRetorno.Values['Cidade'];
  finally
    FreeAndNil(xRetorno);
    FreeAndNil(xComunicador);
  end;
end;

end.
