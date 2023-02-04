unit UReceiver;

interface

type
 TReceiver = Class
   public
     procedure ExtrairProcessos;
     procedure ExtrairProgramas;
     procedure ExtrairVariaveisAmbiente;
 End;

implementation

{ TReceiver }

uses
  Dialogs, Messages, Windows, TlHelp32, psAPI,
  sysUtils, Registry, Classes;

procedure TReceiver.ExtrairProcessos;
var
  xHandle: THandle;
  xProcessEntry: TProcessEntry32;
  xListaProcessos: TStringList;
begin
  // Método responsável por extrair a lista de processos em execução

  xHandle := CreateToolhelp32snapshot(TH32cs_SNAPPROCESS, 0);
  xListaProcessos := TStringList.Create;
  try
    xProcessEntry.dwSize := SizeOf(TProcessEntry32);
    Process32Next(xHandle, xProcessEntry);

    //Percorre os processos que estão em execução,
    //adicionando-os na variável ListaProcessos
    repeat
      xListaProcessos.Add(xProcessEntry.szExeFile)
    until not process32Next(xHandle, xProcessEntry);

    // Grava a Lista de processos no arquivo "Processos.txt"
    xListaPRocessos.SaveToFile(GetCurrentDir + '\Processos.txt')
  finally
    CLoseHandle(xHandle);
    FreeAndNil(xListaPRocessos);
  end;
end;

procedure TReceiver.ExtrairProgramas;
const
 Chave_Registro =
  '\software\Microsoft\Windows\CurrentVersion\Unistall\';
var
  xRegistro: TRegistry;
  xContador: Integer;
  xListaChaves: TStringList;
  xListaProgramas: TStringList;
begin
  // Métodos responsáveis pro extrair a lista de
  // programas intalados
  // OBS: a aplicação deve ser executada como administrador]

  xRegistro := TRegistry.Create;
  xListaChaves := TStringList.Create;
  xListaProgramas := TStringList.Create;
  try
    // Obtém a Lista de chaves existentes no caminho do registro
    // que armazena as informações de programas instalados
    xRegistro.RootKey := HKEY_LOCAL_MACHINE;
    xRegistro.OpenKey(CHAVE_REGISTRO, False);
    xRegistro.GetKeyNames(xListaChaves);
    xRegistro.CloseKey;

    // Percorre a Lista de chaves para acessar o
    // Valor do atributo "DisplayName"
    for xContador := 0 to Pred(xListaChaves.Count) do
    begin
      xRegistro.RootKey := HKEY_LOCAL_MACHINE;
      xRegistro.OpenKey(CHAVE_REGISTRO
        + xListaChaves[xContador], False);

      if xRegistro.ReadString('DisplayName') <> EmptyStr then
        //Adiciona o nome do programa na variável ListaPrograma
        xListaProgramas.Add(xRegistro.ReadString('DisplayName'));

      xRegistro.CloseKey;
    end;

    // Grava a Lista de processos no arquivo "PRogamas.txt"
    xListaProgramas.SaveToFile(GetCurrentDir + '\Programas.txt');
  finally
    // Libera os objetos da memória
    FreeAndNil(xListaProgramas);
    FreeAndNil(xListaChaves);
    FreeAndNil(xRegistro);
  end;
end;

procedure TReceiver.ExtrairVariaveisAmbiente;
var
  xVariavel: Pchar;
  xListaVariaveis: TStringList;
begin
  // Método Responsável por extrair a lista das variáveis
  // de ambiente

  xListaVariaveis := TStringList.Create;
  try
    // obtém a lista das variáveis de ambiente
    xVariavel := GetEnvironmentStrings;
    while xVariavel^ <> #0 do
    begin
      xListaVariaveis.Add(StrPas(xVariavel));
      xListaVariaveis.Add(EmptyStr);
      inc(xVariavel, lStrLen(xVariavel) + 1);
    end;
    FreeEnvironmentStrings(xVariavel);

    // Grava a Lista de variáveis no arquivo "Variaveis.txt"
    xListaVariaveis.SaveToFile(GetCurrentDir + '\Variaveis.txt');
  finally
    // Lobera o objeto da memória
    FreeAndNil(xListaVariaveis);
  end;
end;

end.
