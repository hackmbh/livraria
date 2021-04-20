unit ClienteFornecedor;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, uADStanIntf,
  uADStanOption, uADStanParam, uADStanError, uADDatSManager, uADPhysIntf,
  uADDAptIntf, uADStanAsync, uADDAptManager, Data.DB, uADCompDataSet,
  uADCompClient, Vcl.Grids, Vcl.DBGrids;

type
  TfrmCliFor = class(TForm)
    editNomeRazao: TLabeledEdit;
    editCpfCnpj: TLabeledEdit;
    editEndereco: TLabeledEdit;
    editTelefone: TLabeledEdit;
    editCep: TLabeledEdit;
    editDataNasc: TLabeledEdit;
    editProfissao: TLabeledEdit;
    comboStatus: TComboBox;
    radioTipoPessoa: TRadioGroup;
    comboEstadoCivil: TComboBox;
    Label1: TLabel;
    Label2: TLabel;
    btnSalvar: TButton;
    btnAtualizar: TButton;
    btnExcluir: TButton;
    btnCancelar: TButton;
    dbGridCliFor: TDBGrid;
    btnListar: TButton;
    ADQuery1: TADQuery;
    DataSource1: TDataSource;
    editID: TLabeledEdit;
    comboTipoCliFor: TComboBox;
    Label3: TLabel;
    comboGenero: TComboBox;
    Label4: TLabel;
    procedure FormShow(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure btnListarClick(Sender: TObject);
    procedure btnAtualizarClick(Sender: TObject);
    procedure dbGridCliForCellClick(Column: TColumn);
    procedure FormCreate(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    //procedure dbGridCliForCellClick(Column: TColumn);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCliFor: TfrmCliFor;

implementation

{$R *.dfm}


//atualiza cliente e fornecedores
procedure TfrmCliFor.btnAtualizarClick(Sender: TObject);
begin
   if editID.Text <> '' then begin //verifica id e descrição se estão vazios
      ADQuery1.Close;
      ADQuery1.SQL.Clear;
      ADQuery1.SQL.Add('SELECT ID FROM TBCLIFOR WHERE ID = :ID');
      ADQuery1.ParamByName('ID').AsString := editID.Text;
      ADQuery1.Open;
      if not ADQuery1.IsEmpty then begin
         try
            ADQuery1.Close;
            ADQuery1.SQL.Clear;
            ADQuery1.SQL.Add('UPDATE TBCLIFOR SET NOME = :NOME, CPF_CNPJ = :CPF_CNPJ, ENDERECO = :ENDERECO, TELEFONE = :TELEFONE, CEP = :CEP, SEXO = :SEXO,');
            ADQuery1.SQL.Add(' DATA_NASC = :DATA_NASC, PROFISSAO = :PROFISSAO, ESTADO_CIVIL = :ESTADO_CIVIL, STATUS = :STATUS, TIPO_PESSOA = :TIPO_PESSOA, TIPO_CLI_FOR = :TIPO_CLI_FOR WHERE ID = :ID');
            ADQuery1.ParamByName('NOME').AsString := editNomeRazao.Text;
            ADQuery1.ParamByName('CPF_CNPJ').AsString := editCpfCnpj.Text;
            ADQuery1.ParamByName('ENDERECO').AsString := editEndereco.Text;
            ADQuery1.ParamByName('TELEFONE').AsString := editTelefone.Text;
            ADQuery1.ParamByName('CEP').AsString := editCep.Text;
            ADQuery1.ParamByName('SEXO').AsString := comboGenero.Text;
            ADQuery1.ParamByName('DATA_NASC').AsString := editDataNasc.Text;
            ADQuery1.ParamByName('PROFISSAO').AsString := editProfissao.Text;
            ADQuery1.ParamByName('ESTADO_CIVIL').AsString := comboEstadoCivil.Text;
            ADQuery1.ParamByName('STATUS').AsInteger := StrToIntDef(comboStatus.Text, 0);
            ADQuery1.ParamByName('TIPO_PESSOA').AsInteger := StrToIntDef(comboStatus.Text, 0);
            ADQuery1.ParamByName('TIPO_CLI_FOR').AsInteger := StrToIntDef(comboStatus.Text, 0);
            ADQuery1.ParamByName('STATUS').AsInteger := StrToIntDef(comboStatus.Text, 0);
            ADQuery1.ParamByName('ID').AsString := editID.Text;
            ADQuery1.ExecSQL;
         finally
            btnListarClick(Sender);
            ShowMessage('Atualizado com sucesso!');
         end;
      end;
   end;
end;

//lista usarios na dbgrid
procedure TfrmCliFor.btnListarClick(Sender: TObject);
begin
   ADQuery1.Close;
   ADQuery1.SQL.Clear;
   ADQuery1.SQL.Add('SELECT * FROM TBCLIFOR');
   ADQuery1.Open;
end;

//cadastro de clientes
procedure TfrmCliFor.btnSalvarClick(Sender: TObject);
begin
   if editID.Text <> '' then begin
      ShowMessage('O campo ID deve estar em branco para realizar um novo cadastro!');
      exit;
   end;
   if editNomeRazao.Text <> '' then begin
      ADQuery1.Close;
      ADQuery1.SQL.Clear;
      ADQuery1.SQL.Add('INSERT INTO TBCLIFOR (NOME, CPF_CNPJ, ENDERECO, TELEFONE, CEP, SEXO, DATA_NASC, PROFISSAO, ESTADO_CIVIL, STATUS, TIPO_PESSOA, TIPO_CLI_FOR)');
      ADQuery1.SQL.Add(' VALUES (:NOME, :CPF_CNPJ, :ENDERECO, :TELEFONE, :CEP, :SEXO, :DATA_NASC, :PROFISSAO, :ESTADO_CIVIL, :STATUS, :TIPO_PESSOA, :TIPO_CLI_FOR)');
      ADQuery1.ParamByName('NOME').AsString := editNomeRazao.Text;
      ADQuery1.ParamByName('CPF_CNPJ').AsString := editCpfCnpj.Text;
      ADQuery1.ParamByName('ENDERECO').AsString := editEndereco.Text;
      ADQuery1.ParamByName('TELEFONE').AsString := editTelefone.Text;
      ADQuery1.ParamByName('CEP').AsString := editCep.Text;
      ADQuery1.ParamByName('SEXO').AsString := comboGenero.Text;
      ADQuery1.ParamByName('DATA_NASC').AsString := editDataNasc.Text;
      ADQuery1.ParamByName('PROFISSAO').AsString := editProfissao.Text;
      ADQuery1.ParamByName('ESTADO_CIVIL').AsString := comboEstadoCivil.Text;
      ADQuery1.ParamByName('STATUS').AsInteger := StrToIntDef(comboStatus.Text, 0);
      ADQuery1.ParamByName('TIPO_PESSOA').AsInteger := StrToIntDef(comboStatus.Text, 0);
      ADQuery1.ParamByName('TIPO_CLI_FOR').AsInteger := StrToIntDef(comboTipoCliFor.Text, 0);
      ADQuery1.ParamByName('STATUS').AsInteger := StrToIntDef(comboStatus.Text, 0);
      ADQuery1.ExecSQL;
      btnListarClick(Sender);
   end;
end;

procedure TfrmCliFor.dbGridCliForCellClick(Column: TColumn);
begin

end;

{
procedure TfrmCliFor.dbGridCliForCellClick(Column: TColumn);
begin
   editID.Text := dbGridCliFor.DataSource.DataSet.FieldByName('ID').AsString;
   editNomeRazao.Text := dbGridCliFor.DataSource.DataSet.FieldByName('NOME').AsString;
   editCpfCnpj.Text := dbGridCliFor.DataSource.DataSet.FieldByName('CPF_CNPJ').AsString;
   editEndereco.Text := dbGridCliFor.DataSource.DataSet.FieldByName('ENDERECO').AsString;
   editTelefone.Text := dbGridCliFor.DataSource.DataSet.FieldByName('TELEFONE').AsString;
   editCep.Text := dbGridCliFor.DataSource.DataSet.FieldByName('CEP').AsString;
   comboGenero.Text := dbGridCliFor.DataSource.DataSet.FieldByName('SEXO').AsString;
   editDataNasc.Text := dbGridCliFor.DataSource.DataSet.FieldByName('DATA_NASC').AsString;
   editProfissao.Text := dbGridCliFor.DataSource.DataSet.FieldByName('PROFISSAO').AsString;
   comboEstadoCivil.Text := dbGridCliFor.DataSource.DataSet.FieldByName('ESTADO_CIVIL').AsString;
   comboStatus.Text := dbGridCliFor.DataSource.DataSet.FieldByName('STATUS').AsString;
   radioTipoPessoa.Text := dbGridCliFor.DataSource.DataSet.FieldByName('TIPO_PESSOA').AsString;
   comboTipoCliFor.Text := dbGridCliFor.DataSource.DataSet.FieldByName('TIPO_PESSOA').AsString;
end;
}


//carrega os dados ao mostrar o formulário
procedure TfrmCliFor.FormShow(Sender: TObject);
begin
   ADQuery1.Close;
   ADQuery1.SQL.Clear;
   ADQuery1.SQL.Add('SELECT * FROM TBCLIFOR');
   ADQuery1.Open;
end;

procedure TfrmCliFor.FormCreate(Sender: TObject);
begin
   KeyPreview:=true;
end;

procedure TfrmCliFor.FormKeyPress(Sender: TObject; var Key: Char);
begin
   if key=#13 then begin
      SelectNext(ActiveControl as TWinControl,True,True);
      key:=#0;
   end;
end;

end.
