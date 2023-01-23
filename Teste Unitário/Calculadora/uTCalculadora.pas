unit uTCalculadora;


interface
uses TypInfo;

type
   Toperacao =(opSomar, opSubtrair, opMultiplicar, opDividir);
   TCalculadora = class

private

public
   function Somar(aNum1, aNum2: Double): Double;
   function Subtrair(aNum1, aNum2: Double): Double;
   function Multiplicar(aNum1, aNum2: Double): Double;
   function Dividir(aNum1, aNum2: Double): Double;

 end;
implementation

{ TCalculadora }

function TCalculadora.Dividir(aNum1, aNum2: Double): Double;
begin
  Result := aNum1 / aNum2;
end;

function TCalculadora.Multiplicar(aNum1: Double; aNum2: Double): Double;
begin
  Result := aNum1 * aNum2;
end;

function TCalculadora.Somar(aNum1, aNum2: Double): Double;
begin
  Result := aNum1 + aNum2;
end;

function TCalculadora.Subtrair(aNum1, aNum2: Double): Double;
begin
  Result := aNum1 - aNum2;
end;


end.
