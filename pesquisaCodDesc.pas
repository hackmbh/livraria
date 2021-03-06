unit pesquisaCodDesc;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Grids, Vcl.DBGrids,
  uADStanIntf, uADStanOption, uADStanParam, uADStanError, uADDatSManager,
  uADPhysIntf, uADDAptIntf, uADStanAsync, uADDAptManager, Data.DB,
  uADCompDataSet, uADCompClient, Datasnap.DBClient, Datasnap.Provider;

type
  TfrmPCodDesc = class(TForm)
    gbDados: TGroupBox;
    gbFiltro: TGroupBox;
    dbgPesquisa: TDBGrid;
    editFiltro: TEdit;
    lbFiltro: TLabel;
    dsPesquisa: TDataSource;
    adqPesquisaCodDesc: TADQuery;
    cdPesquisa: TClientDataSet;
    dsProvider: TDataSetProvider;
    procedure FormShow(Sender: TObject);
    procedure dbgPesquisaTitleClick(Column: TColumn);
    procedure editFiltroChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPCodDesc: TfrmPCodDesc;
  campoFiltro: string;
  callBackAction, callBackActionSQL:String;


implementation

{$R *.dfm}

   uses DataModLivraria;

procedure TfrmPCodDesc.dbgPesquisaTitleClick(Column: TColumn);
begin
   lbFiltro.Caption := Column.Title.Caption+': ';
   editFiltro.Clear;
   campoFiltro := Column.FieldName;
   cdPesquisa.Filtered := false;
   editFiltro.SetFocus; //apresentar o cursor no campo de pesquisa ap?s clicar no t?tulo da coluna
end;

procedure TfrmPCodDesc.editFiltroChange(Sender: TObject);
   var debug : string;
   var idPost : string;
   var validaInteiro : integer;
begin
   cdPesquisa.FilterOptions := [foCaseInsensitive];
   if (campoFiltro <> '') or (editFiltro.Text <> '') then begin
      //if campoFiltro <> '' then //se ele clicoou temos nova coluna para pesquisar
      //cdPesquisa.Filter := campoFiltro+' like '+QuotedStr('%'+editFiltro.Text+'%');

      if editFiltro.Text <> '' then //se ele digitou algo no campo deve utilizar essa informa??o na query
         if campoFiltro <> '' then begin
            validaInteiro := StrToIntDef(editFiltro.Text, -1);

            // Se validaInteiro for igual a -1 ? texto, se n?o ? um valor inteiro
            if validaInteiro = -1 then
               cdPesquisa.Filter := campoFiltro+' like '+QuotedStr('%'+editFiltro.Text+'%')
            else
               cdPesquisa.Filter := 'ID = '+editFiltro.Text;
            cdPesquisa.Filtered := true;
         end
         else begin
            //cdPesquisa.Filter := 'ID like '+QuotedStr('%'+editFiltro.Text+'%');
            //cdPesquisa.Filter := 'ID like '+editFiltro.Text;
            cdPesquisa.Filtered := false;
         end;


   end
   else if editFiltro.Text = '' then
      cdPesquisa.Filtered := false;


   debug := cdPesquisa.Filter;


   //cdPesquisa.Filtered := (cdPesquisa.Filter <> '');
end;

procedure TfrmPCodDesc.FormShow(Sender: TObject);
begin
   {
   if callBackAction = 'nacionalidade' then begin
      ShowMessage('Informar cidade')
   end;
   }

   if callBackAction <> '' then begin
      ShowMessage(callBackAction)
   end;

   adqPesquisaCodDesc.Close;
   adqPesquisaCodDesc.SQL.Clear;
   //adqClientes.SQL.Add('SELECT * FROM TBCLIFOR WHERE TIPO_CLI_FOR = '+QuotedStr('C')+' OR TIPO_CLI_FOR = '+QuotedStr('A'));
   adqPesquisaCodDesc.SQL.Add(callBackActionSQL);
   cdPesquisa.open();
   //adqPesquisaCodDesc.Open;
   //editFiltro.SetFocus;

   lbFiltro.Caption := dbgPesquisa.Columns[0].Title.caption+': ';
   editFiltro.Clear;
   campoFiltro := dbgPesquisa.Columns[0].FieldName;

   cdPesquisa.Filtered := false;

end;

end.
