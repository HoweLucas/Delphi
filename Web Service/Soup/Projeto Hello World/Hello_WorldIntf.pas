{ Invokable interface IHello_World }

unit Hello_WorldIntf;

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
  IHello_World = interface(IInvokable)
  ['{74B088BD-F068-442C-B7DD-817FC00A42FE}']

    { Methods of Invokable interface must not use the default }
    { calling convention; stdcall is recommended }
    function echoEnum(const Value: TEnumTest): TEnumTest; stdcall;
    function echoDoubleArray(const Value: TDoubleArray): TDoubleArray; stdcall;
    function echoMyEmployee(const Value: TMyEmployee): TMyEmployee; stdcall;
    function echoDouble(const Value: Double): Double; stdcall;
    function echoHelloWorld: String; stdcall;
  end;

implementation

initialization
  { Invokable interfaces must be registered }
  InvRegistry.RegisterInterface(TypeInfo(IHello_World));

end.
