unit UConcreteSubject;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids,
  Vcl.DBGrids, Datasnap.DBClient, Vcl.StdCtrls, Vcl.ExtCtrls, Usubject, UObserver,
  Generics.Collections;

type
  TfraCadastro = class(TFrame, Isubject)
    Label1: TLabel;
    cmbOperacao: TComboBox;
    label2: TLabel;
    cmbCategoria: TComboBox;
    Label3: TLabel;
    edtValor: TEdit;
    btnGravar: TButton;
    Cli: TDataSource;
    Shape1: TShape;
    DBGrid1: TDBGrid;
    ClientDataSet1: TClientDataSet;
    ClientDataSet1Operacao: TStringField;
    ClientDataSet1Categoria: TStringField;
    ClientDataSet1Valor: TCurrencyField;
    procedure btnGravarClick(Sender: TObject);
    procedure cmbOperacaoChange(Sender: TObject);
  private
    { Private declarations }
    FObservers: TList<IObserver>;
    procedure Notificar;
    procedure CarregarCategorias;
  public
    { Public declarations }
    constructor Create(AOwner: TComponent); Override;
    destructor destroy; override;

    procedure AdicionarObserver(aObserver: IObserver);
    procedure RemoverObserver(aObserver: IObserver);
  end;

implementation

uses
  UNotificacao;

{$R *.dfm}


{ TfraCadastro }

procedure TfraCadastro.AdicionarObserver(aObserver: IObserver);
begin
  FObservers.Add(aObserver);
end;

procedure TfraCadastro.btnGravarClick(Sender: TObject);
begin
  // Adiciona um registro no DataSet conforme valores informados pelo usu�rio
  ClientDataSet1.AppendRecord(
    [cmbOperacao.Text, cmbCategoria.Text, StrToFloatDef(edtValor.Text, 0)]);

  // Chama o m�todo de notifica��o
  Self.Notificar;
end;

procedure TfraCadastro.CarregarCategorias;
begin
  cmbCategoria.Clear;

case cmbOperacao.ItemIndex of
   0:
    begin
     cmbCategoria.Items.Add('Sal�rio');
     cmbCategoria.Items.Add('13�');
     cmbCategoria.Items.Add('Restitui��o do IR');
     cmbCategoria.Items.Add('Freelancing');
   end;
   1:
   begin
     cmbCategoria.Items.Add('Aluguel');
     cmbCategoria.Items.Add('SuperMercado');
     cmbCategoria.Items.Add('Farm�cia');
     cmbCategoria.Items.Add('Escola');
     cmbCategoria.Items.Add('Combust�vel');
     cmbCategoria.Items.Add('Alimenta��o');
     cmbCategoria.Items.Add('Roupas');
     cmbCategoria.Items.Add('Viagens');
   end;
end;
end;

procedure TfraCadastro.cmbOperacaoChange(Sender: TObject);
begin
  Self.CarregarCategorias;
end;

constructor TfraCadastro.Create(AOwner: TComponent);
begin
  inherited;
  FObservers := TList<IObserver>.create;
end;

destructor TfraCadastro.destroy;
begin
  FObservers.Free;
  inherited;
end;

procedure TfraCadastro.Notificar;
var
  xNotificacao: TNotificacao;
  xObserver: IObserver;
begin
  xNotificacao.Operacao  := ClientDataSet1.FieldByName('Operacao').AsString;
  xNotificacao.Categoria := ClientDataSet1.FieldByName('Categoria').AsString;
  xNotificacao.Valor     := ClientDataSet1.FieldByName('Valor').AsFloat;

  for xObserver in FObservers do
  begin
    xObserver.Atualizar(xNotificacao);
  end;
end;

procedure TfraCadastro.RemoverObserver(aObserver: IObserver);
begin
  FObservers.Delete(FObservers.IndexOf(aObserver));
end;

end.
