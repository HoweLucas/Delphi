unit UPaciente;

interface
uses Sysutils, System.Generics.Collections;

type
 TPaciente = Class


private
  FCPF           : String;
  FNome          : String;
  FEspecialidade : String;

//Function
  function GetCPF: String;
  function GetEspecialidade: String;
  function GetNome: String;

//Procedure
  procedure SetCPF(const Value: String);
  procedure SetEspecialidade(const Value: String);
  procedure SetNome(const Value: String);

public
//Constructor
  constructor create(const aCpf, aNome, aEspecialidade : String);
//Property
  Property NomePaciente : String read GetNome write SetNome;
  Property CPFPaciente  : String read GetCPF  write SetCPF;
  property EspecialidadePaciente : String read GetEspecialidade write SetEspecialidade;
End;

//Classe TQueue
  TFilaPessoa = class
   FPessoa: TQueue<TPaciente>;
private

published
  Constructor Create;
  destructor  destroy;
  procedure Adicionar(aPaciente:TPaciente);
  function Proximo: TPaciente;

  end;


implementation

{ TPaciente }

constructor TPaciente.create(const aCpf, aNome, aEspecialidade: String);
begin
  FCpf  := aCpf;
  FNome := aNome;
  FEspecialidade := aEspecialidade;
end;

function TPaciente.GetCPF: String;
begin
  Result := FCPF;
end;

function TPaciente.GetEspecialidade: String;
begin
  Result := FEspecialidade;
end;

function TPaciente.GetNome: String;
begin
  Result := FNome
end;

procedure TPaciente.SetCPF(const Value: String);
begin
  FCPF := Value;
end;

procedure TPaciente.SetEspecialidade(const Value: String);
begin
  FEspecialidade := value;
end;

procedure TPaciente.SetNome(const Value: String);
begin
  FNome := Value;
end;

{ TFilaPessoa }


procedure TFilaPessoa.Adicionar(aPaciente: TPaciente);
begin
  Fpessoa.Enqueue(aPaciente);
end;

constructor TFilaPessoa.Create;
begin
  Fpessoa := TQueue<TPaciente>.create;
end;

destructor TFilaPessoa.destroy;
begin
  FPessoa.Clear;
end;

function TFilaPessoa.Proximo: TPaciente;
begin
  Result := nil;

  if  Fpessoa.Count = 0 then


  Result := FPessoa.Peek;
end;

end.
