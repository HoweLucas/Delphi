unit UfrmPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TEnum = (UFuncionario1,UFuncionario2);
  TForm1 = class(TForm)
    Button1: TButton;
    ComboBox1: TComboBox;
    Label1: TLabel;
    Resultado: TLabel;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

uses
  UFuncionarios;

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
var
  xFuncionario1, xFuncionario2: TFUncionario;
begin
  case TEnum(ComboBox1.items) of
  UFuncionario1:
   Resultado.Caption := (xFuncionario1.Create('Lucas','Howe',1500)).ToString;

  end;

 end;
end.
