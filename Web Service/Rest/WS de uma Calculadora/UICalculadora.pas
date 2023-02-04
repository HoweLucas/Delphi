unit UICalculadora;

interface

type
  ICalculadora = interface
    ['{FBB45288-6EB9-49BA-9215-E9C53403765C}']
    function Somar (const Valor1, Valor2: Double): Double;
    function Subtrair(const Valor1, Valor2: Double): Double;
    function Multiplicar(const Valor1, Valor2: Double): Double;
    function Dividir (const Valor1, Valor2: Double): Double;
  end;

implementation

end.
