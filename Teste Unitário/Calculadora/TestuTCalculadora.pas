unit TestuTCalculadora;
{

  Delphi DUnit Test Case
  ----------------------
  This unit contains a skeleton test case class generated by the Test Case Wizard.
  Modify the generated code to correctly setup and call the methods from the unit 
  being tested.

}

interface

uses
  TestFramework, TypInfo, uTCalculadora;

type
  // Test methods for class TCalculadora

  TestTCalculadora = class(TTestCase)
  strict private
    FCalculadora: TCalculadora;
  public
    procedure SetUp; override;
    procedure TearDown; override;
  published
    procedure TestSomar;
    procedure TestSubtrair;
    procedure TestMultiplicar;
    procedure TestDividir;
  end;

implementation

procedure TestTCalculadora.SetUp;
begin
  FCalculadora := TCalculadora.Create;
end;

procedure TestTCalculadora.TearDown;
begin
  FCalculadora.Free;
  FCalculadora := nil;
end;

procedure TestTCalculadora.TestSomar;
var
  ReturnValue: Double;
  aNum2: Double;
  aNum1: Double;
begin
  aNum1 := 1;
  aNum2 := 2;

  // TODO: Setup method call parameters
  ReturnValue := FCalculadora.Somar(aNum1, aNum2);
  // TODO: Validate method results
  CheckEquals(3, returnValue, 'Erro no m�todo Somar');
end;

procedure TestTCalculadora.TestSubtrair;
var
  ReturnValue: Double;
  aNum2: Double;
  aNum1: Double;
begin
  aNum1 := 2;
  aNum2 := 1;

  // TODO: Setup method call parameters
  ReturnValue := FCalculadora.Subtrair(aNum1, aNum2);
  // TODO: Validate method results
  CheckEquals(1, returnValue, 'Erro no m�todo Subtrair');
end;

procedure TestTCalculadora.TestMultiplicar;
var
  ReturnValue: Double;
  aNum2: Double;
  aNum1: Double;
begin
  aNum1 := 1;
  aNum2 := 2;

  // TODO: Setup method call parameters
  ReturnValue := FCalculadora.Multiplicar(aNum1, aNum2);
  // TODO: Validate method results
  CheckEquals(2, returnValue, 'Erro no m�todo Multiplicar');
end;

procedure TestTCalculadora.TestDividir;
var
  ReturnValue: Double;
  aNum2: Double;
  aNum1: Double;
begin
  aNum1 := 2;
  aNum2 := 2;

  // TODO: Setup method call parameters
  ReturnValue := FCalculadora.Dividir(aNum1, aNum2);
  // TODO: Validate method results
  CheckEquals(1, returnValue,'Erro no m�todo Dividir');
end;

initialization
  // Register any test cases with the test runner
  RegisterTest(TestTCalculadora.Suite);
end.

