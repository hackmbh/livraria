unit FormaPagamento;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, uADStanIntf,
  uADStanOption, uADStanError, uADGUIxIntf, uADPhysIntf, uADStanDef,
  uADStanPool, uADStanAsync, uADPhysManager, uADStanParam, uADDatSManager,
  uADDAptIntf, uADDAptManager, uADGUIxFormsWait, Data.DB, uADCompGUIx,
  uADPhysODBCBase, uADPhysASA, Vcl.Grids, Vcl.DBGrids, uADCompDataSet,
  uADCompClient, ModeloDadosU, Vcl.Buttons;

type
  TfrmFormPagto = class(TfrmModeloDados)
    editDescricao: TLabeledEdit;
    ADQuery1: TADQuery;
    DataSource1: TDataSource;
    editID: TLabeledEdit;
    procedure editIDExit(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmFormPagto: TfrmFormPagto;
  idRef: Integer; // ID referencial

implementation

{$R *.dfm}

uses DataModLivraria;

procedure TfrmFormPagto.btnCancelarClick(Sender: TObject);
begin
  inherited;
   editID.Clear;
   editDescricao.Clear;
end;

//cadastra ou atualiza forma de pgto
procedure TfrmFormPagto.btnSalvarClick(Sender: TObject);
   var FIsEmpty : boolean;
begin
  inherited;
  if Length(trim(editDescricao.Text)) < 5 then //verifica qtde de carcteres do campo descri??o
      ShowMessage('Descri??o deve conter mais de 5 caracteres!')
   else begin
      ADQuery1.Close;
      ADQuery1.SQL.Clear;
      ADQuery1.SQL.Add('SELECT ID FROM TBFORM_PAGAMENTO WHERE ID = :ID');
      ADQuery1.ParamByName('ID').AsInteger := StrToIntDef(editID.Text, 0);
      ADQuery1.Open;
      FIsEmpty := ADQuery1.IsEmpty;
      ADQuery1.Close;
      ADQuery1.SQL.Clear;
      try
         DataModuleLivraria.adConnectionLivro.StartTransaction;
         if not FIsEmpty then begin
            ADQuery1.SQL.Add('UPDATE TBFORM_PAGAMENTO SET DESCRICAO = :DESCRICAO WHERE ID = :ID');
            ADQuery1.ParamByName('ID').AsInteger := StrToIntDef(editID.Text, 0);
         end
         else begin
            ADQuery1.SQL.Add('INSERT INTO TBFORM_PAGAMENTO (DESCRICAO) VALUES (:DESCRICAO)');
         end;
         ADQuery1.ParamByName('DESCRICAO').AsString := trim(editDescricao.Text);
         ADQuery1.ExecSQL;
         DataModuleLivraria.adConnectionLivro.Commit;
      finally
         if DataModuleLivraria.adConnectionLivro.InTransaction then
            DataModuleLivraria.adConnectionLivro.Rollback
         else begin
            ShowMessage('Opera??o realizada com sucesso!');
            frmFormPagto.Close;
         end;
      end;
   end;
end;

//deleta forma de pgto

{procedure TfrmFormPagto.Button3Click(Sender: TObject);
begin
   if trim(editID.Text) = '' then //verifica se o ID est? em branco
      ShowMessage('Informe o ID! Selecione o registro clicando no item da lista.')
   else begin
      ADQuery1.Close;
      ADQuery1.SQL.Clear;
      ADQuery1.SQL.Add('SELECT ID FROM TBFORM_PAGAMENTO WHERE ID = :ID');
      ADQuery1.ParamByName('ID').AsString := editID.Text;
      ADQuery1.Open;
      if not ADQuery1.IsEmpty then begin
         try
            DataModuleLivraria.adConnectionLivro.StartTransaction;
            ADQuery1.Close;
            ADQuery1.SQL.Clear;
            ADQuery1.SQL.Add('DELETE FROM TBFORM_PAGAMENTO WHERE ID = :ID');
            ADQuery1.ParamByName('ID').AsInteger := StrToIntDef(editID.Text, 0);
            ADQuery1.ExecSQL;
            DataModuleLivraria.adConnectionLivro.Commit;
         finally
            if DataModuleLivraria.adConnectionLivro.InTransaction then
               DataModuleLivraria.adConnectionLivro.Rollback
            else begin
               ShowMessage('Deletado com sucesso!');
               editID.Clear;
               editDescricao.Clear;
            end;
         end;
      end;
   end;
end;}


//atualiza forma de pgto
{
procedure TfrmFormPagto.Button4Click(Sender: TObject);
begin
   //if trim(LabeledEdit2.Text) = '' then //verifica se o ID est? em branco
   //   ShowMessage('Informe o ID! Selecione o registro clicando no item da lista.')
   //else if Length(trim(LabeledEdit1.Text)) < 5 then //verifica qtde de carcteres do campo descri??o
   //   ShowMessage('Descri??o deve conter mais de 5 caracteres!')
   if Length(trim(editDescricao.Text)) < 5 then //verifica qtde de carcteres do campo descri??o
      ShowMessage('Descri??o deve conter mais de 5 caracteres!')
   else begin
      ADQuery1.Close;
      ADQuery1.SQL.Clear;
      ADQuery1.SQL.Add('SELECT ID FROM TBFORM_PAGAMENTO WHERE ID = :ID');
      ADQuery1.ParamByName('ID').AsInteger := StrToIntDef(editID.Text, 0);
      ADQuery1.Open;
      if not ADQuery1.IsEmpty then begin
         try
            DataModuleLivraria.adConnectionLivro.StartTransaction;
            ADQuery1.Close;
            ADQuery1.SQL.Clear;
            ADQuery1.SQL.Add('UPDATE TBFORM_PAGAMENTO SET DESCRICAO = :DESCRICAO WHERE ID = :ID');
            ADQuery1.ParamByName('DESCRICAO').AsString := trim(editDescricao.Text);
            ADQuery1.ParamByName('ID').AsInteger := StrToIntDef(editID.Text, 0);
            ADQuery1.ExecSQL;
            DataModuleLivraria.adConnectionLivro.Commit;
         finally
            if DataModuleLivraria.adConnectionLivro.InTransaction then
               DataModuleLivraria.adConnectionLivro.Rollback
            else begin
               ShowMessage('Atualizado com sucesso!');
               Button5Click(Sender);
            end;
         end;
      end
      else begin
         try
            DataModuleLivraria.adConnectionLivro.StartTransaction;
            ADQuery1.Close;
            ADQuery1.SQL.Clear;
            ADQuery1.SQL.Add('INSERT INTO TBFORM_PAGAMENTO (DESCRICAO) VALUES (:DESCRICAO)');
            ADQuery1.ParamByName('DESCRICAO').AsString := trim(editDescricao.Text);
            ADQuery1.ExecSQL;
            DataModuleLivraria.adConnectionLivro.Commit;
            Button5Click(Sender);
         finally
            if DataModuleLivraria.adConnectionLivro.InTransaction then
               DataModuleLivraria.adConnectionLivro.Rollback
            else begin
               ShowMessage('Registro cadastrado com sucesso!');
               Button5Click(Sender);
            end;
         end;
      end;
   end;
end;
}

//pesquisa por todas as formas de pgto
{
procedure TfrmFormPagto.Button5Click(Sender: TObject);
begin
   ADQuery1.Close;
   ADQuery1.SQL.Clear;
   ADQuery1.SQL.Add('SELECT ID, DESCRICAO FROM TBFORM_PAGAMENTO');
   ADQuery1.Open;
end;
}

//ao clicar em um item da DBgrid apresenta o ID e a Descri??o nos campos edit
{
procedure TfrmFormPagto.DBGrid1CellClick(Column: TColumn);
begin
   LabeledEdit1.Text := DBGrid1.DataSource.DataSet.FieldByName('DESCRICAO').AsString;
   LabeledEdit2.Text := DBGrid1.DataSource.DataSet.FieldByName('ID').AsString;
end;
}

//ao mostrar o formul?rio carrega os dados na DB grid
procedure TfrmFormPagto.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   inherited;
   idRef := 0;
end;

procedure TfrmFormPagto.FormShow(Sender: TObject);
begin
   if idRef = 0 then begin
      ShowMessage('ID vazio - Acrescente nova Forma de Pagamento!');
   end
   else begin
      ADQuery1.Close;
      ADQuery1.SQL.Clear;
      ADQuery1.SQL.Add('SELECT * FROM TBFORM_PAGAMENTO WHERE ID = :ID');
      ADQuery1.ParamByName('ID').AsInteger := idRef;
      ADQuery1.Open;
      if ADQuery1.IsEmpty then begin
         ShowMessage('N?o existe Forma de Pagamento com o c?digo '+IntToStr(idRef)+'!');
         exit;
      end;
      editID.Text := IntToStr(idRef);
      editDescricao.Text := ADQuery1.FieldByName('DESCRICAO').AsString;
   end;
end;

//pesquisa pela forma de pgto ao prencher o id e sair do campo
procedure TfrmFormPagto.editIDExit(Sender: TObject);
begin
   if editID.Text <> '' then begin
      ADQuery1.Close;
      ADQuery1.SQL.Clear;
      ADQuery1.SQL.Add('SELECT DESCRICAO FROM TBFORM_PAGAMENTO WHERE ID = :ID');
      ADQuery1.ParamByName('ID').AsString := editID.Text;
      ADQuery1.Open;
      if ADQuery1.IsEmpty then begin
         ShowMessage('N?o existe forma de pagamento com este c?digo!');
         exit;
      end;
      editDescricao.Text := ADQuery1.FieldByName('DESCRICAO').AsString;
   end;
end;

end.
