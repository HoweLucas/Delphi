unit ufrmPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TDias = (Segunda, Terca, Quarta, Quinta, Sexta, Sabado, Domingo);
  Tmes  = (Janeiro, Fevereiro, Marco, Abril, Maio, Junho, Julho);

  TEnumUtils<T> = Class
     class procedure EnumToList(aValue: TStrings);
  End;

  TForm1 = class(TForm)
    ComboBox1: TComboBox;
    btnDias: TButton;
    btnMes: TButton;
    procedure btnDiasClick(Sender: TObject);
    procedure btnMesClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

uses
  System.TypInfo;

{$R *.dfm}

{ TEnumUtils<T> }

class procedure TEnumUtils<T>.EnumToList(aValue: TStrings);
var
  I, xPos: Integer;
  xAux: String;
begin
  aValue.Clear;
  I := 0;
  repeat
    xAux := GetEnumName(TypeInfo(T), I);
    xPos := GetEnumValue(TypeInfo(T), xAux);

    if xPos <> -1 then
      aValue.Add(xAux);

    Inc(I);
  until xPos < 0 ;
end;

procedure TForm1.btnDiasClick(Sender: TObject);
begin
  TEnumUtils<TDias>.EnumToList(ComboBox1.Items);
end;

procedure TForm1.btnMesClick(Sender: TObject);
begin
  TEnumUtils<TMes>.EnumToList(ComboBox1.Items);
end;

end.
