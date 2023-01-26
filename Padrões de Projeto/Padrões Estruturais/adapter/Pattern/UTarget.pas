unit UTarget;

interface

uses
  System.Classes, UInterfaceViaCEP;

Type
  TComunicador = class
  private
    FWebServiceViaCep: IWebServiceViaCEP;
  public
    constructor Create(aWebServiceViaCEP: IWebServiceViaCEP);
    destructor  Destroy; override;

    function ConsultarEndereco(const aCep: String): TStringList;
  end;

implementation



{ TComunicador }

function TComunicador.ConsultarEndereco(const aCep: String): TStringList;
var
  xDados: TStringList;
begin
  FWebServiceViaCEP.consultarEnderecoWebService(aCEP);

  xDados := TStringList.Create;
  xDados.Values['Logradouro'] := FWebServiceViaCEP.ObterLoGradouro;
  xDados.Values['Bairro']     := FWebServiceViaCEP.ObterBairro;
  xDados.Values['Cidade']     := FWebServiceViaCEP.obterCidade;

  Result := xDados;
end;

constructor TComunicador.Create(aWebServiceViaCEP: IWebServiceViaCEP);
begin
  FWebServiceViaCEP := aWebServiceViaCEp;
end;

destructor TComunicador.Destroy;
begin
  FWebServiceViaCEP := nil;
  inherited;
end;

end.
