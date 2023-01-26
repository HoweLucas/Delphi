unit ufrmPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TForm1 = class(TForm)
    cmbmarca: TComboBox;
    btnExibir: TButton;
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    lblTamanhoTela: TLabel;
    lblMemoriaRam: TLabel;
    lblProcessador: TLabel;
    lblTamanhoHD: TLabel;
    procedure btnExibirClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

uses
  UInterfaces, UDell, UApple;

{$R *.dfm}

procedure TForm1.btnExibirClick(Sender: TObject);
var
  xMarca: IfactoryMarca;
  xNotebook: iNotebook;
  xDesktop: IDesktop;
begin
  //Instancia a marca -> único IF da aplicação
  if cmbMarca.items[cmbMarca.ItemIndex] = 'Dell' then
    xMarca := TDell.create
  else if cmbMarca.Items[cmbMarca.ItemIndex] = 'apple' then
    xMarca := TApple.create;

  //Consulta (constroi) os objetos
  xNotebook := xMarca.ConsultarNotebook;
  xDesktop  := xMarca.ConsultarDesktop;

  //Exibe os dados
  lbltamanhoTela.Caption := xNoteBook.BuscarTamanhoTela;
  lblMemoriaRam.Caption  := xNotebook.BuscarMemoriaRam;

  lblProcessador.Caption := xDesktop.BuscarNomeProcessador;
  lblTamanhoHd.Caption   := xDesktop.BuscarTamanhoHD;

  //Detalhe importante como usamos interfaces para as variaveis
  //não precisamos destruir seus objetos. O Delphi faz isso por nós
end;

end.
