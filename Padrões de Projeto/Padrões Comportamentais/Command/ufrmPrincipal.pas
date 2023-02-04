unit ufrmPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TForm1 = class(TForm)
    Label1: TLabel;
    btnExecutar: TButton;
    memoProgramas: TMemo;
    Label2: TLabel;
    memoProcessos: TMemo;
    Label3: TLabel;
    memoVariaveis: TMemo;
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
  UReceiver, UInvoker, UConcreteCommand;

{$R *.dfm}

procedure TForm1.btnExecutarClick(Sender: TObject);
var
  xReceiver : TReceiver;
  xInvoker  : TInvoker;
begin
  // Cria o receiver (objeto que contém a codificação das operações)
  xReceiver := TReceiver.Create;

  // Cria o Invoker (objeto que armazena os comandos para executá-los)
  xInvoker := TInvoker.Create;
  try
    // Armazena o comando de extração de programas no Invoker
    xInvoker.Add(TProgramas.create(xReceiver));

    // Armazena o comando de extração de processos no Invoker
    xInvoker.Add(TProcessos.Create(xReceiver));

    // Armazena o comando de extração de variáveis de ambiente no Invoker
    xInvoker.Add(TVariaveisAmbiente.create(xReceiver));

    // Solicita ao Invoker que Execute todos os comandos armazenados
    xInvoker.ExtrairInformacoes;
  finally
    FreeAndNil(xInvoker);
    FreeAndNIl(xReceiver);
  end;

  MemoProgramas.Lines.LoadFromFile(GetCurrentDir + '\Programas.txt');
  MemoProcessos.Lines.LoadFromFile(GetCurrentDir + '\Processos.txt');
  memoVariaveis.Lines.LoadFromFile(GetCurrentDir + '\Variaveis.txt');
end;

end.
