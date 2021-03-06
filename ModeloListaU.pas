unit ModeloListaU;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.Grids,
  Vcl.DBGrids, Vcl.Buttons, Data.DB;

type
  TfrmModeloLista = class(TForm)
    gbFiltro: TGroupBox;
    gbDados: TGroupBox;
    pnControle: TPanel;
    editFiltro: TEdit;
    lbFiltro: TLabel;
    btnFiltro: TBitBtn;
    dbgDados: TDBGrid;
    btnFechar: TBitBtn;
    btnExcluir: TBitBtn;
    btnAdicionar: TBitBtn;
    btnEditar: TBitBtn;
    dsModelo: TDataSource;
    //procedure FormClose(Sender: TObject; var Action: TCloseAction);
    //procedure FormShow(Sender: TObject);
    procedure btnFecharClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmModeloLista: TfrmModeloLista;

implementation

{$R *.dfm}

//encerra o formul?rio
procedure TfrmModeloLista.btnFecharClick(Sender: TObject);
begin
   Close;
end;

//fecha a conex?o com a tabela
{
procedure TfrmModeloLista.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   dsModelo.DataSet.Close;
   Action := caFree;
   self := nil;
end;
}

{
procedure TfrmModeloLista.FormShow(Sender: TObject);
begin
   //dsModelo.DataSet.Active := true; //uma das maneiras de ativar a tabela
   dsModelo.DataSet.Open; //esse m?todo ir? ativar e abrir a conex?o toda vez que o formul?rio ficar vis?vel
end;
}

procedure TfrmModeloLista.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   Action := caFree;
end;

procedure TfrmModeloLista.FormCreate(Sender: TObject);
begin
   KeyPreview:=true;
end;

procedure TfrmModeloLista.FormKeyPress(Sender: TObject; var Key: Char);
begin
   if key=#13 then begin
      SelectNext(ActiveControl as TWinControl,True,True);
      key:=#0;
   end;
end;

end.
