unit Livro;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, uADStanIntf,
  uADStanOption, uADStanParam, uADStanError, uADDatSManager, uADPhysIntf,
  uADDAptIntf, uADStanAsync, uADDAptManager, Data.DB, uADCompDataSet,
  uADCompClient, Vcl.Grids, Vcl.DBGrids;

type
  TfrmCadLivro = class(TForm)
    editTitulo: TLabeledEdit;
    editAutor: TLabeledEdit;
    editDescricao: TLabeledEdit;
    comboEditora: TComboBox;
    editValor: TLabeledEdit;
    editAno: TLabeledEdit;
    Label1: TLabel;
    btnSalvar: TButton;
    btnExcluir: TButton;
    btnAtualizar: TButton;
    btnCancelar: TButton;
    ADQuery1: TADQuery;
    DataSource1: TDataSource;
    dbGridLivros: TDBGrid;
    editID: TLabeledEdit;
    btnListar: TButton;
    procedure btnSalvarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnAtualizarClick(Sender: TObject);
    procedure dbGridLivrosCellClick(Column: TColumn);
    procedure btnExcluirClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnListarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadLivro: TfrmCadLivro;

implementation

{$R *.dfm}

//cadastra livro
procedure TfrmCadLivro.btnSalvarClick(Sender: TObject);
begin
if editID.Text <> '' then begin
   ShowMessage('O campo ID deve estar em branco para realizar um novo cadastro!');
   exit;
end;
if editTitulo.Text <> '' then begin
   ADQuery1.Close;
   ADQuery1.SQL.Clear;
   ADQuery1.SQL.Add('INSERT INTO TBLIVRO (TITULO, DESCRICAO, ID_EDITORA, AUTOR, ANO, VALOR, ID_USUARIO) VALUES (:TITULO, :DESCRICAO, :ID_EDITORA, :AUTOR, :ANO, :VALOR, 1)');
   ADQuery1.ParamByName('TITULO').AsString := editTitulo.Text;
   ADQuery1.ParamByName('DESCRICAO').AsString := editDescricao.Text;
   ADQuery1.ParamByName('ID_EDITORA').AsInteger := StrToIntDef(comboEditora.Text, 0);
   ADQuery1.ParamByName('AUTOR').AsString := editAutor.Text;
   ADQuery1.ParamByName('ANO').AsInteger := StrToIntDef(editAno.Text, 0);
   ADQuery1.ParamByName('VALOR').AsCurrency := StrToCurrDef(editAno.Text, 0);
   ADQuery1.ExecSQL;
   btnListarClick(Sender);
end;

end;

//lista itens na grid ap?s clicar no bot?o Listar
procedure TfrmCadLivro.btnListarClick(Sender: TObject);
begin
   ADQuery1.Close;
   ADQuery1.SQL.Clear;
   ADQuery1.SQL.Add('SELECT * FROM TBLIVRO');
   ADQuery1.Open;
end;

//insere os dados da linha que foi clicada no DBgrid
procedure TfrmCadLivro.dbGridLivrosCellClick(Column: TColumn);
begin
   editID.Text := dbGridLivros.DataSource.DataSet.FieldByName('ID').AsString;
   editTitulo.Text := dbGridLivros.DataSource.DataSet.FieldByName('TITULO').AsString;
   editDescricao.Text := dbGridLivros.DataSource.DataSet.FieldByName('DESCRICAO').AsString;
   comboEditora.Text := dbGridLivros.DataSource.DataSet.FieldByName('ID_EDITORA').AsString;
   editAutor.Text := dbGridLivros.DataSource.DataSet.FieldByName('AUTOR').AsString;
   editAno.Text := dbGridLivros.DataSource.DataSet.FieldByName('ANO').AsString;
   editValor.Text := dbGridLivros.DataSource.DataSet.FieldByName('VALOR').AsString;
end;

//carrega os dados da DBgrid ap?s mostrar o formul?rio
procedure TfrmCadLivro.FormShow(Sender: TObject);
begin
   ADQuery1.Close;
   ADQuery1.SQL.Clear;
   ADQuery1.SQL.Add('SELECT * FROM TBLIVRO');
   ADQuery1.Open;
end;

//atualiza dados
procedure TfrmCadLivro.btnAtualizarClick(Sender: TObject);
begin
   if editID.Text <> '' then begin //verifica id e descri??o se est?o vazios
      ADQuery1.Close;
      ADQuery1.SQL.Clear;
      ADQuery1.SQL.Add('SELECT ID FROM TBLIVRO WHERE ID = :ID');
      ADQuery1.ParamByName('ID').AsString := editID.Text;
      ADQuery1.Open;
      if not ADQuery1.IsEmpty then begin
         try
            ADQuery1.Close;
            ADQuery1.SQL.Clear;
            ADQuery1.SQL.Add('UPDATE TBLIVRO SET TITULO = :TITULO, DESCRICAO = :DESCRICAO, ID_EDITORA = :EDITORA, AUTOR = :AUTOR, ANO = :ANO, VALOR = :VALOR WHERE ID = :ID');
            ADQuery1.ParamByName('TITULO').AsString := editTitulo.Text;
            ADQuery1.ParamByName('DESCRICAO').AsString := editDescricao.Text;
            ADQuery1.ParamByName('EDITORA').AsInteger := StrToIntDef(comboEditora.Text, 0);
            ADQuery1.ParamByName('AUTOR').AsString := editAutor.Text;
            ADQuery1.ParamByName('ANO').AsInteger := StrToIntDef(editAno.Text, 0);
            ADQuery1.ParamByName('VALOR').AsCurrency := StrToCurrDef(editAno.Text, 0);
            ADQuery1.ParamByName('ID').AsString := editID.Text;
            ADQuery1.ExecSQL;
         finally
            btnListarClick(Sender);
            ShowMessage('Atualizado com sucesso!');
         end;
      end;
   end;
end;

//excluir livro
procedure TfrmCadLivro.btnExcluirClick(Sender: TObject);
begin
if editID.Text <> '' then begin //verifica id e descri??o se est?o vazios
   ADQuery1.Close;
   ADQuery1.SQL.Clear;
   ADQuery1.SQL.Add('SELECT ID FROM TBLIVRO WHERE ID = :ID');
   ADQuery1.ParamByName('ID').AsString := editID.Text;
   ADQuery1.Open;
   if not ADQuery1.IsEmpty then begin
      try
         ADQuery1.Close;
         ADQuery1.SQL.Clear;
         ADQuery1.SQL.Add('DELETE FROM TBLIVRO WHERE ID = :ID');
         ADQuery1.ParamByName('ID').AsString := editID.Text;
         ADQuery1.ExecSQL;
      finally
         editID.Clear;
         editTitulo.Clear;
         comboEditora.Clear;
         editDescricao.Clear;
         editAutor.Clear;
         editAno.Clear;
         editValor.Clear;
         btnListarClick(Sender);
         ShowMessage('Deletado com sucesso!');
      end;
   end;
end;
end;

//cancelar
procedure TfrmCadLivro.btnCancelarClick(Sender: TObject);
begin
   editID.Clear;
   editTitulo.Clear;
   comboEditora.Clear;
   editDescricao.Clear;
   editAutor.Clear;
   editAno.Clear;
   editValor.Clear;
end;



end.
