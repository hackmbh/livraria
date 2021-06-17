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
   self.Close;
end;

end.
