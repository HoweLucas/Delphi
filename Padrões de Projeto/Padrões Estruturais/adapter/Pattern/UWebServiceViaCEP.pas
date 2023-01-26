unit UWebServiceViaCEP;

interface

uses
  UInterfaceViaCEP, Xml.XMLIntf, Xml.XMLDoc;

type
  TWebServiceViaCEP = Class(TInterfacedObject, IWebServiceViaCEP)
    Private
      FXMLDocument: IXMLDocument;
    public
      constructor Create;
      destructor Destroy; Override;

      procedure ConsultarEnderecoWebService(const aCep: String);
      function ObterLoGradouro: String;
      function ObterBairro: String;
      Function ObterCidade: String;
  End;

implementation

{ TWebServiceViaCEP }

uses
  System.SysUtils, System.Variants;

procedure TWebServiceViaCEP.ConsultarEnderecoWebService(const aCep: String);
begin
  FXMLDocument.FileName := Format('https://viacep.com.br/ws/%s/xml/', [aCep]);
  FXMLDocument.Active   := True;
end;

constructor TWebServiceViaCEP.Create;
begin
  FXMLDocument := TXMLDocument.create(Nil);
end;

destructor TWebServiceViaCEP.Destroy;
begin
  FXMLDocument := nil;
  inherited;
end;

function TWebServiceViaCEP.ObterBairro: String;
begin
  Result := VarToStr(FXMLDocument.DocumentElement.ChildValues['bairro']);
end;

function TWebServiceViaCEP.ObterCidade: String;
begin
  Result := VarToStr(FXMLDocument.DocumentElement.ChildValues['localidade']);
end;

function TWebServiceViaCEP.ObterLoGradouro: String;
begin
  Result := VarToStr(FXMLDocument.DocumentElement.ChildValues['logradouro']);
end;

end.
