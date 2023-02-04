unit UAdapter;

interface

uses
  UInterfaceViaCep, UAdaptee;

type
  TAdapter = class(TInterfacedObject, IWebServiceViaCep)
  private
    FWebServiceCorreios: TWebServiceCorreios;
  public
    constructor Create(aWebServiceCorreios: TwebServiceCorreios);
    procedure ConsultarEnderecoWebService(const aCep: String);
    function ObterLogradouro: String;
    function ObterBairro: String;
    function ObterCidade: String;
  end;

implementation

{ TAdapter }

procedure TAdapter.ConsultarEnderecoWebService(const aCep: String);
begin
  FWebServiceCorreios.DefinirParametrosConsultar(aCep);
  FWebServiceCorreios.ConsultarCEP;
end;

constructor TAdapter.Create(aWebServiceCorreios: TwebServiceCorreios);
begin
  FWebServiceCorreios := aWebServiceCorreios;
end;

function TAdapter.ObterBairro: String;
begin
  Result := FWebServiceCorreios.ObterResposta('Bairro');
end;

function TAdapter.ObterCidade: String;
begin
  Result := FWebServiceCorreios.ObterResposta('Cidade');
end;

function TAdapter.ObterLogradouro: String;
begin
  Result := FWebServiceCorreios.ObterResposta('Logradouro');
end;

end.
