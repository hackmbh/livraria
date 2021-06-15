unit Inicio;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Menus;

type
  TfrmInicial = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Button5: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    //procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmInicial: TfrmInicial;

implementation

{$R *.dfm}

uses Livro, Editora, Usuarios, ClienteFornecedor, FormaPagamento, DataModLivraria;

procedure TfrmInicial.Button1Click(Sender: TObject);
begin
frmCadLivro := TfrmCadLivro.Create(nil);
try
   frmCadLivro.ShowModal;
finally
   FreeAndNil(frmCadLivro);
end;
end;

procedure TfrmInicial.Button2Click(Sender: TObject);
begin
frmEditora := TfrmEditora.Create(nil);
try
   frmEditora.ShowModal;
finally
   FreeAndNil(frmEditora);
end;
end;

procedure TfrmInicial.Button3Click(Sender: TObject);
begin
   frmUsuarios := TfrmUsuarios.Create(nil);
   try
      frmUsuarios.ShowModal;
   finally
      FreeAndNil(frmUsuarios);
   end;
end;

procedure TfrmInicial.Button4Click(Sender: TObject);
begin
   frmCliFor := TfrmCliFor.Create(nil);
   try
      frmCliFor.ShowModal;
   finally
      FreeAndNil(frmCliFor);
   end;
end;

procedure TfrmInicial.Button5Click(Sender: TObject);
begin
   frmFormPagto := TfrmFormPagto.Create(nil);
   try
      frmFormPagto.ShowModal;
   finally
      FreeAndNil(frmFormPagto);
   end;
end;

procedure TfrmInicial.FormCreate(Sender: TObject);
begin
   try
   DataModuleLivraria.ADConnection1.Connected := true;
      //ShowMessage('foi');
   except on E: Exception do
      ShowMessage('teste');
   end;
end;

end.
