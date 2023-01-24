unit UCalculatorService;

interface

uses
 UCalculadoraServiceDefault;

Type
  Toperacao =(opSomar, opSubtrair, opMultiplicar, opDividir);
  TCalculatorService = class(ICalculadoraService)
   FNum1: Double;
   FNum2: Double;
   FCalculator: ICalculadoraService;
  private
  public
    Constructor create(aNum1,aNum2:Double; aCalculator: ICalculadoraService);
    function Calculo(aCalc: Toperacao) : Double;
  end;

implementation

{ TCalculatorService }

Uses
 System.SysUtils, System.Classes,Vcl.Dialogs, System.Variants;


{ TCalculatorService }

function TCalculatorService.Calculo(aCalc: TOperacao): Double;

begin

  case aCalc of
  opsomar:
   Result := FCalculator.Somar(FNum1,FNum2);

  opSubtrair:
   Result := FCalculator.Subtrair(FNum1,FNum2);

  opMultiplicar:
   Result := FCalculator.Multiplicar(FNum1,Fnum2);

  opDividir:
   Result := FCalculator.Dividir(FNum1,Fnum2);

  end;
end;

constructor TCalculatorService.create(aNum1, aNum2: Double;
  aCalculator: ICalculadoraService);
begin
  FNum1 := aNum1;
  FNum2 := aNum2;
  FCalculator := aCalculator;
end;

{ TCalculatorService }


end.
