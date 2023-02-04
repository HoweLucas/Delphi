unit UConcreteObserver_Historico;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.StdCtrls,
  Vcl.Grids, Vcl.DBGrids, Datasnap.DBClient, UObserver, UNotificacao;

type
  TfraHistorico = class(TFrame, IObserver)
    ClientDataSet1: TClientDataSet;
    DBGrid1: TDBGrid;
    Label1: TLabel;
    DataSource1: TDataSource;
    ClientDataSet1Categoria: TStringField;
    ClientDataSet1Total: TCurrencyField;
  private
    { Private declarations }
  public
    { Public declarations }
    procedure Atualizar(aNotificacao: TNotificacao);
  end;

implementation

{$R *.dfm}

{ TfraHistorico }

procedure TfraHistorico.Atualizar(aNotificacao: TNotificacao);
begin
  if aNotificacao.Operacao = 'Cr�dito' then
    exit;

  // Encontra a categoria de d�bito para somar o valor
  if clientDataSet1.Locate('Categoria', anotificacao.Categoria, []) then
  begin
    ClientDataSet1.Edit;

    ClientDataSet1.FieldByName('Total').AsFloat :=
      ClientDataSet1.FieldByName('Total').AsFloat + aNotificacao.Valor;
    ClientDataSet1.Post;

    exit;
  end;

  //Cadastra a Categoria caso ela ainda n�o exista no agrupamento
  ClientDataSet1.AppendRecord([aNotificacao.Categoria, aNotificacao.Valor]);
end;

end.
