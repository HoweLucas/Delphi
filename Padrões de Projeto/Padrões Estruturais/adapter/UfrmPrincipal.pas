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
    procedure button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

uses
  UTarget, UWebServiceViaCEP, UInterfaceViaCEP, UAdaptee, UAdapter;

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

procedure TForm1.button1Click(Sender: TObject);
var
xWebServiceCorreios: TWebServiceCorreios;
xAdapter: IWebServiceViaCep;
xComunicador: TComunicador;
xRetorno: TStringList;
begin
  //Instancia o objeto de consulta dos correios (adaptee)
  xWebServiceCorreios := TWebServiceCorreios.Create;

  //Instacia o adaptador (adapter)
  xAdapter := Tadapter.Create(xWebServiceCorreios);

  //instancia o comunicador (Target), injetando o adaptador
  xComunicador := TComunicador.Create(xAdapter);

  xRetorno := TStringList.Create;
  try
    //O Target consulta o endereço (utilizando o objeto injetado) e retorna os dados
    xRetorno := xComunicador.ConsultarEndereco(edtCEP.Text);

    lblLogradouro.Caption := xRetorno.Values['Logradouro'];
    lblBairro.Caption     := xRetorno.Values['Bairro'];
    lblCidade.Caption     := xRetorno.Values['Cidade'];
  finally
    FreeAndNil(xRetorno);
    FreeAndNIl(xComunicador);
    FreeAndNil(xWebServiceCorreios);
  end;

end;

end.
