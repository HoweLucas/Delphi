unit UImac;

interface

Uses
  UInterfaces;

Type
  TImac = Class(TInterfacedObject, Idesktop)
    function BuscarNomeProcessador : String;
    function BuscarTamanhoHD: String;
  End;

implementation

{ TImac }

function TImac.BuscarNomeProcessador: String;
begin
  Result := 'Intel Core i7';
end;

function TImac.BuscarTamanhoHD: String;
begin
  Result := '500 GB';
end;

end.
