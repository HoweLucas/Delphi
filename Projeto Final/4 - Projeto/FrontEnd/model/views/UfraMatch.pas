unit UfraMatch;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants, 
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  FMX.ListView.Types, FMX.ListView.Appearances, FMX.ListView.Adapters.Base,
  FMX.Controls.Presentation, FMX.ListView, FMX.Objects, FMX.Layouts, UEntity.Matchs;

type
  TfraMatch = class(TFrame)
    rectPrincipal: TRectangle;
    lytPrincipal: TLayout;
    imgLogo: TImage;
    lytPartida: TLayout;
    lstPartidas: TListView;
    RectToolBar: TRectangle;
    rectExcluir: TRectangle;
    Label1: TLabel;
    rectNovo: TRectangle;
    Label2: TLabel;
    procedure rectExcluirClick(Sender: TObject);
    procedure rectNovoClick(Sender: TObject);
  private
    { Private declarations }
    procedure CarregarRegistros;
    procedure AbrirMatchsRegistry;
    procedure PrepararListView(aMatch: TMatch);
    procedure ExcluirRegistro;
  public
    { Public declarations }
    constructor Create(aOwner: TComponent); override;
  end;

var
  fraMatch: TfraMatch;

implementation

{$R *.fmx}

Uses
   UfraMatch.Registry,
   Uservice.Intf,
   Uservice.Match;

{ TfraMatch }

procedure TfraMatch.AbrirMatchsRegistry;
begin
  if not Assigned(FraMatchRegistry) then
    FraMatchRegistry := TFraMatchRegistry.Create(Application);

    FraMatchRegistry.Align := TAlignLayout.Center;

  Self.Parent.AddObject(FraMatchRegistry);
  FreeAndNil(FraMatch);
end;

procedure TfraMatch.CarregarRegistros;
var
  xServiceMatch: Iservice;
  xMatch: Tmatch;
begin
  lstPartidas.Items.Clear;

  xServiceMatch := TServiceMatch.Create;
  xServiceMatch.Listar;
  for xMatch in TServiceMatch(xServiceMatch).Matchs do
     Self.PrepararListView(xMatch);
end;

constructor TfraMatch.Create(aOwner: TComponent);
begin
  inherited Create(aOwner);
  Self.CarregarRegistros;
end;

procedure TfraMatch.ExcluirRegistro;
var
  xServiceMatch: Iservice;
  xMatch: TMatch;
  xItem: TListViewItem;
begin
  if lstPartidas.ItemIndex = -1 then
    Exit;

  xItem  := lstPartidas.Items[lstPartidas.ItemIndex];
  xMatch := TMatch.Create(xItem.Tag);

  xServiceMatch := TServiceMatch.Create(xMatch);
  try
    xServiceMatch.Excluir;
    ShowMessage('Registro excluido.')
  finally
    Self.CarregarRegistros;
  end;
end;

procedure TfraMatch.PrepararListView(aMatch: TMatch);
var
  xItem: TListViewItem;
begin
  xItem           := lstPartidas.Items.Add;
  xItem.Tag       := aMatch.Id;

  TListItemText(xItem.Objects.FindDrawable('txtHora')).Text := TimeToStr(aMatch.Hour);
  TListItemText(xItem.Objects.FindDrawable('txtData')).Text := DateToStr(aMatch.date);
  TListItemText(xItem.Objects.FindDrawable('txtTimeA')).Text := aMatch.TeamA.Name;
  TListItemText(xItem.Objects.FindDrawable('txtTimeB')).Text := aMatch.TeamB.Name;
  TListItemText(xItem.Objects.FindDrawable('txtResultadoTimeA')).Text := aMatch.ResultTeamA.ToString;
  TListItemText(xItem.Objects.FindDrawable('txtResultadoTimeB')).Text := aMatch.ResultTeamB.ToString;

end;

procedure TfraMatch.rectExcluirClick(Sender: TObject);
begin
  Self.ExcluirRegistro;
end;

procedure TfraMatch.rectNovoClick(Sender: TObject);
begin
  Self.AbrirMatchsRegistry;
end;

end.
