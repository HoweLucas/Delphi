unit UCalculadora;

interface

uses UICalculadora, vcl.Dialogs, sysutils;

type
  TCalculadora = class(TInterfacedObject, ICalculadora)
  public
    function Somar (const Valor1, Valor2: Double): Double;
    function Subtrair(const Valor1, Valor2: Double): Double;
    function Multiplicar(const Valor1, Valor2: Double): Double;
    function Dividir (const Valor1, Valor2: Double): Double;
  end;

implementation

{ TCalculadora }

function TCalculadora.Dividir(const Valor1, Valor2: Double): Double;
begin
  if Valor1 = 0 then
    raise Exception.Create((FloatToStr(Valor2) + ' Não é possivel dividir por 0'))
  else if Valor2 = 0 then
    raise Exception.Create((FloatToStr(Valor1) + ' Não é possivel dividir por 0'));


  Dividir := Valor1 / Valor2
end;

function TCalculadora.Multiplicar(const Valor1, Valor2: Double): Double;
begin
  Multiplicar := Valor1 * Valor2
end;

function TCalculadora.Somar(const Valor1, Valor2: Double): Double;
begin
  Somar := Valor1 + Valor2
end;

function TCalculadora.Subtrair(const Valor1, Valor2: Double): Double;
begin
  Subtrair := Valor1 - Valor2;
end;

end.
