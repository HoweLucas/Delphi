unit Usubject;

interface

uses
  UObserver;

type
  Isubject = interface
     // Método para adicionar Observes à lista
     procedure AdicionarObserver(aObserver: IObserver);

     // Métodos para remover Obseerves da lista
     procedure RemoverObserver(aObserver: IObserver);

     // Método responsável por notificar os Observes
     // Registrados
     procedure Notificar;
  end;

implementation

end.

