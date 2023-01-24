unit UCalculadoraService;

interface

type
  ICalculadoraServiceDefault = Interface
   ['{682D0C03-3339-4E6C-A1DD-3CB3980EBADC}']

   function Somar(Const aNum1, aNum2: Double): Double;
   function Subtrair(const aNum1, aNum2: Double): Double;
   function Multiplicar(const aNum1, aNum2: Double): Double;
   function Dividir(const aNum1, aNum2: Double): Double;
  End;


implementation

end.
