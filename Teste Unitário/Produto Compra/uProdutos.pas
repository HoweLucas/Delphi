unit uProdutos;

interface
uses vcl.Dialogs;

type
  TPedido  = class
private
   FQuantidade     : Double;
   FPrecoUnitario  : Double;
   FValorTotal     : double;
   FNomeProduto    : String;

//Procedures
  procedure getQtd(const Value: Double);
  procedure getPrecoUnitario(const Value: Double);
  procedure GetNome(const Value: String);

//Functions
  function setQtd: Double;
  function SetPrecoUnitario: Double;
  function SetNome: String;


public
  function Calculo : Double;
  property Quantidade    : Double  read setQtd           write getQtd;
  property PrecoUnitario : Double  read SetPrecoUnitario write getPrecoUnitario;
  property NomeProduto   : String  read SetNome          write GetNome;
end;
  implementation


{ TPedido }

uses sysutils;

function TPedido.Calculo: Double;
var
  xTotal : Double;
begin
  xTotal := Fquantidade * FPrecoUnitario;
  if Fquantidade < 11 then
  //ShowMessage('Não há Desconto, desconto só acima de 11 produtos');
    Result := xTotal;
  if (Fquantidade > 11) and (Fquantidade < 50) then
    Result := xTotal - (xTotal * 0.10) ;
  if Fquantidade > 50 then
    Result := xTotal - (xTotal * 0.75);

 end;

procedure TPedido.GetNome(const Value: String);
begin
  FNomeProduto := Value;
end;


procedure TPedido.getPrecoUnitario(const Value: Double);
begin
  FPrecoUnitario := value;
end;

procedure TPedido.getQtd(const Value: Double);
begin
  Fquantidade := value;
end;

function TPedido.SetNome: String;
begin
  Result := FNomeProduto;
end;

function TPedido.SetPrecoUnitario: Double;
begin
  Result := FPrecoUnitario;
end;

function TPedido.setQtd: Double;
begin
  result := FQuantidade;
end;

end.
