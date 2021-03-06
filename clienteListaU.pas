unit clienteListaU;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, ModeloListaU, Vcl.ExtCtrls, Vcl.Grids,
  Vcl.DBGrids, Vcl.StdCtrls, Vcl.Buttons, Data.DB, uADStanIntf, uADStanOption,
  uADStanParam, uADStanError, uADDatSManager, uADPhysIntf, uADDAptIntf,
  uADStanAsync, uADDAptManager, uADCompDataSet, uADCompClient;

type
  TfrmClientesLista = class(TfrmModeloLista)
    adqClientes: TADQuery;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnExcluirClick(Sender: TObject);
    procedure btnFiltroClick(Sender: TObject);
    procedure dbgDadosTitleClick(Column: TColumn);
    procedure editFiltroChange(Sender: TObject);
    procedure btnAdicionarClick(Sender: TObject);
    procedure btnEditarClick(Sender: TObject);
    procedure dbgDadosDblClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmClientesLista: TfrmClientesLista;
  campoFiltro: string;

implementation

{$R *.dfm}

   uses DataModLivraria, clienteModalDadosU, clienteDadosGeralU, ClienteFornecedor;

//carrega os dados ao mostrar o formul?rio
procedure TfrmClientesLista.FormShow(Sender: TObject);
begin

   adqClientes.Close;
   adqClientes.SQL.Clear;
   //adqClientes.SQL.Add('SELECT * FROM TBCLIFOR WHERE TIPO_CLI_FOR = '+QuotedStr('C')+' OR TIPO_CLI_FOR = '+QuotedStr('A'));
   adqClientes.SQL.Add('SELECT * FROM TBCLIFOR');
   adqClientes.Open;

   lbFiltro.Caption := dbgDados.Columns[0].Title.caption+': ';
   editFiltro.Clear;
   campoFiltro := dbgDados.Columns[0].FieldName;

   adqClientes.Filtered := false;

end;

//bot?o Adicionar
procedure TfrmClientesLista.btnAdicionarClick(Sender: TObject);
begin
   inherited;
   //formulario := TfrmClienteDados.Create(Application);
   //frmCliFor := TfrmCliFor.Create(Application);
   frmClienteDadosGeral := TfrmClienteDadosGeral.Create(Application);
   idRef := 0;
end;

//bot?o Editar
procedure TfrmClientesLista.btnEditarClick(Sender: TObject);
   var formulario : TForm;
begin
   inherited;
   {***chamando formul?rio MODAL
   frmModalClienteDados.editID.Text := dbgDados.Fields[0].Value; //usando dados do DBGrid
   frmModalClienteDados.editStatus.Text := dbgDados.DataSource.DataSet.FieldByName('STATUS').AsString; //usando dados do DataSource
   frmModalClienteDados.editNome.Text := dbgDados.DataSource.DataSet.FieldByName('NOME').AsString;
   frmModalClienteDados.ShowModal; }

   //***chamando formul?rio CHILD
   //idRef := dbgDados.Fields[0].Value; //usando dados do DBGrid
   idRef := dbgDados.DataSource.DataSet.FieldByName('ID').AsInteger; //usando dados do DataSource
   frmClienteDadosGeral := TfrmClienteDadosGeral.Create(Application);
end;

procedure TfrmClientesLista.btnExcluirClick(Sender: TObject);
   var iCod : integer;
begin
   //verifica se h? registros na tabela
   if dsModelo.DataSet.RecordCount = 0 then begin
      MessageBox(application.Handle, Pchar('N?o existem registros!'), Pchar('Falha ao excluir registro!'), MB_OK+MB_ICONERROR);
      exit;
   end;

   //confirma??o de exclus?o
   if MessageBox(application.Handle, Pchar('Deseja excluir este registro?'), Pchar('Confirmar Exclus?o'), MB_YESNO+MB_ICONQUESTION ) = ID_YES then begin
      iCod := dsModelo.DataSet.FieldByName('ID').AsInteger;

      adqClientes.Close;
      adqClientes.SQL.Clear;
      adqClientes.SQL.Add('SELECT ID FROM TBCLIFOR WHERE ID = :ID');
      //adqClientes.ParamByName('ID').AsString := editID.Text;
      //adqClientes.ParamByName('ID').AsInteger := dbgDados.DataSource.DataSet.FieldByName('ID').AsInteger;
      adqClientes.ParamByName('ID').AsInteger := iCod;
      adqClientes.Open;
      if not adqClientes.IsEmpty then begin
         try
            adqClientes.Close;
            adqClientes.SQL.Clear;
            adqClientes.SQL.Add('DELETE FROM TBCLIFOR WHERE ID = :ID');
            //adqClientes.ParamByName('ID').AsInteger := dbgDados.DataSource.DataSet.FieldByName('ID').AsInteger;
            //adqClientes.ParamByName('ID').AsInteger := dbgDados.DataSource.DataSet.FieldByName('ID').AsString;
            adqClientes.ParamByName('ID').AsInteger := iCod;
            adqClientes.ExecSQL;
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

