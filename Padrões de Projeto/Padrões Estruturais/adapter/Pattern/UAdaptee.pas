unit UAdaptee;

interface

Uses UWebServiceViaCEP, System.Classes;

type
  TWEbServiceCorreios = class
    private
      FParametros: ConsultarCEP;
      FResposta: enderecoERP;

      procedure BeforeExcute(const aMethodName: String; aSOAPRequest: TStream);
    public
      destructor Destroy; override;
      procedure DefinirParametrosConsultar(const aCep: String);
      procedure ConsultarCEP;
      function ObterResposta(const aInformacao: String): String;
  end;

implementation

{ TWEbServiceCorreios }

uses Soap.SOAPHTTPClient, System.SysUtils;

procedure TWEbServiceCorreios.BeforeExcute(const aMethodName: String;
  aSOAPRequest: TStream);
var
 xRequest: TStringList;
begin
  xRequest := TStringList.Create;
  try
     xRequest.Text :=
      '<soapenv:Envelope xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/" xmlns:cli="http://cliente.bean.master.sigep.bsb.correios.com.br/">' +
      '  <soapenv:Header/>' +
      '    <soapenv:Body>' +
      '      <cli:consultaCEP>' +
      '        <cep>' + FParametros.cep + '</cep>' +
      '      </cli:consultaCEP>' +
      '    </soapenv:Body>' +
      '</soapenv:Envelope>';

    aSOAPRequest.Position := 0;
    aSOAPRequest.Size := Lenght(xRequest.Text);
    xRequest.SaveToStream(aSOAPRequest);
  finally
    FreeAndNil(xRequest);
  end;

end;

procedure TWEbServiceCorreios.ConsultarCEP;
begin

end;

procedure TWEbServiceCorreios.DefinirParametrosConsultar(const aCep: String);
begin

end;

destructor TWEbServiceCorreios.Destroy;
begin

  inherited;
end;

function TWEbServiceCorreios.ObterResposta(const aInformacao: String): String;
begin

end;

end.
