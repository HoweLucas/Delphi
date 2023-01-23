unit ufrmPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls,system.Generics.Collections;

type
  TForm1 = class(TForm)
    Edit1: TEdit;
    BtnPush: TButton;
    BtnPop: TButton;
    BtnExtract: TButton;
    btnPeek: TButton;
    btnTrimExcess: TButton;
    btnCount: TButton;
    btnCapacity: TButton;
    Memo1: TMemo;
    procedure btnCapacityClick(Sender: TObject);
    procedure btnCountClick(Sender: TObject);
    procedure BtnExtractClick(Sender: TObject);
    procedure btnPeekClick(Sender: TObject);
    procedure BtnPopClick(Sender: TObject);
    procedure BtnPushClick(Sender: TObject);
    procedure btnTrimExcessClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    FPilha: TStack<String>;
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.btnCapacityClick(Sender: TObject);
begin
  Memo1.Lines.Add(FPilha.Capacity.ToString);
end;

procedure TForm1.btnCountClick(Sender: TObject);
begin
  Memo1.Lines.Add(FPilha.Count.ToString);
end;

procedure TForm1.BtnExtractClick(Sender: TObject);
begin
  Memo1.Lines.Add(FPilha.Extract);
end;

procedure TForm1.btnPeekClick(Sender: TObject);
begin
  Memo1.Lines.Add(FPilha.Peek);
end;

procedure TForm1.BtnPopClick(Sender: TObject);
begin
  Memo1.Lines.Add(FPilha.Pop);
end;

procedure TForm1.BtnPushClick(Sender: TObject);
begin
  FPilha.Push(Edit1.Text);
end;

procedure TForm1.btnTrimExcessClick(Sender: TObject);
begin
  FPilha.TrimExcess;
  Memo1.Lines.Add(FPilha.Capacity.ToString);
end;

procedure TForm1.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FPilha.Free;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  FPilha := TStack<String>.Create;
end;

end.