procedure TfrmClientesLista.btnFiltroClick(Sender: TObject);
   var debug : string;
begin
   adqClientes.FilterOptions := [foCaseInsensitive];
   adqClientes.Filter := campoFiltro+' like '+QuotedStr('%'+editFiltro.Text+'%');

   {
   //if dsModelo.DataSet.FieldByName(campoFiltro) is TWideStringField then begin
   //if adqClientes.DataSource.DataSet.FieldByName(campoFiltro) is TWideStringField then begin
   if (dbgDados.Columns[dbgDados.SelectedIndex].Field.DataType = ftString) then begin
      //define a regra do filtro
      adqClientes.FilterOptions := [foCaseInsensitive];
      adqClientes.Filter := campoFiltro+' like '+QuotedStr('%'+editFiltro.Text+'%');
      //adqClientes.Filter := campoFiltro+' like '+ QuotedStr('*'+editFiltro.Text+'*');
      //adqClientes.Filter := campoFiltro+' like '+ QuotedStr(editFiltro.Text);
      //adqClientes.Filter := campoFiltro+' like '+editFiltro.Text;
      debug := adqClientes.Filter;
   end
   else begin
      //define a regra para campo num?ricos, datasw,
      //adqClientes.Filter := campoFiltro+' = '+editFiltro.Text;
      adqClientes.Filter := campoFiltro+' like '+QuotedStr('%'+editFiltro.Text+'%');
   end;
   }

   debug := adqClientes.Filter;
   //ativa o filtro
   adqClientes.Filtered := true;
end;

//duplo clique na linha do grid abre formul?rio com dados
procedure TfrmClientesLista.dbgDadosDblClick(Sender: TObject);
begin
   inherited;
   //***chamando formul?rio MODAL
   {
   frmModalClienteDados.editID.Text := dbgDados.Fields[0].Value; //usando dados do DBGrid
   frmModalClienteDados.editStatus.Text := dbgDados.DataSource.DataSet.FieldByName('STATUS').AsString; //usando dados do DataSource
   frmModalClienteDados.editNome.Text := dbgDados.DataSource.DataSet.FieldByName('NOME').AsString;
   frmModalClienteDados.ShowModal;
   }

   //***chamando formul?rio CHILD
   //idRef := dbgDados.Fields[0].Value; //usando dados do DBGrid
   //idRef := dbgDados.DataSource.DataSet.FieldByName('ID').AsInteger; //usando dados do DataSource
   idRef := dbgDados.Columns.Items[dbgDados.selectedindex].Field.AsInteger;
   frmClienteDadosGeral := TfrmClienteDadosGeral.Create(Application);
   //frmClientesLista.FormState :=
end;

procedure TfrmClientesLista.dbgDadosTitleClick(Column: TColumn);
begin
   lbFiltro.Caption := Column.Title.Caption+': ';
   editFiltro.Clear;
   campoFiltro := Column.FieldName;
   adqClientes.Filtered := false;
   editFiltro.SetFocus; //apresentar o cursor no campo de pesquisa ap?s clicar no t?tulo da coluna
end;

procedure TfrmClientesLista.editFiltroChange(Sender: TObject);
begin
   if length(editFiltro.Text) = 0 then begin
      btnFiltro.Enabled := false;
      adqClientes.Filtered := false;
   end
   else begin
      btnFiltro.Enabled := true;
      btnFiltroClick(Sender);
   end;
end;

procedure TfrmClientesLista.FormActivate(Sender: TObject);
begin
  inherited;
  //ShowMessage('Ativou form!');
  dsModelo.DataSet.Refresh;
end;

//fecha o formul?rio, query e sua inst?ncia na mem?ria
procedure TfrmClientesLista.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   inherited;
   adqClientes.Close;
end;



end.
