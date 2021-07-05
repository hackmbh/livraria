unit ModeloDadosU;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.StdCtrls, Vcl.Buttons,
  Vcl.ExtCtrls;

type
  TfrmModeloDados = class(TForm)
    gbDados: TGroupBox;
    pnControle: TPanel;
    btnFechar: TBitBtn;
    btnCancelar: TBitBtn;
    btnSalvar: TBitBtn;
    dsModelo: TDataSource;
    procedure btnFecharClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmModeloDados: TfrmModeloDados;

implementation

{$R *.dfm}

procedure TfrmModeloDados.btnFecharClick(Sender: TObject);
begin
   Close;
end;

procedure TfrmModeloDados.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   Action := caFree;
   self := nil;
end;

procedure TfrmModeloDados.FormKeyPress(Sender: TObject; var Key: Char);
begin
   if key=#13 then begin
      SelectNext(ActiveControl as TWinControl,True,True);
      key:=#0;
   end;
end;

end.
