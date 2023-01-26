unit UMacBook;

interface

Uses UInterfaces;

Type
  TMacBook = Class(TInterfacedObject, INoteBook)
    function BuscarTamanhoTela: String;
    function BuscarMemoriaRam: String;
  End;

implementation

{ TMacBook }

function TMacBook.BuscarMemoriaRam: String;
begin
  Result := '4Gb DDR3';
end;

function TMacBook.BuscarTamanhoTela: String;
begin
  Result := '11.6 polegadas';
end;

end.
