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
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmFormaPagamentoLista: TfrmFormaPagamentoLista;

implementation

{$R *.dfm}

   uses DataModLivraria;

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
   //adqFormPgto := dbgDados.Columns[0].FieldName;

   adqFormPgto.Filtered := false;
end;

end.
