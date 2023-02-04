unit UAdaptee;

interface

Uses UWebServiceCorreios, UWebServiceViaCEP, System.Classes, Soap.SOAPHTTPClient, System.SysUtils;

type
  TWEbServiceCorreios = class
    private
      FParametros: ConsultaCEP;
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
    aSOAPRequest.Size := Length(xRequest.Text);
    xRequest.SaveToStream(aSOAPRequest);
  finally
    FreeAndNil(xRequest);
  end;

end;

procedure TWEbServiceCorreios.ConsultarCEP;
var
  xCorreios: AtendeCliente;
  xHTTPRIO : THTTPRIO;
begin
  xHTTPRIO := THTTPRIO.Create(nil);
  xHTTPRIO.OnBeforeExecute := Self.BeforeExcute;

  xCorreios := GetAtendeCliente(True, '', xHTTPRIO);
  FResposta := xCorreios.consultaCEP(FParametros).return;
end;

procedure TWEbServiceCorreios.DefinirParametrosConsultar(const aCep: String);
begin
  FParametros := ConsultaCEP.create;
  FParametros.CEP :=aCEP;
end;

destructor TWEbServiceCorreios.Destroy;
begin
  FreeAndNil(Fparametros);
  FreeAndNil(FResposta);
  inherited;
end;

function TWEbServiceCorreios.ObterResposta(const aInformacao: String): String;
begin
  result := EmptyStr;

  if aInformacao = 'Logradouro' then
    Result := FResposta.end_
  else if aInformacao = 'Bairro' then
    Result := FResposta.bairro
  else if aInformacao = 'Cidade' then
    Result := FResposta.cidade;
end;

end.
