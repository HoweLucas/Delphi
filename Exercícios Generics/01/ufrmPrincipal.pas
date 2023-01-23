unit ufrmPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TKeyValue<T> = class
  private
    Fkey: String;
    FValue: T;

    procedure SetKey(const value: String);
    procedure SetValue(const Value: T);
    procedure GetKey(const Value: String);
    procedure Getvalue(const Value: T);
  published
    property Key: String read SetKey write GetKey;
    property Value: T read Setvalue write Getvalue;
  end;


  TForm1 = class(TForm)
    Button1: TButton;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

{ TKeyValue<T> }

procedure TKeyValue<T>.GetKey(const Value: String);
begin
  FKey := Value;
end;

procedure TKeyValue<T>.Getvalue(const Value: T);
begin
  FValue := Value;
end;

procedure TKeyValue<T>.SetKey(const value: String);
begin
  FKey := Value;
end;

procedure TKeyValue<T>.SetValue(const Value: T);
begin
  FValue := Value;
end;

procedure TForm1.Button1Click(Sender: TObject);
var
  xKV: TKeyValue<TForm>;
  xKV2: TKeyValue<TButton>;
begin
  xKV := TKeyValue<TForm>.create;
  xKV2 := TKeyValue<TButton>.create;

  try
    xKV.Key    := 'Form_1';
    xKV.Value  := self;

    xKV2.Key   := 'btn_1';
    xKV2.Value := sender as TButton;

    ShowMessage(xKv.Key + ' - ' + xKV.Value.Name);
    ShowMessage(xKV2.Key + ' - ' + xKV2.Value.Name);
  finally
    xKV.Free;
    xKV2.Free;
  end;
end;

end.
