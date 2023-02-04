unit Usubject;

interface

uses
  UObserver;

type
  Isubject = interface
     // M�todo para adicionar Observes � lista
     procedure AdicionarObserver(aObserver: IObserver);

     // M�todos para remover Obseerves da lista
     procedure RemoverObserver(aObserver: IObserver);

     // M�todo respons�vel por notificar os Observes
     // Registrados
     procedure Notificar;
  end;

implementation

end.

