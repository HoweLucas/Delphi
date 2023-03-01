unit UService.Intf;

interface

type
  IService = Interface
    procedure CarregarToken;
    procedure Registrar;
    procedure Listar;
    procedure Excluir;

    function ObterRegistro(const aId: Integer): TObject;
  End;

implementation

end.
