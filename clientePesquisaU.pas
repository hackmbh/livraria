unit clientePesquisaU;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Grids, Vcl.DBGrids, Vcl.StdCtrls,
  uADStanIntf, uADStanOption, uADStanParam, uADStanError, uADDatSManager,
  uADPhysIntf, uADDAptIntf, uADStanAsync, uADDAptManager, Data.DB,
  uADCompDataSet, uADCompClient;

type
  TfrmPesquisa = class(TForm)
    editFiltro: TEdit;
    dbgPesquisa: TDBGrid;
    dsPesquisa: TDataSource;
    adqPesquisa: TADQuery;
    procedure FormShow(Sender: TObject);
    procedure editFiltroChange(Sender: TObject);
    procedure dbgPesquisaDblClick(Sender: TObject);
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

   uses DataModLivraria, clienteDadosGeralU;

procedure TfrmPesquisa.dbgPesquisaDblClick(Sender: TObject);
begin
   frmPesquisa.Close;
   //frmClienteDadosGeral.editID.Text := dbgPesquisa.Fields[0].Value;
   idRef := dbgPesquisa.Fields[0].Value;
   frmClienteDadosGeral.FormShow(Sender);
end;

procedure TfrmPesquisa.editFiltroChange(Sender: TObject);
   var debug : string;
begin
   campoFiltro := dbgPesquisa.Columns[1].FieldName;
   adqPesquisa.FilterOptions := [foCaseInsensitive];
   adqPesquisa.Filter := campoFiltro+' like '+QuotedStr('%'+editFiltro.Text+'%');

   debug := adqPesquisa.Filter;

   adqPesquisa.Filtered := true;
end;

procedure TfrmPesquisa.FormShow(Sender: TObject);
begin
   adqPesquisa.Close;
   adqPesquisa.SQL.Clear;
   //adqClientes.SQL.Add('SELECT * FROM TBCLIFOR WHERE TIPO_CLI_FOR = '+QuotedStr('C')+' OR TIPO_CLI_FOR = '+QuotedStr('A'));
   adqPesquisa.SQL.Add('SELECT * FROM TBCLIFOR');
   adqPesquisa.Open;

   {
   lbFiltro.Caption := dbgDados.Columns[0].Title.caption+': ';
   editFiltro.Clear;
   campoFiltro := dbgDados.Columns[0].FieldName; }

   adqPesquisa.Filtered := false;
end;

end.