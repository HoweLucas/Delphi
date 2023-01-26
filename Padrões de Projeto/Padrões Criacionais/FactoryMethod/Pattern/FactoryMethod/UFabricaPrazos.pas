unit UFabricaPrazos;

interface

uses
 UTipoPrazo;

type
  TFabricaPrazos = Class(TInterfacedObject, IFactoryMethod)
    function ConsultarPrazo(const aPrazo: String): ITipoPrazo;

  End;

implementation

{ TFabricaPrazos }

uses
  UPrazoAnual, UPrazoMensal;


{ TFabricaPrazos }

function TFabricaPrazos.ConsultarPrazo(const aPrazo: String): ITipoPrazo;
begin
  if aPrazo = 'Mensal' then
    Result := TPrazoMensal.Create
  else if aPrazo = 'Anual' then
    Result := TPrazoAnual.Create;   
end;

end.
