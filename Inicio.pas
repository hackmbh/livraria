unit Inicio;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Menus, Vcl.ActnList,
  Vcl.ImgList, Vcl.ToolWin, Vcl.ComCtrls;

type
  TfrmInicial = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Button5: TButton;
    mPrincipal: TMainMenu;
    Arquivo1: TMenuItem;
    Cadastro1: TMenuItem;
    Venda1: TMenuItem;
    Sair1: TMenuItem;
    Cliente1: TMenuItem;
    Funcionrio1: TMenuItem;
    Produto1: TMenuItem;
    Relatrios1: TMenuItem;
    Clientes1: TMenuItem;
    Produtos1: TMenuItem;
    Vendas1: TMenuItem;
    Ajuda1: TMenuItem;
    Sobre1: TMenuItem;
    sbPrincipal: TStatusBar;
    tbPrincipal: TToolBar;
    ilPrincipal48: TImageList;
    ilPrincipal20: TImageList;
    acPrincipal: TActionList;
    acCadCliente: TAction;
    acCadFuncionario: TAction;
    acCadProduto: TAction;
    acVenda: TAction;
    acRelCliente: TAction;
    acRelProduto: TAction;
    acRelVenda: TAction;
    acSair: TAction;
    acSobre: TAction;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    ToolButton4: TToolButton;
    ToolButton5: TToolButton;
    ToolButton6: TToolButton;
    ToolButton7: TToolButton;
    ToolButton8: TToolButton;
    FormadePagamento1: TMenuItem;
    acFormaPagamento: TAction;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    //procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure acCadClienteExecute(Sender: TObject);
    procedure acCadFuncionarioExecute(Sender: TObject);
    procedure acFormaPagamentoExecute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmInicial: TfrmInicial;

implementation

{$R *.dfm}

uses Livro, Editora, Usuarios, ClienteFornecedor, clienteListaU, formaPagamentoListaU, FormaPagamento, DataModLivraria, funcionarioListaU;

//chamada de formulário Cliente através do Form MDI
procedure TfrmInicial.acCadClienteExecute(Sender: TObject);
   var formulario : TForm;
begin
   formulario := TfrmClientesLista.Create(Application);
end;

//chamada de formulário Funcionário através do Form MDI
procedure TfrmInicial.acCadFuncionarioExecute(Sender: TObject);
   var formularioFun : TForm;
begin
   formularioFun := TfrmFuncionarioLista.Create(Application);
end;

//chamada de formulário Formas de Pagamento através do Form MDI
procedure TfrmInicial.acFormaPagamentoExecute(Sender: TObject);
   var formularioFP : TForm;
begin
   formularioFP := TfrmFormaPagamentoLista.Create(Application);
end;

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
