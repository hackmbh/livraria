unit clientePesquisaU;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Grids, Vcl.DBGrids, Vcl.StdCtrls,
  uADStanIntf, uADStanOption, uADStanParam, uADStanError, uADDatSManager,
  uADPhysIntf, uADDAptIntf, uADStanAsync, uADDAptManager, Data.DB,
  uADCompDataSet, uADCompClient, StrUtils;

type
  TfrmPesquisa = class(TForm)
    dsPesquisa: TDataSource;
    adqPesquisa: TADQuery;
    gbDados: TGroupBox;
    gbFiltro: TGroupBox;
    dbgPesquisa: TDBGrid;
    editFiltro: TEdit;
    lbFiltro: TLabel;
    procedure FormShow(Sender: TObject);
    procedure editFiltroChange(Sender: TObject);
    procedure dbgPesquisaDblClick(Sender: TObject);
    procedure dbgPesquisaTitleClick(Column: TColumn);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPesquisa: TfrmPesquisa;
  campoFiltro: string;

implementation

{$R *.dfm}

   uses DataModLivraria, clienteDadosGeralU, pesquisaCodDesc;

procedure TfrmPesquisa.dbgPesquisaDblClick(Sender: TObject);
begin
   frmPesquisa.Close;
   //frmClienteDadosGeral.editID.Text := dbgPesquisa.Fields[0].Value;
   idRef := dbgPesquisa.Fields[0].Value;
   frmClienteDadosGeral.FormShow(Sender);
end;

procedure TfrmPesquisa.dbgPesquisaTitleClick(Column: TColumn);
begin
   lbFiltro.Caption := Column.Title.Caption+': ';
   editFiltro.Clear;
   campoFiltro := Column.FieldName;
   adqPesquisa.Filtered := false;
   editFiltro.SetFocus; //apresentar o cursor no campo de pesquisa ap?s clicar no t?tulo da coluna
end;

procedure TfrmPesquisa.editFiltroChange(Sender: TObject);
   var debug : string;
begin
   adqPesquisa.FilterOptions := [foCaseInsensitive];
   if campoFiltro <> '' then
      adqPesquisa.Filter := campoFiltro+' like '+QuotedStr('%'+editFiltro.Text+'%')
   else
      adqPesquisa.Filter := 'ID like '+QuotedStr('%'+editFiltro.Text+'%');

   debug := adqPesquisa.Filter;

   adqPesquisa.Filtered := true;
end;

procedure TfrmPesquisa.FormShow(Sender: TObject );
begin

//   if callBackAction = 'nacionalidade' then begin
//      ShowMessage('Informar cidade')
//   end;

   {
   case AnsiIndexStr(callBackAction, ['cidade', 'nacionalidade']) of
     0 : ShowMessage('Informar cidade');
     1 : ShowMessage('Informar nacionalidade');
   end;
}

   {
   case AnsiIndexStr(callBackAction, ['cidade', 'nacionalidade']) of
      0: begin
         ShowMessage('Informar cidade');
         adqPesquisa.Close;
         adqPesquisa.SQL.Clear;
         //adqClientes.SQL.Add('SELECT * FROM TBCLIFOR WHERE TIPO_CLI_FOR = '+QuotedStr('C')+' OR TIPO_CLI_FOR = '+QuotedStr('A'));
         adqPesquisa.SQL.Add('SELECT * FROM TBCIDADE');
         adqPesquisa.Open;
         //editFiltro.SetFocus;

         lbFiltro.Caption := dbgPesquisa.Columns[0].Title.caption+': ';
         editFiltro.Clear;
         campoFiltro := dbgPesquisa.Columns[0].FieldName;

         adqPesquisa.Filtered := false;
      end;
      1: begin
         ShowMessage('Informar nacionalidade');
      end;
   end;

   }

      {
   adqPesquisa.Close;
   adqPesquisa.SQL.Clear;
   //adqClientes.SQL.Add('SELECT * FROM TBCLIFOR WHERE TIPO_CLI_FOR = '+QuotedStr('C')+' OR TIPO_CLI_FOR = '+QuotedStr('A'));
   adqPesquisa.SQL.Add('SELECT * FROM TBCLIFOR');
   adqPesquisa.Open;
   //editFiltro.SetFocus;

   lbFiltro.Caption := dbgPesquisa.Columns[0].Title.caption+': ';
   editFiltro.Clear;
   campoFiltro := dbgPesquisa.Columns[0].FieldName;

   adqPesquisa.Filtered := false;
   }

end;

end.
