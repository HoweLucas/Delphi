unit UConcreteDecorator_Windows;

interface

Uses UDecorator;

Type
  TWindowsDecorator = Class(TDecorator)
    private
      function ObterVersaoWindow: String;
    public
      function ObterDadosExcecao: String; override;
  End;

implementation

Uses System.SysUtils, Windows, Registry;

{ TWindowsDecorator }

function TWindowsDecorator.ObterDadosExcecao: String;
begin
  Result := inherited ObterDadosExcecao;
  Result := Result + 'Versão do sistema Operacional: '
    + Self.ObterVersaoWindow;
end;

function TWindowsDecorator.ObterVersaoWindow: String;
var
  xRegistro: TRegistry;
  xMajorVersion: Byte;
  xMinorVersion: Byte;
begin
  //No Windows 10, a aplicação deve ser executada como administrador
  xRegistro := TRegistry.Create;
  try
    xRegistro.RootKey := HKEY_LOCAL_MACHINE;
    xRegistro.OpenKey('Software\Microsoft\Windows NT\CurrentVersion', False);
    xMajorVersion := xRegistro.ReadInteger('CurrentMajorVersionNumber');
    xMajorVersion := xRegistro.ReadInteger('CurrentMinorVersionNumber');

    case xMajorVersion of
      5: case xMinorVersion of
          1: Result := 'Windows XP';
        end;
      6: case xMinorVersion of
          0: Result := 'Windows Vista';
          1: Result := 'Windows 7';
          2: Result := 'Windows 8';
          3: Result := 'Windows 8.1';
        end;
     10: case xMinorVersion of
         0: Result := 'Windows 10';
        end;
    end;
  finally
     FreeAndNil(xRegistro);
  end;

end;

end.
