unit Editora;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, uADStanIntf,
  uADStanOption, uADStanParam, uADStanError, uADDatSManager, uADPhysIntf,
  uADDAptIntf, uADStanAsync, uADDAptManager, Vcl.Grids, Vcl.DBGrids, Data.DB,
  uADCompDataSet, uADCompClient;

type
  TfrmEditora = class(TForm)
    editNome: TLabeledEdit;
    editDescricao: TLabeledEdit;
    btnExcluir: TButton;
    bntCancelar: TButton;
    btnSalvar: TButton;
    btnAtualizar: TButton;
    editID: TLabeledEdit;
    ADQuery1: TADQuery;
    DataSource1: TDataSource;
    dbGridEditora: TDBGrid;
    btnListar: TButton;
    procedure FormShow(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure btnAtualizarClick(Sender: TObject);
    procedure dbGridEditoraCellClick(Column: TColumn);
    procedure btnListarClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure bntCancelarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmEditora: TfrmEditora;

implementation

{$R *.dfm}


//limpa os campos edit ao clicar em Cancelar
procedure TfrmEditora.bntCancelarClick(Sender: TObject);
begin
   editID.Clear;
   editNome.Clear;
   editDescricao.Clear;
end;

//atualiza editora
procedure TfrmEditora.btnAtualizarClick(Sender: TObject);
begin
   if editID.Text <> '' then begin //verifica id e descri??o se est?o vazios
      ADQuery1.Close;
      ADQuery1.SQL.Clear;
      ADQuery1.SQL.Add('SELECT ID FROM TBEDITORA WHERE ID = :ID');
      ADQuery1.ParamByName('ID').AsString := editID.Text;
      ADQuery1.Open;
      if not ADQuery1.IsEmpty then begin
         try
            ADQuery1.Close;
            ADQuery1.SQL.Clear;
            ADQuery1.SQL.Add('UPDATE TBEDITORA SET NOME = :NOME, DESCRICAO = :DESCRICAO WHERE ID = :ID');
            ADQuery1.ParamByName('NOME').AsString := editNome.Text;
            ADQuery1.ParamByName('DESCRICAO').AsString := editDescricao.Text;
            ADQuery1.ParamByName('ID').AsString := editID.Text;
            ADQuery1.ExecSQL;
         finally
            btnListarClick(Sender);
            ShowMessage('Atualizado com sucesso!');
         end;
      end;
   end;
end;

//deleta editora
procedure TfrmEditora.btnExcluirClick(Sender: TObject);
begin
if editID.Text <> '' then begin //verifica id e descri??o se est?o vazios
   ADQuery1.Close;
   ADQuery1.SQL.Clear;
   ADQuery1.SQL.Add('SELECT ID FROM TBEDITORA WHERE ID = :ID');
   ADQuery1.ParamByName('ID').AsString := editID.Text;
   ADQuery1.Open;
   if not ADQuery1.IsEmpty then begin
      try
         ADQuery1.Close;
         ADQuery1.SQL.Clear;
         ADQuery1.SQL.Add('DELETE FROM TBEDITORA WHERE ID = :ID');
         ADQuery1.ParamByName('ID').AsString := editID.Text;
         ADQuery1.ExecSQL;
      finally
         editID.Clear;
         editNome.Clear;
         editDescricao.Clear;
         btnListarClick(Sender);
         ShowMessage('Deletado com sucesso!');
      end;
   end;
end;
end;

//lista editora na dbgrid
procedure TfrmEditora.btnListarClick(Sender: TObject);
begin
   ADQuery1.Close;
   ADQuery1.SQL.Clear;
   ADQuery1.SQL.Add('SELECT * FROM TBEDITORA');
   ADQuery1.Open;
end;

//cadastra editora
procedure TfrmEditora.btnSalvarClick(Sender: TObject);
begin
if editID.Text <> '' then begin
   ShowMessage('O campo ID deve estar em branco para realizar um novo cadastro!');
   exit;
end;
if editNome.Text <> '' then begin
   ADQuery1.Close;
   ADQuery1.SQL.Clear;
   ADQuery1.SQL.Add('INSERT INTO TBEDITORA (NOME, DESCRICAO, ID_USUARIO) VALUES (:NOME, :DESCRICAO, 1)');
   ADQuery1.ParamByName('NOME').AsString := editNome.Text;
   ADQuery1.ParamByName('DESCRICAO').AsString := editDescricao.Text;
   ADQuery1.ExecSQL;
   btnListarClick(Sender);
end;

end;

//carrega os dados no edit ao clicar na linha da DBgrid
procedure TfrmEditora.dbGridEditoraCellClick(Column: TColumn);
begin
   editID.Text := dbGridEditora.DataSource.DataSet.FieldByName('ID').AsString;
   editNome.Text := dbGridEditora.DataSource.DataSet.FieldByName('NOME').AsString;
   editDescricao.Text := dbGridEditora.DataSource.DataSet.FieldByName('DESCRICAO').AsString;
end;

//carrega os dados ao mostrar o formul?rio
procedure TfrmEditora.FormShow(Sender: TObject);
begin
   ADQuery1.Close;
   ADQuery1.SQL.Clear;
   ADQuery1.SQL.Add('SELECT * FROM TBEDITORA');
   ADQuery1.Open;
end;



end.
