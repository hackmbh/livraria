program ProjetoLivraria;

uses
  Vcl.Forms,
  Inicio in 'Inicio.pas' {frmInicial},
  Usuarios in 'Usuarios.pas' {frmUsuarios},
  Editora in 'Editora.pas' {frmEditora},
  FormaPagamento in 'FormaPagamento.pas' {frmFormPagto},
  Livro in 'Livro.pas' {frmCadLivro},
  ClienteFornecedor in 'ClienteFornecedor.pas' {frmCliFor},
  DataModLivraria in 'DataModLivraria.pas' {DataModuleLivraria: TDataModule};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TDataModuleLivraria, DataModuleLivraria);
  Application.CreateForm(TfrmInicial, frmInicial);
  Application.CreateForm(TfrmUsuarios, frmUsuarios);
  Application.CreateForm(TfrmCliFor, frmCliFor);
  Application.CreateForm(TfrmFormPagto, frmFormPagto);
  Application.CreateForm(TfrmCadLivro, frmCadLivro);
  Application.CreateForm(TfrmEditora, frmEditora);
  Application.Run;
end.
