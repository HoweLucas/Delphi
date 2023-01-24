unit UCalculadoraService;

interface

type
 ICalculadoraService = interface(TInterfacedObject, ICalculadoraServiceDefault)
   private
   public
   function Somar(Const aNum1, aNum2: Double): Double;
   function Subtrair(aNum1,aNum2: Double): Double;
     function Multiplicar(aNum1, aNum2: Double): Double;
     function Dividir(aNum1, aNum2 : Double): Double;
  end;

implementation

{ TCaluladoraService }


end.
