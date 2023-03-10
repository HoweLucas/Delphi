unit TestuProdutos;
{

  Delphi DUnit Test Case
  ----------------------
  This unit contains a skeleton test case class generated by the Test Case Wizard.
  Modify the generated code to correctly setup and call the methods from the unit 
  being tested.

}

interface

uses
  TestFramework, uProdutos, vcl.Dialogs;

type
  // Test methods for class TPedido

  TestTPedido = class(TTestCase)
  strict private
    FPedido: TPedido;
  public
    procedure SetUp; override;
    procedure TearDown; override;
  published
    procedure TestCalculo;
  end;

implementation

procedure TestTPedido.SetUp;
begin
  FPedido := TPedido.Create;
end;

procedure TestTPedido.TearDown;
begin
  FPedido.Free;
  FPedido := nil;
end;

procedure TestTPedido.TestCalculo;
var
  ReturnValue: Double;
begin
  FPedido.Quantidade    := 100;
  FPedido.PrecoUnitario := 1;
  ReturnValue := FPedido.Calculo;

  CheckEquals(25, returnValue, 'Erro no desconto');



  FPedido.Quantidade    := 10;
  ReturnValue := FPedido.Calculo;
  CheckEquals(10, returnValue, 'Erro no desconto');


  // TODO: Validate method results
end;

initialization
  // Register any test cases with the test runner
  RegisterTest(TestTPedido.Suite);
end.

