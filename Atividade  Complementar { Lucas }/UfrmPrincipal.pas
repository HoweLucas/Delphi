unit UfrmPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TEnum = (UFuncionario1,UFuncionario2);
  TForm1 = class(TForm)
    btnExecutar: TButton;
    cmbFuncionario: TComboBox;
    Label1: TLabel;
    mmResultado: TMemo;
    procedure btnExecutarClick(Sender: TObject);
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

procedure TForm1.btnExecutarClick(Sender: TObject);
var
  xFuncionario1, xFuncionario2: TFUncionario;
begin
  xFuncionario1 := TFuncionario.Create('Lucas',' Howe ',1500);
  xFuncionario2 := TFuncionario.Create('Jo�o', ' da Silca', 2000);

  Try
    case TEnum(cmbFuncionario.items) of
    UFuncionario1:
      mmResultado.Lines.Add(xFuncionario1.Nome + xFuncionario1.SobreNome + FloatToStr(xFuncionario1.SalarioMensal));

    UFuncionario2:
      mmResultado.Lines.Add(xFuncionario2.Nome + xFuncionario2.SobreNome + FloatToStr(xFuncionario2.SalarioMensal));
   end;

  Finally
    FreeAndNil(xFuncionario1);
    FreeAndNil(xFuncionario2);
  End;
  end;
end.
