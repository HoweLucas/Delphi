unit UUSATaxService;

interface

uses
  UTaxService;

type
 TUSATaxService = class(TInterfacedObject, ITaxService)
   private
   public
     Function Tax(const aAmount: Double): Double;
end;

implementation

{ TUSATaxService }

function TUSATaxService.Tax(const aAmount: Double): Double;
begin
  if (AAmount <= 100) then
    Result := aAmount * 0.3
  else
    Result := aAmount * 0.20;
end;

end.
