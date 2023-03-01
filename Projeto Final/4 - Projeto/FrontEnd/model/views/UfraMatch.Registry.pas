unit UfraMatch.Registry;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants, 
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  FMX.ListView.Types, FMX.ListView.Appearances, FMX.ListView.Adapters.Base,
  FMX.ListView, FMX.Controls.Presentation, FMX.Edit, FMX.Objects, FMX.Layouts,
  FMX.ListBox, Uservice.Intf;

type
  TframatchRegistry = class(TFrame)
    RectPrincipal: TRectangle;
    lytPrincipal: TLayout;
    imgLogo: TImage;
    lytBotoes: TLayout;
    rectTimeB: TRectangle;
    rectTimeA: TRectangle;
    rectSalvar: TRectangle;
    Label2: TLabel;
    rectData: TRectangle;
    edtData: TEdit;
    rectHora: TRectangle;
    edtHora: TEdit;
    cmbTimeA: TComboBox;
    cmbTimeB: TComboBox;
    lblX: TLabel;
    RectVoltar: TRectangle;
    Label3: TLabel;
    procedure rectSalvarClick(Sender: TObject);
    procedure RectVoltarClick(Sender: TObject);
  private
    { Private declarations }
    FServiceTeam: Iservice;
    procedure VoltarTela;
    procedure CarregarTeams;
    procedure Registrar;
  public
    { Public declarations }
    constructor Create(aOwner: TComponent); override;
end;

var
  fraMatchRegistry: TFraMatchRegistry;

implementation

{$R *.fmx}

Uses
   UfraMatch,
   UService.Team,
   UService.Match,
   UEntity.Teams,
   UEntity.Matchs;

{ TframatchRegistry }

procedure TframatchRegistry.CarregarTeams;
var
  xTeam: TTeam;
begin
  cmbTimeA.Items.Clear;
  cmbTimeB.Items.Clear;

  if not Assigned(FServiceTeam) then
    FServiceTeam := TServiceTeam.Create;

  FServiceTeam.Listar;
  for xTeam in TServiceTeam(FServiceTeam).Teams do
  begin
    cmbTimeA.Items.AddObject(xTeam.Name, xTeam);
    cmbTimeB.Items.AddObject(xTeam.Name, xTeam);
  end;
end;

constructor TframatchRegistry.Create(aOwner: TComponent);
begin
  inherited Create(aOwner);
  Self.CarregarTeams;
end;

procedure TframatchRegistry.rectSalvarClick(Sender: TObject);
begin
  Self.Registrar;
end;

procedure TframatchRegistry.RectVoltarClick(Sender: TObject);
begin
  Self.VoltarTela;
end;

procedure TframatchRegistry.Registrar;
var
  xServiceMatch: IService;
  xHora: TTime;
  xData: TDate;
  xTimeAux: TTeam;
  xTimeA, xTimeB: TTeam;
begin
  if Trim(edtHora.Text) = EmptyStr then
    raise Exception.Create('Informe a Hora da Partida.');

  if Trim(edtData.Text) = EmptyStr then
    raise Exception.Create('Informe a Data da Partida.');

  if cmbTimeA.ItemIndex = -1 then
    raise Exception.Create('Informe o Time A da Partida.');

  if cmbTimeB.ItemIndex = -1 then
    raise Exception.Create('Informe o Time B da Partida.');

  if cmbTimeA.ItemIndex = cmbTimeB.ItemIndex then
    raise Exception.Create('Informe Times diferentes para a partida.');

  xHora := StrToTime(Trim(edtHora.Text));
  xData := StrToDate(Trim(edtData.Text));

  xTimeAux := TTeam(cmbTimeA.Items.Objects[cmbTimeA.ItemIndex]);
  xTimeA   := xTimeAux.Clone;

  xTimeAux := TTeam(cmbTimeB.Items.Objects[cmbTimeB.ItemIndex]);
  xTimeB   := xTimeAux.Clone;

  xServiceMatch := TServiceMatch.Create(
    TMatch.Create(xData, xHora, xTimeA, xTimeB));

  xServiceMatch.Registrar;
  Self.VoltarTela;
end;

procedure TframatchRegistry.VoltarTela;
begin
  if not Assigned(FraMatch) then
    FraMatch := TFraMatch.Create(Application);

  FraMatch.Align := TAlignLayout.Center;

  Self.Parent.AddObject(FraMatch);
  FreeAndNil(FraMatchRegistry);
end;

end.
