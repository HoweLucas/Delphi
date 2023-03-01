unit UfraTeam;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants, 
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  FMX.Layouts, FMX.Objects, FMX.ListView.Types, FMX.ListView.Appearances,
  FMX.ListView.Adapters.Base, FMX.Controls.Presentation, FMX.ListView,
  UEntity.Teams;

type
  TfraTeams = class(TFrame)
    rectPrincipal: TRectangle;
    lytPrincipal: TLayout;
    imgLogo: TImage;
    lytPartida: TLayout;
    lstTimes: TListView;
    RectToolBar: TRectangle;
    rectExcluir: TRectangle;
    Label1: TLabel;
    rectNovo: TRectangle;
    Label2: TLabel;
    procedure rectExcluirClick(Sender: TObject);
    procedure rectNovoClick(Sender: TObject);
  private
    { Private declarations }
    procedure AbrirTeamRegistry;
    procedure CarregarRegistros;
    procedure ExcluirRegistro;
    procedure PreencherTeams(aTeams: TTeam);
  public
    { Public declarations }
    constructor Create(aOwner: TComponent); override;
end;

var
  fraTeam: TfraTeams;

implementation

{$R *.fmx}

Uses
   UfraTeams.Registry,
   Uservice.Intf,
   Uservice.Team;

{ TfraTeams }

procedure TfraTeams.AbrirTeamRegistry;
begin
  if not Assigned(FraTeamRegistry) then
    FraTeamRegistry := TFraTeamRegistry.Create(Application);

  FraTeamRegistry.Align := TAlignLayout.Center;

  Self.Parent.AddObject(FraTeamRegistry);
  FreeAndNil(FraTeam);
end;

procedure TfraTeams.CarregarRegistros;
var
  xServiceTeam: Iservice;
  xTeam: TTeam;
begin
  lstTimes.Items.Clear;

  xServiceTeam := TServiceTeam.Create;
  xServiceTEam.Listar;

  for xTeam in TServiceTeam(xServiceTeam).Teams do
     Self.PreencherTeams(xTeam);
end;

constructor TfraTeams.Create(aOwner: TComponent);
begin
  inherited Create(aOwner);
  Self.CarregarRegistros;
end;

procedure TfraTeams.ExcluirRegistro;
var
  xServiceTeam: Iservice;
  xTeam: TTeam;
  xItem: TListViewItem;
begin
  if lstTimes.ItemIndex = -1 then
    Exit;

  xItem := lstTimes.Items[lstTimes.ItemIndex];
  xTeam := TTeam.Create(xItem.Tag);

  xServiceTeam := TServiceTeam.Create(xTeam);
  try
    xServiceTeam.Excluir;
    ShowMessage('Registro excluido.');
  finally
    self.CarregarRegistros;
  end;

end;

procedure TfraTeams.PreencherTeams(aTeams: TTeam);
var
  xItem: TListViewItem;
begin
  xItem     := lstTimes.Items.Add;
  xItem.Tag := aTeams.Id;

  TListItemText(xItem.Objects.FindDrawable('txtTime')).Text := aTeams.Name;
end;

procedure TfraTeams.rectExcluirClick(Sender: TObject);
begin
  self.ExcluirRegistro;
end;

procedure TfraTeams.rectNovoClick(Sender: TObject);
begin
  Self.AbrirTeamRegistry;
end;

end.
