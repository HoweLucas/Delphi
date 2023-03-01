program DevsBets_FrontEnd;

uses
  System.StartUpCopy,
  FMX.Forms,
  UfrmHome in 'model\views\UfrmHome.pas' {frmHome},
  UfrmLogin.Authentication in 'model\views\UfrmLogin.Authentication.pas' {frmLoginAuthentication},
  UfrmLogin.Registry in 'model\views\UfrmLogin.Registry.pas' {frmLoginRegistry},
  UEntity.Bets in '..\backend\model\entities\UEntity.Bets.pas',
  UEntity.Logins in '..\backend\model\entities\UEntity.Logins.pas',
  UEntity.Matchs in '..\backend\model\entities\UEntity.Matchs.pas',
  UEntity.Teams in '..\backend\model\entities\UEntity.Teams.pas',
  UEntity.Users in '..\backend\model\entities\UEntity.Users.pas',
  UService.Intf in 'model\services\UService.Intf.pas',
  Uservice.Base in 'model\services\Uservice.Base.pas',
  UService.User in 'model\services\UService.User.pas',
  UUtils.constants in 'model\utils\UUtils.constants.pas',
  UService.Login in 'model\services\UService.Login.pas',
  UService.User.Authenticated in 'model\services\UService.User.Authenticated.pas',
  UfrmLogin in 'model\views\UfrmLogin.pas' {frmLogin},
  UUtils.Enums in 'model\utils\UUtils.Enums.pas',
  UService.Team in 'model\services\UService.Team.pas',
  UService.Match in 'model\services\UService.Match.pas',
  UUtils.Functions in 'model\utils\UUtils.Functions.pas',
  UService.Bet in 'model\services\UService.Bet.pas',
  UfraBets.Registry in 'model\views\UfraBets.Registry.pas' {fraBetRegistry: TFrame},
  UfraBets in 'model\views\UfraBets.pas' {FraBet: TFrame},
  UfraMatch.Registry in 'model\views\UfraMatch.Registry.pas' {framatchRegistry: TFrame},
  UfraMatch in 'model\views\UfraMatch.pas' {fraMatch: TFrame},
  UfraTeam in 'model\views\UfraTeam.pas' {fraTeams: TFrame},
  UfraTeams.Registry in 'model\views\UfraTeams.Registry.pas' {FraTeamRegistry: TFrame};

{$R *.res}

begin
  //Ao Fazer o Deploy para o cliente comentar essa linha
  ReportMemoryLeaksOnShutdown := True;

  Application.Initialize;
  Application.CreateForm(TfrmLogin, frmLogin);
  Application.Run;
end.
