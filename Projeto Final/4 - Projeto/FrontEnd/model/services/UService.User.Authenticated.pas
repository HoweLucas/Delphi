unit UService.User.Authenticated;

interface

uses
  UEntity.Users;

type
  //Classe utilizando o padrão Singleton
  //Para armazemar o usuário logado
  TUserAuthenticated = class
    private
      FUser: TUser;
    function Getuser: TUser;
    procedure Setuser(const Value: TUser);

    public
      constructor Create;
      Destructor  Destroy; override;

      class function GetInstance: TuserAuthenticated;
      class function NewInstance: TObject; override;

      property User: TUser read Getuser write Setuser;
  end;

var
  GbInstance: TUserAuthenticated;

implementation

Uses
  System.SysUtils;

{ TUserAuthenticated }

constructor TUserAuthenticated.Create;
begin
  //Aqui não precisamos criar o FUser
  //Quem passará o mesmo criado será a tela de Login
end;

destructor TUserAuthenticated.Destroy;
begin
  FreeAndNil(FUser);
  inherited;
end;

class function TUserAuthenticated.GetInstance: TuserAuthenticated;
begin
  Result := TUserAuthenticated.Create;
end;

function TUserAuthenticated.Getuser: TUser;
begin
  Result := FUser;
end;

class function TUserAuthenticated.NewInstance: TObject;
begin
  if not Assigned(GbInstance) then
    GbInstance := TUserAuthenticated(inherited NewInstance);

  Result := GbInstance;
end;

procedure TUserAuthenticated.Setuser(const Value: TUser);
begin
  FUser := Value;
end;

initialization

finalization
  FreeAndNil(GbInstance);

end.
