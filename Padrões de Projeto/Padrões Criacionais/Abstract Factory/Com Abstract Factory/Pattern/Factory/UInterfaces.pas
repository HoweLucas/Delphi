unit UInterfaces;

interface

type
  INotebook = interface
    ['{785B14C8-4186-4AFD-8196-4EF2A271F8BA}']
    function BuscarTamanhoTela : String;
    function BuscarMemoriaRam  : String;
  end;

  Idesktop = Interface
    ['{F7E280E8-D06B-4580-99EA-715104C17EDE}']
    function BuscarNomeProcessador : String;
    function BuscarTamanhoHD: String;
  End;

  IFactoryMarca = Interface
    ['{2ECBEB8E-F25C-44D0-9BB6-7FAF872E2FD4}']
    function ConsultarNotebook : INotebook;
    function ConsultarDesktop  : IDesktop;
  End;
implementation

end.
