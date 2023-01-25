unit UInspiron;

interface

Uses
  Uinterfaces;

Type
  TInspiron = Class(TInterfacedObject, IDesktop)
    function BuscarNomeProcessador: String;
    function BuscarTamanhoHD:String;
  End;


implementation

{ TInspiron }

function TInspiron.BuscarNomeProcessador: String;
begin
  Result := 'Intel Core i5';
end;

function TInspiron.BuscarTamanhoHD: String;
begin
  Result := '1 TB';
end;

end.
