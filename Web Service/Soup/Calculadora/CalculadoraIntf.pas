{ Invokable interface ICalculadora }

unit CalculadoraIntf;

interface

uses Soap.InvokeRegistry, System.Types, Soap.XSBuiltIns;

type

  TEnumTest = (etNone, etAFew, etSome, etAlot);

  TDoubleArray = array of Double;

  TMyEmployee = class(TRemotable)
  private
    FLastName: UnicodeString;
    FFirstName: UnicodeString;
    FSalary: Double;
  published
    property LastName: UnicodeString read FLastName write FLastName;
    property FirstName: UnicodeString read FFirstName write FFirstName;
    property Salary: Double read FSalary write FSalary;
  end;

  { Invokable interfaces must derive from IInvokable }
  ICalculadora = interface(IInvokable)
  ['{F0AF5AE2-99B5-43C7-8A65-75A02D64E736}']

    { Methods of Invokable interface must not use the default }
    { calling convention; stdcall is recommended }
   function Somar(const anum1,anum2: Double): Double;
   function Subtracao(const aNum1, aNum2: Double): Double;
   function Multiplicacao(const aNum1, aNum2: Double): Double;
   function Dividir(const aNum1,aNum2: Double): Double;
  end;

implementation

initialization
  { Invokable interfaces must be registered }
  InvRegistry.RegisterInterface(TypeInfo(ICalculadora));

end.
