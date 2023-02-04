unit UConcreteDecorator_Usuario;

interface

Uses UDecorator;

type
  TUsuarioDecorator = class(TDecorator)
    Private
      function ObterNomeUsuario: String;
    Public
      function ObterDadosExcecao: String; override;
  end;

implementation

uses Winapi.Windows;

{ TUsuarioDecorator }

function TUsuarioDecorator.ObterDadosExcecao: String;
begin
  Result := inherited ObterDadosExcecao;
  Result := Result + '�suario: ' + Self.ObterNomeUsuario;
end;

function TUsuarioDecorator.ObterNomeUsuario: String;
var
  xSize: Dword;
begin
  //Retorno o login do usu�rio do sistema operacional

  xSize := 1024;
  SetLength(Result,xSize);
  GetUserName(PChar(Result), xSize);
  SetLength(Result, xSize - 1);
end;

end.
