unit UfraBets.Registry;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants, 
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  FMX.Controls.Presentation, FMX.Edit, FMX.Objects, FMX.Layouts, FMX.ListBox,
  FMX.ListView.Types, FMX.ListView.Appearances, FMX.ListView.Adapters.Base,
  FMX.ListView,  UEntity.Matchs, UService.Intf;

type
  TfraBetRegistry = class(TFrame)
    rectPrincipal: TRectangle;
    lytPrincipal: TLayout;
    imgLogo: TImage;
    lytBotoes: TLayout;
    rectTimeB: TRectangle;
    edtResultTimeB: TEdit;
    rectTimeA: TRectangle;
    edtResultTeamA: TEdit;
    rectSalvar: TRectangle;
    Label2: TLabel;
    RectVoltar: TRectangle;
    Label3: TLabel;
    lblX: TLabel;
    lstPartidas: TListView;
    procedure rectSalvarClick(Sender: TObject);
    procedure RectVoltarClick(Sender: TObject);
  private
    { Private declarations }
    procedure VoltarTela;
    procedure CarregarMatchs;
    Procedure Registrar;
    procedure PreencherMatchs(const aMatchs: TMatch);
  public
    { Public declarations }
    constructor Create(aOwner: TComponent); override;
  end;

var
  fraBetRegistry: TFraBetRegistry;

implementation

{$R *.fmx}

Uses
   UfraBets,
   Uservice.Team,
   UService.Match,
   Uentity.Bets,
   Uservice.Bet,
   Uservice.user.Authenticated;

{ TfraBetRegistry }

procedure TfraBetRegistry.CarregarMatchs;
var
  xServiceMatch: Iservice;
  xMatch: Tmatch;
begin
  lstPartidas.Items.Clear;

  xServiceMatch := TServicematch.Create;
  xServiceMatch.Listar;
  for xMatch in TServiceMatch(xServicematch).Matchs do
     Self.PreencherMatchs(xMatch);

end;

constructor TfraBetRegistry.Create(aOwner: TComponent);
begin
  inherited Create(aOwner);
  Self.CarregarMatchs;
end;

procedure TfraBetRegistry.PreencherMatchs(const aMatchs: TMatch);
var
  xItem: TListViewItem;
const
  PARTIDA = '%s X %s - %s às %s';
begin
  xItem     := lstpartidas.Items.Add;
  xItem.Tag := aMatchs.id;

  TListItemText(xItem.Objects.FindDrawable('txtPartida')).Text :=
    Format(PARTIDA, [aMatchs.TeamA.name,
                     aMatchs.TeamB.Name,
                     DateToStr(amatchs.Date),
                     TimeToStr(aMatchs.Hour)]);

end;

procedure TfraBetRegistry.rectSalvarClick(Sender: TObject);
begin
  Self.Registrar;
end;

procedure TfraBetRegistry.RectVoltarClick(Sender: TObject);
begin
  Self.VoltarTela;
end;

procedure TfraBetRegistry.Registrar;
var
  xServiceBet: IService;
  xBet: TBet;
  xMatch: TMatch;
  xUserAuthenticated: TuserAuthenticated;
begin
  if lstPartidas.ItemIndex < 0 then
    raise Exception.Create('Selecione uma Partida.');

  if Trim(edtResultTeamA.Text) = EmptyStr then
    raise Exception.Create('Informe o placar do time A.');

  if Trim(edtResultTimeB.text) = EmptyStr then
    raise Exception.Create('Informe o Placar do Time B.');

  xMatch := TMatch.Create(lstPartidas.Items[lstPartidas.ItemIndex].Tag);
  xUserAuthenticated := TUserAuthenticated.GetInstance;

  xBet := TBet.Create(
    xMatch,
    StrTointDef(Trim(edtResultTeamA.text), 0),
    StrToIntDef(Trim(edtResultTimeB.text), 0),
    xUserAuthenticated.User);

  xServiceBet := TServiceBet.Create(xBet);
  xServiceBet.Registrar;
  Self.VoltarTela;
end;

procedure TfraBetRegistry.VoltarTela;
begin
  if not Assigned(FraBet) then
    fraBet := TFraBet.create(application);

  fraBet.Align := TAlignLayout.Center;

  self.Parent.AddObject(FraBet);
  FreeAndNil(FraBetRegistry);
end;

end.
