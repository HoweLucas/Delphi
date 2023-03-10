unit UService.Team;

interface

Uses
  Uentity.Teams,
  UService.Base,
  Generics.Collections;

type
  TServiceTeam = class(TServiceBase)
    private
      FTeam: TTeam;
      FTeams: TObjectList<TTeam>;
      function GetTeams: TObjectList<TTeam>;

    Public
      constructor Create; Overload;
      constructor Create(aTeam: TTeam); overload;
      destructor Destroy; override;

      procedure Registrar; override;
      procedure Listar; override;
      procedure excluir; override;

      function ObterRegistro(const aid: Integer): Tobject; override;

      property Teams: TObjectList<TTeam> read GetTeams;
end;

implementation

uses
  System.SysUtils,
  System.JSON, UUtils.constants,
  DataSet.Serialize,
  FireDAC.Comp.Client,
  REST.Types;

{ TServiceTeam }

constructor TServiceTeam.Create;
begin
  inherited Create;

  FTeams := TObjectList<TTeam>.create;
end;

constructor TServiceTeam.Create(aTeam: TTeam);
begin
  FTeam := aTeam;

  Self.Create;
end;

destructor TServiceTeam.Destroy;
begin
  FreeAndNil(FTeam);
  FreeAndNil(FTeams);
  inherited;
end;

procedure TServiceTeam.excluir;
begin
  if (not Assigned(FTeam)) or (FTeam.Id = 0) then
    raise Exception.Create('Nenhum time foi escolhido para exclus?o.');
  try
    FRESTClient.BaseURL := Format(URL_BASE_TEAM + '/%d', [FTeam.Id]);
    FRESTRequest.Method := rmDelete;
    FRESTRequest.Execute;

    case FRESTResponse.StatusCode of
      API_SUCESSO_SEM_RETORNO:
        Exit;
      API_NAO_AUTORIZADO:
        raise Exception.Create('Usu?rio n?o autorizado.');
      else
        raise Exception.Create('Erro n?o catalogado.');
    end;
  Except
    on e:exception do
      raise Exception.Create(e.Message);
  end;
end;

function TServiceTeam.GetTeams: TObjectList<TTeam>;
begin
  Result := FTeams;
end;

procedure TServiceTeam.Listar;
var
  xMemTable: TFDMemTable;
begin
  FTeams.Clear;

  xMemTable := TFDMemTable.Create(nil);

  try
    try
      FRESTClient.BaseURL := URL_BASE_TEAM;
      FRESTRequest.Method := rmGet;
      FRESTRequest.Execute;

      case FRESTResponse.StatusCode of
        API_SUCESSO:
        begin
          xMemTable.LoadFromJSON(FRESTResponse.Content);

          while not xMemTable.Eof do
          begin
            FTeams.Add(TTeam.Create(xMemTable.FieldByName('id').AsInteger,
                                    xMemTable.FieldByName('name').AsString));

            xMemTable.Next;
          end;
        end;
        API_NAO_AUTORIZADO:
          raise Exception.Create('Usu?rio n?o autorizado.');
        else
          raise Exception.Create('Erro ao carregar a lista de Times.'
                                 + 'C?digo do Erro:'
                                 + FRESTResponse.StatusCode.ToString);

      end;
    except
      on e:exception do
        raise Exception.Create(e.Message);
    end;
  finally
    FreeAndNil(xMemtable);
  end;

end;

function TServiceTeam.ObterRegistro(const aid: Integer): Tobject;
var
  xMemTable: TFDMemTable;
begin
  Result := nil;

  xMemTable := TFDMemTable.Create(nil);

  try
    FRESTClient.BaseURL := URL_BASE_TEAM + '/' + aId.ToString;
    FRESTRequest.Method := rmGet;
    FRESTRequest.Execute;

    if FRESTResponse.StatusCode = API_SUCESSO then
    begin
      xMemTable.LoadFromJSON(FRESTResponse.Content);

      if xMemTable.FindFirst then
        Result := TTeam.Create(xMemTable.FieldByName('id').AsInteger);
    end;
  finally
    FreeAndNil(xMemTable);
  end;

end;

procedure TServiceTeam.Registrar;
begin
 try
   FRESTClient.BaseURL := URL_BASE_TEAM;
   FRESTRequest.Method := rmPost;
   FRESTRequest.Params.AddBody(FTEAM.JSON);
   FRESTRequest.Execute;

   case FRESTResponse.StatusCode of
     API_CRIADO:
       Exit;
     API_NAO_AUTORIZADO:
       raise Exception.Create('Usu?rio n?o autorizado. ');
     else
       raise Exception.Create('Error n?o catalogado. ');
   end;
 except
   on e: exception do
   raise Exception.Create(e.Message);

 end;
end;

end.
