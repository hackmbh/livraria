unit clienteDadosGeralU;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, ModeloDadosU, Data.DB, Vcl.StdCtrls,
  Vcl.Buttons, Vcl.ExtCtrls, uADStanIntf, uADStanOption, uADStanParam,
  uADStanError, uADDatSManager, uADPhysIntf, uADDAptIntf, uADStanAsync,
  uADDAptManager, uADCompDataSet, uADCompClient;

type
  TfrmClienteDadosGeral = class(TfrmModeloDados)
    editID: TEdit;
    editNome: TEdit;
    adqClientes: TADQuery;
    editStatus: TEdit;
    editCPFCNPJ: TEdit;
    editEndereco: TEdit;
    editTelefone: TEdit;
    editCEP: TEdit;
    editSexo: TEdit;
    editDataNasc: TEdit;
    editProfissao: TEdit;
    editEstadoCivil: TEdit;
    editTipoPessoa: TEdit;
    editCliFor: TEdit;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmClienteDadosGeral: TfrmClienteDadosGeral;
  idRef: Integer; // ID referencial

implementation

{$R *.dfm}

   uses DataModLivraria;

procedure TfrmClienteDadosGeral.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
   //adqClientes.Close;
   Action := caFree;
   self := nil;
end;

procedure TfrmClienteDadosGeral.FormShow(Sender: TObject);
begin
  inherited;
  //ShowMessage(IntToStr(idRef));
  adqClientes.Close;
  adqClientes.SQL.Clear;
  adqClientes.SQL.Add('SELECT * FROM TBCLIFOR WHERE ID = :ID');
  adqClientes.ParamByName('ID').AsInteger := idRef;
  adqClientes.Open;
  if adqClientes.IsEmpty then begin
      ShowMessage('Não existe cliente com o código '+IntToStr(idRef)+'!');
      exit;
  end;
  editID.Text := IntToStr(idRef);
  editStatus.Text := adqClientes.FieldByName('STATUS').AsString;
  editNome.Text := adqClientes.FieldByName('NOME').AsString;
  editCPFCNPJ.Text := adqClientes.FieldByName('CPF_CNPJ').AsString;
  editEndereco.Text := adqClientes.FieldByName('ENDERECO').AsString;
  editTelefone.Text := adqClientes.FieldByName('TELEFONE').AsString;
  editCEP.Text := adqClientes.FieldByName('CEP').AsString;
  editSexo.Text := adqClientes.FieldByName('SEXO').AsString;
  editDataNasc.Text := adqClientes.FieldByName('DATA_NASC').AsString;
  editProfissao.Text := adqClientes.FieldByName('PROFISSAO').AsString;
  editEstadoCivil.Text := adqClientes.FieldByName('ESTADO_CIVIL').AsString;
  editTipoPessoa.Text := adqClientes.FieldByName('TIPO_PESSOA').AsString;
  editCliFor.Text := adqClientes.FieldByName('TIPO_CLI_FOR').AsString;

end;

end.
