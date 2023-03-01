unit UfraTeams.Registry;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants, 
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  FMX.Edit, FMX.Controls.Presentation, FMX.ListBox, FMX.Objects, FMX.Layouts;

type
  TFraTeamRegistry = class(TFrame)
    RectPrincipal: TRectangle;
    lytPrincipal: TLayout;
    imgLogo: TImage;
    lytBotoes: TLayout;
    rectNome: TRectangle;
    rectSalvar: TRectangle;
    Label2: TLabel;
    RectVoltar: TRectangle;
    Label3: TLabel;
    edtNome: TEdit;
    procedure rectSalvarClick(Sender: TObject);
    procedure RectVoltarClick(Sender: TObject);
  private
    { Private declarations }
    procedure VoltarTela;
    procedure Registrar;
  public
    { Public declarations }
end;

var
  fraTeamRegistry: TfraTeamRegistry;

implementation

{$R *.fmx}

uses
   UfraTeam,
   UEntity.Teams,
   Uservice.Intf,
   Uservice.Team;

{ TFraTeamRegistry }

procedure TFraTeamRegistry.rectSalvarClick(Sender: TObject);
begin
  Self.Registrar;
end;

procedure TFraTeamRegistry.RectVoltarClick(Sender: TObject);
begin
  Self.VoltarTela;
end;

procedure TFraTeamRegistry.Registrar;
var
  xServiceTeam: Iservice;
begin
  if Trim(edtNome.Text) = EmptyStr then
    raise Exception.Create('Informe o Nome do Time.');

  xServiceTeam := TServiceTeam.Create(
    TTeam.Create(Trim(edtNome.Text)));

  xServiceTeam.Registrar;
  Self.VoltarTela;
end;

procedure TFraTeamRegistry.VoltarTela;
begin
  if not Assigned(FraTeam) then
    FraTeam := TFraTeams.create(Application);

  fraTeam.Align := TAlignLayout.Center;

  Self.Parent.AddObject(FraTeam);
  FreeAndNil(FraTeamRegistry);
end;

end.
