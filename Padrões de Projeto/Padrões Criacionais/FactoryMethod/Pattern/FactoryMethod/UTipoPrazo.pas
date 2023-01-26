unit UTipoPrazo;

interface

type
  ITipoPrazo = interface
    ['{FD4093E8-7B1A-4CD6-AAF0-6B8BFAE74AAA}']
    function ConsultarDescricao: String;
    function ConsultarJuros: String;
    function ConsultarProjecao(const aValor: Real;
      const aQtdParcelas: Integer): String;
    function ConsultarTotal: String;
  end;

   IFactoryMethod = interface
     ['{589C2AA0-90EE-4C9F-865B-540BFFCB1EA3}']
     function ConsultarPrazo(const aPrazo: String): ITipoPrazo;
   end;
implementation

end.
