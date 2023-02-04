unit UConcreteDecorator_DataHora;

interface

Uses UDecorator;

type
  TDataHoraDecorator = Class(TDecorator)
    protected
      function ObterDadosExcecao: String; Override;

  End;

implementation

uses System.SysUtils;

{ TDataHoraDecorator }

function TDataHoraDecorator.ObterDadosExcecao: String;
begin
  Result := Inherited ObterDadosExcecao;
  Result := Result + 'Dat/Hora: ' +
    FormatDateTime('dd/mm/yyyy hh:mm:ss', Now);
end;
end.
