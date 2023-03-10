unit UPrazoAnual;

interface

Uses
 UTipoPrazo;

type
  TPrazoAnual = Class(TInterfacedObject, ITipoPrazo)
    private
      FValorTotal: Real;
    public
      function ConsultarDescricao: String;
      function ConsultarJuros: String;
      function ConsultarProjecao(const aValor: Real;
         const aQtdParcelas: Integer): String;
      function ConsultarTotal: String;
  End;

implementation

{ TPrazoAnual }

Uses
 System.SysUtils, System.Classes;

function TPrazoAnual.ConsultarDescricao: String;
begin
  Result := 'Prazo Anual para pagamento';
end;

function TPrazoAnual.ConsultarJuros: String;
begin
  Result := 'Juros de 10,5% simples ao ano' + sLineBreak;
end;

function TPrazoAnual.ConsultarProjecao(const aValor: Real;
  const aQtdParcelas: Integer): String;
var
  xProjecao: TStringlist;
  xContador: smallint;
  xValorAjustado: real;
  xDataParcela: TDateTime;
begin
  xValorAjustado := aValor;
  xDataParcela   := Date;
  xProjecao      := TStringList.Create;
  try
    for xContador := 1 to aQtdParcelas do
    begin
      xValorAjustado := xValorAjustado + (aValor * 0.105);
      xDataParcela   := IncMonth(xDataParcela, 12);

      xProjecao.Add(Format('Parcela %.2d (%s): &m',
         [xContador, DateToStr(xDataParcela), xValorAjustado]));

      FValorTotal := FValorTotal + xValorAjustado;
    end;

    Result := xProjecao.Text;
  finally
    FreeAndNil(xProjecao);
  end;
end;

function TPrazoAnual.ConsultarTotal: String;
begin
  Result := 'Total: ' + FormatFloat('###,##0.00', FValorTotal);
end;

end.
