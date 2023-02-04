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
  // M�todo respons�vel por extrair a lista de processos em execu��o

  xHandle := CreateToolhelp32snapshot(TH32cs_SNAPPROCESS, 0);
  xListaProcessos := TStringList.Create;
  try
    xProcessEntry.dwSize := SizeOf(TProcessEntry32);
    Process32Next(xHandle, xProcessEntry);

    //Percorre os processos que est�o em execu��o,
    //adicionando-os na vari�vel ListaProcessos
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
  // M�todos respons�veis pro extrair a lista de
  // programas intalados
  // OBS: a aplica��o deve ser executada como administrador]

  xRegistro := TRegistry.Create;
  xListaChaves := TStringList.Create;
  xListaProgramas := TStringList.Create;
  try
    // Obt�m a Lista de chaves existentes no caminho do registro
    // que armazena as informa��es de programas instalados
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
        //Adiciona o nome do programa na vari�vel ListaPrograma
        xListaProgramas.Add(xRegistro.ReadString('DisplayName'));

      xRegistro.CloseKey;
    end;

    // Grava a Lista de processos no arquivo "PRogamas.txt"
    xListaProgramas.SaveToFile(GetCurrentDir + '\Programas.txt');
  finally
    // Libera os objetos da mem�ria
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
  // M�todo Respons�vel por extrair a lista das vari�veis
  // de ambiente

  xListaVariaveis := TStringList.Create;
  try
    // obt�m a lista das vari�veis de ambiente
    xVariavel := GetEnvironmentStrings;
    while xVariavel^ <> #0 do
    begin
      xListaVariaveis.Add(StrPas(xVariavel));
      xListaVariaveis.Add(EmptyStr);
      inc(xVariavel, lStrLen(xVariavel) + 1);
    end;
    FreeEnvironmentStrings(xVariavel);

    // Grava a Lista de vari�veis no arquivo "Variaveis.txt"
    xListaVariaveis.SaveToFile(GetCurrentDir + '\Variaveis.txt');
  finally
    // Lobera o objeto da mem�ria
    FreeAndNil(xListaVariaveis);
  end;
end;

end.
