unit formaPagamentoListaU;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, ModeloListaU, Data.DB, Vcl.ExtCtrls,
  Vcl.Grids, Vcl.DBGrids, Vcl.StdCtrls, Vcl.Buttons;

type
  TfrmFormaPagamentoLista = class(TfrmModeloLista)
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmFormaPagamentoLista: TfrmFormaPagamentoLista;

implementation

{$R *.dfm}

end.