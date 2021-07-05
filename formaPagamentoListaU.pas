unit formaPagamentoListaU;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, ModeloListaU, Data.DB, Vcl.ExtCtrls,
  Vcl.Grids, Vcl.DBGrids, Vcl.StdCtrls, Vcl.Buttons, uADStanIntf, uADStanOption,
  uADStanParam, uADStanError, uADDatSManager, uADPhysIntf, uADDAptIntf,
  uADStanAsync, uADDAptManager, uADCompDataSet, uADCompClient;

type
  TfrmFormaPagamentoLista = class(TfrmModeloLista)
    adqFormPgto: TADQuery;
    procedure FormShow(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure btnAdicionarClick(Sender: TObject);
    procedure dbgDadosDblClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure btnFiltroClick(Sender: TObject);
    procedure dbgDadosTitleClick(Column: TColumn);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmFormaPagamentoLista: TfrmFormaPagamentoLista;
  campoFiltro: string;

implementation

{$R *.dfm}

   uses DataModLivraria, FormaPagamento;

procedure TfrmFormaPagamentoLista.btnAdicionarClick(Sender: TObject);
begin
   inherited;
   frmFormPagto := TfrmFormPagto.Create(Application);
   //idRef := 0;
end;

procedure TfrmFormaPagamentoLista.btnExcluirClick(Sender: TObject);
   var iCod : integer;
begin
   inherited;
   //verifica se há registros na tabela
   if dsModelo.DataSet.RecordCount = 0 then begin
      MessageBox(application.Handle, Pchar('Não existem registros!'), Pchar('Falha ao excluir registro!'), MB_OK+MB_ICONERROR);
      exit;
   end;

   //confirmação de exclusão
   if MessageBox(application.Handle, Pchar('Deseja excluir este registro?'), Pchar('Confirmar Exclusão'), MB_YESNO+MB_ICONQUESTION ) = ID_YES then begin
      iCod := dsModelo.DataSet.FieldByName('ID').AsInteger;
      adqFormPgto.Filtered := false;
      adqFormPgto.Close;
      adqFormPgto.SQL.Clear;
      adqFormPgto.SQL.Add('SELECT ID FROM TBFORM_PAGAMENTO WHERE ID = :ID');
      adqFormPgto.ParamByName('ID').AsInteger := iCod;
      adqFormPgto.Open;
      if not adqFormPgto.IsEmpty then begin
         try
            DataModuleLivraria.adConnectionLivro.StartTransaction;
            adqFormPgto.Close;
            adqFormPgto.SQL.Clear;
            adqFormPgto.SQL.Add('DELETE FROM TBFORM_PAGAMENTO WHERE ID = :ID');
            adqFormPgto.ParamByName('ID').AsInteger := iCod;
            adqFormPgto.ExecSQL;
            DataModuleLivraria.adConnectionLivro.Commit;
         finally
            if DataModuleLivraria.adConnectionLivro.InTransaction then
               DataModuleLivraria.adConnectionLivro.Rollback
            else begin
               FormShow(Sender);
               ShowMessage('Deletado com sucesso!');
            end;
         end;
      end;
   end;
end;

procedure TfrmFormaPagamentoLista.btnFiltroClick(Sender: TObject);
   var debug : string;
begin
   inherited;
   adqFormPgto.FilterOptions := [foCaseInsensitive];
   adqFormPgto.Filter := campoFiltro+' like '+QuotedStr('%'+editFiltro.Text+'%');
   debug := adqFormPgto.Filter;
   //ativa o filtro
   adqFormPgto.Filtered := true;
end;

procedure TfrmFormaPagamentoLista.dbgDadosDblClick(Sender: TObject);
begin
   inherited;
   idRef := dbgDados.DataSource.DataSet.FieldByName('ID').AsInteger; //usando dados do DataSource
   frmFormPagto := TfrmFormPagto.Create(Application);
end;

procedure TfrmFormaPagamentoLista.dbgDadosTitleClick(Column: TColumn);
begin
   inherited;
   lbFiltro.Caption := Column.Title.Caption+': ';
   editFiltro.Clear;
   campoFiltro := Column.FieldName;
   adqFormPgto.Filtered := false;
   editFiltro.SetFocus; //apresentar o cursor no campo de pesquisa após clicar no título da coluna
end;

procedure TfrmFormaPagamentoLista.FormActivate(Sender: TObject);
begin
   inherited;
   dsModelo.DataSet.Refresh;
end;

procedure TfrmFormaPagamentoLista.FormShow(Sender: TObject);
begin
   inherited;
   adqFormPgto.Close;
   adqFormPgto.SQL.Clear;
   adqFormPgto.SQL.Add('SELECT ID, DESCRICAO FROM TBFORM_PAGAMENTO ORDER BY ID');
   adqFormPgto.Open;

   lbFiltro.Caption := dbgDados.Columns[0].Title.caption+': ';
   editFiltro.Clear;
   campoFiltro := dbgDados.Columns[0].FieldName;

   adqFormPgto.Filtered := false;
end;

end.
