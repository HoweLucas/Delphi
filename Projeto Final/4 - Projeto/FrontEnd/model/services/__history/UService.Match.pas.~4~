unit UService.Match;

interface

Uses
UService.Base,
  Generics.Collections,
  UEntity.Matchs;


type
  TServiceMatch = class(TServiceBase)
    private
      Fmatch: TMatch;
      FMatchs: TObjectList<TMatch>;
      function GetMatchs: TObjectList<TMatch>;

      procedure PreencherMatchs(const ajsonMatchs: String);
    Public
      constructor Create; Overload;
      constructor Create(aMatch: TMatch); overload;
      destructor Destroy; override;

      procedure Registrar; override;
      procedure Listar; override;
      procedure excluir; override;

      function ObterRegistro(const aid: Integer): Tobject; override;

      property Matchs: TObjectList<TMatch> read GetMatchs;
end;
implementation

uses
  System.SysUtils, REST.Types,
  UUtils.Constants, DataSet.Serialize,
  FireDAC.comp.Client,
  UService.Intf, UService.Team,
  UEntity.Teams,
  UUtils.Functions;

{ TServiceMatch }

constructor TServiceMatch.Create;
begin
  inherited Create;

  FMatchs := TObjectList<TMatch>.create;
end;

constructor TServiceMatch.Create(aMatch: TMatch);
begin
  FMatch := amatch;

  Self.Create;
end;

destructor TServiceMatch.Destroy;
begin
  FreeAndNil(Fmatch);
  FreeAndNil(Fmatchs);
  inherited;
end;

procedure TServiceMatch.excluir;
begin
  if (not Assigned(FMatch)) or (FMatch.Id = 0) then
    raise Exception.Create('Nenhuma Partida foi escolhida para exclusão.');
  try
    FRESTClient.BaseURL := Format(URL_BASE_MATCH + '/%d', [FMatch.Id]);
    FRESTRequest.Method := rmDelete;
    FRESTRequest.Execute;

    case FRESTResponse.StatusCode of
      API_SUCESSO_SEM_RETORNO:
        Exit;
      API_NAO_AUTORIZADO:
        raise Exception.Create('Usuário não autorizado.');
      else
        raise Exception.Create('Erro não catalogado.');
    end;
  except
    on e: exception do
      raise Exception.Create(e.Message);
  end;
end;

function TServiceMatch.GetMatchs: TObjectList<TMatch>;
begin
  Result := Fmatchs;
end;

procedure TServiceMatch.Listar;
begin
  try
    FRESTClient.BaseURL := URL_BASE_MATCH;
    FRESTRequest.Method := rmGet;
    FRESTRequest.Execute;

    case FRESTResponse.StatusCode of
      API_SUCESSO:
        Self.PreencherMatchs(FRESTResponse.Content);
      API_NAO_AUTORIZADO:
        raise Exception.Create('Usuário não autorizado.');
      else
        raise Exception.Create('Erro ao carregar a lista de Times. Código do Erro: ' + FRESTResponse.StatusCode.ToString);
    end;
  except
    on e: exception do
      raise Exception.Create(e.Message);
  end;
end;

function TServiceMatch.ObterRegistro(const aid: Integer): Tobject;
begin
  Result := nil;
  //Método sem implementação no momento
end;

procedure TServiceMatch.PreencherMatchs(const ajsonMatchs: String);
var
  xMemTable: TFDMemTable;
  xMemTableTeam: TFDMemTable;
  xTeamA, xTeamB: TTeam;
  xStatus: Byte;
begin
  FMatchs.Clear;

  xMemTable     := TFDMemTable.Create(nil);
  xMemTableTeam := TFDMemTable.Create(nil);

  try
    xMemTable.LoadFromJSON(FRESTResponse.Content);

    while not xMemTable.Eof do
    begin
      xMemTableTeam.LoadFromJSON(xMemTable.FieldByName('team_A').AsString);
      xTeamA := TTeam.Create(xMemTableTeam.FieldByName('name').AsString);

      xMemTableTeam.LoadFromJSON(xMemTable.FieldByName('team_B').AsString);
      xTeamB := TTeam.Create(xMemTableTeam.FieldByName('name').AsString);

      xStatus := TUtilsFunctions.IIF<Byte>(
        xMemTable.FieldByName('status').AsString = 'true',
        1, 0);

      FMatchs.Add(TMatch.Create(xMemTable.FieldByName('id').AsInteger,
                                xMemTable.FieldByName('date').AsDateTime,
                                xMemTable.FieldByName('hour').AsDateTime,
                                xTeamA,
                                xTeamB,
                                xMemTable.FieldByName('result_Team_A').AsInteger,
                                xMemTable.FieldByName('result_Team_B').AsInteger,
                                xStatus));

      xMemTable.Next;
    end;
  finally
    FreeAndNil(xMemTable);
    FreeAndNil(xMemTableTeam);
  end;
end;

procedure TServiceMatch.Registrar;
begin
  try
    FRESTClient.BaseURL := URL_BASE_MATCH;
    FRESTRequest.Params.AddBody(FMatch.JSON);
    FRESTRequest.Method := rmPost;
    FRESTRequest.Execute;

    case FRESTResponse.StatusCode of
      API_CRIADO:
        Exit;
      API_NAO_AUTORIZADO:
        raise Exception.Create('Usuário não autorizado.');
      else
        raise Exception.Create('Erro não catalogado.');
    end;
  except
    on e: exception do
      raise Exception.Create(e.Message);
  end;
end;

end.
