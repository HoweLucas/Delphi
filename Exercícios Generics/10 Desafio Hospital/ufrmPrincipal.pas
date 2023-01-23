unit ufrmPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, System.Generics.Collections,UPaciente;

type
  TForm1 = class(TForm)
    Label1: TLabel;
    edtNome: TEdit;
    Label2: TLabel;
    edtCPF: TEdit;
    Label3: TLabel;
    edtEspecialidade: TEdit;
    btnAdicionar: TButton;
    Memo1: TMemo;
    Memo2: TMemo;
    btnProximo: TButton;
    btnFechar: TButton;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  FPessoa: TFilaPessoa;
  procedure Adicionar;
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.Adicionar;
var
  xPaciente: TPaciente;
begin
  xPaciente := TPaciente.create(edtCPF.Text,
                                edtNome.Text,
                                edtEspecialidade.Text);
  Fpessoa.Adicionar(xPaciente);
end;

procedure TForm1.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Freeandnil(FPessoa);
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  FPessoa := TFilaPessoa.Create;
end;

end.

