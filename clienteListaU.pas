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
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmClientesLista: TfrmClientesLista;

implementation

{$R *.dfm}

   uses DataModLivraria;

//carrega os dados ao mostrar o formulário

procedure TfrmClientesLista.FormShow(Sender: TObject);
begin
   adqClientes.Close;
   adqClientes.SQL.Clear;
   adqClientes.SQL.Add('SELECT * FROM TBCLIFOR');
   adqClientes.Open;
end;



end.
