unit UDecorator;

interface

Uses UInterfaceComponent;

type
  TDecorator = class(TInterfacedObject, ILogExcecao)
    protected
     FLogExcecao: ILogExcecao;

     function ObterDadosExcecao: string; virtual;
    public
     constructor Create(aLogExcecao: IlogExcecao);
  end;

implementation

{ TDecorator }

constructor TDecorator.Create(aLogExcecao: IlogExcecao);
begin
  FLogExcecao := aLogExcecao;
end;

function TDecorator.ObterDadosExcecao: string;
begin
  Result := FLogExcecao.ObterDadosExcecao;
  Result := Result + #13#10;
end;

end.
