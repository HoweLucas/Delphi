unit UApple;

interface

Uses UInterfaces;

type
  TApple = Class(TInterfacedObject, IFactoryMarca)
    function ConsultarNotebook : INoteBook;
    function ConsultarDesktop  : IDesktop;
  End;
implementation

{ TApple }

uses
UMacBook, UImac;

function TApple.ConsultarDesktop: IDesktop;
begin
  Result := TImac.Create;
end;

function TApple.ConsultarNotebook: INoteBook;
begin
  Result := TmacBook.Create;
end;

end.
