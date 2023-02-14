unit UFuncionarios;

interface

type
  TFuncionario = class
  private
    FNome: String;
    FSobreNome: String;
    FSalarioMensal: Double;

    function GetNome: String;
    function GetSalarioMensal: Double;
    function GetSobreNome: String;

    procedure SetNome(const Value: String);
    procedure SetSalarioMensal(const Value: Double);
    procedure SetSobreNome(const Value: String);

  public

    Constructor Create(ANome, ASobrenome: String; ASalarioMensal: Double);

    Property Nome: String read GetNome write SetNome;
    Property SobreNome: String read GetSobreNome write SetSobreNome;
    property SalarioMensal: Double  read GetSalarioMensal write SetSalarioMensal;

end;


implementation

{ TFuncionario }

{ TFuncionario }

constructor TFuncionario.Create(ANome, ASobrenome: String;
  ASalarioMensal: Double);
begin
  FNome          := ANome;
  FSobreNome     := ASobreNome;
  FSalarioMensal := ASalarioMensal;
end;

function TFuncionario.GetNome: String;
begin
  Result := FNome
end;

function TFuncionario.GetSalarioMensal: Double;
begin
  Result := FSalarioMensal;
end;

function TFuncionario.GetSobreNome: String;
begin
  Result := FSobreNome;
end;

procedure TFuncionario.SetNome(const Value: String);
begin
  FNome := Nome;
end;

procedure TFuncionario.SetSalarioMensal(const Value: Double);
begin
  FSalarioMensal := SalarioMensal;
end;

procedure TFuncionario.SetSobreNome(const Value: String);
begin
  FSobreNome := SobreNome;
end;

end.



