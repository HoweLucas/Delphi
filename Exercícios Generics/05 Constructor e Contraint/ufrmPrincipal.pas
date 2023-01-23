unit ufrmPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TPessoa = class
    private
      FNome: String;
      procedure SetNome(const Value: String);
    published
      property Nome: String read FNome write SetNome;
  end;

  //Constructor padrão
  //TNFe<T : class, Constructor> = class
  TNFe<T : constructor> = class
    FGeneric : T;
    constructor Create;
    function GetGenerics: T;
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

{ TNFe<T> }

constructor TNFe<T>.Create;
begin
  FGeneric := T.Create;
end;

function TNFe<T>.GetGenerics: T;
begin
  result := FGeneric;
end;

{ TPessoa }

procedure TPessoa.SetNome(const Value: String);
begin
  FNome := value;
end;

procedure TForm1.Button1Click(Sender: TObject);
var
  xNFe: TNFe<TPessoa>;
begin
  xNFe := TNFe<TPessoa>.create;

  try
    xNFe.FGeneric.Nome := 'Lucas Howe';
    ShowMessage(xNFe.FGeneric.Nome);
  finally
    FreeAndNil(XNFe);
  end;
end;

end.
