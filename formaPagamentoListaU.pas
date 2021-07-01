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
   //verifica se h� registros na tabela
   if dsModelo.DataSet.RecordCount = 0 then begin
      MessageBox(application.Handle, Pchar('N�o existem registros!'), Pchar('Falha ao excluir registro!'), MB_OK+MB_ICONERROR);
      exit;
   end;

   //confirma��o de exclus�o
   if MessageBox(application.Handle, Pchar('Deseja excluir este registro?'), Pchar('Confirmar Exclus�o'), MB_YESNO+MB_ICONQUESTION ) = ID_YES then begin
      iCod := dsModelo.DataSet.FieldByName('ID').AsInteger;
      adqFormPgto.Close;
      adqFormPgto.SQL.Clear;
      adqFormPgto.SQL.Add('SELECT ID FROM TBFORM_PAGAMENTO WHERE ID = :ID');
      //adqClientes.ParamByName('ID').AsString := editID.Text;
      //adqClientes.ParamByName('ID').AsInteger := dbgDados.DataSource.DataSet.FieldByName('ID').AsInteger;
      adqFormPgto.ParamByName('ID').AsInteger := iCod;
      adqFormPgto.Open;
      if not adqFormPgto.IsEmpty then begin
         try
            adqFormPgto.Close;
            adqFormPgto.SQL.Clear;
            adqFormPgto.SQL.Add('DELETE FROM TBFORM_PAGAMENTO WHERE ID = :ID');
            //adqClientes.ParamByName('ID').AsInteger := dbgDados.DataSource.DataSet.FieldByName('ID').AsInteger;
            //adqClientes.ParamByName('ID').AsInteger := dbgDados.DataSource.DataSet.FieldByName('ID').AsString;
            adqFormPgto.ParamByName('ID').AsInteger := iCod;
            adqFormPgto.ExecSQL;
         finally
            {.Clear;
            editNome.Clear;
            editSenha.Clear;
            comboStatus.Clear;
            btnListarClick(Sender);}
            FormShow(Sender);
            ShowMessage('Deletado com sucesso!');
         end;
      end;
   end;
end;

procedure TfrmFormaPagamentoLista.dbgDadosDblClick(Sender: TObject);
begin
   inherited;
   idRef := dbgDados.DataSource.DataSet.FieldByName('ID').AsInteger; //usando dados do DataSource
   frmFormPagto := TfrmFormPagto.Create(Application);
end;

procedure TfrmFormaPagamentoLista.FormShow(Sender: TObject);
begin
   inherited;
   adqFormPgto.Close;
   adqFormPgto.SQL.Clear;
   //adqClientes.SQL.Add('SELECT * FROM TBCLIFOR WHERE TIPO_CLI_FOR = '+QuotedStr('C')+' OR TIPO_CLI_FOR = '+QuotedStr('A'));
   adqFormPgto.SQL.Add('SELECT ID, DESCRICAO FROM TBFORM_PAGAMENTO');
   adqFormPgto.Open;

   lbFiltro.Caption := dbgDados.Columns[0].Title.caption+': ';
   editFiltro.Clear;
   campoFiltro := dbgDados.Columns[0].FieldName;

   adqFormPgto.Filtered := false;
end;

end.
