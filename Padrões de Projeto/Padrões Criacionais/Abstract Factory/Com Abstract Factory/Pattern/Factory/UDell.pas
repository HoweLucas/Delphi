unit UDell;

interface

uses
  UInterfaces;

type
  TDell = Class(TInterfacedobject, IFactoryMarca)
    Function ConsultarNotebook : INotebook;
    function ConsultarDesktop  : Idesktop;
  End;


implementation

 uses
  UVostro, UInspiron;

{ TDell }

function TDell.ConsultarDesktop: IDesktop;
begin
  Result := TInspiron.Create;
end;

function TDell.ConsultarNotebook: INotebook;
begin
  Result := TVostro.Create;
end;

end.
