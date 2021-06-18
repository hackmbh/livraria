unit clienteModalDadosU;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TfrmModalClienteDados = class(TForm)
    editID: TEdit;
    editNome: TEdit;
    editStatus: TEdit;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmModalClienteDados: TfrmModalClienteDados;

implementation

{$R *.dfm}

end.
