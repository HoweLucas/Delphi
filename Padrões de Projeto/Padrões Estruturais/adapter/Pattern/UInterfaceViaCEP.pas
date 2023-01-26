unit UInterfaceViaCEP;

interface

type
  IWebServiceViaCEP = interface
    ['{EF5165B6-6D50-4C8B-82A3-FCC11BFBDF18}']
    procedure ConsultarEnderecoWebService(const aCep: String);
    function ObterLogradouro: String;
    function ObterBairro: String;
    function ObterCidade: String;
  end;

implementation

end.
