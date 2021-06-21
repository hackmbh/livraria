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
    editCPFCNPJ: TEdit;
    editEndereco: TEdit;
    editTelefone: TEdit;
    editCEP: TEdit;
    editDataNasc: TEdit;
    editProfissao: TEdit;
    editTipoPessoa: TEdit;
    lbCodigo: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    cbStatus: TComboBox;
    cbSexo: TComboBox;
    cbTipoCliente: TComboBox;
    cbEstadoCivil: TComboBox;
    rgPessoa: TRadioGroup;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmClienteDadosGeral: TfrmClienteDadosGeral;
  idRef: Integer; // ID referencial
  cbSexoItem : string;
  cbTipoClienteItem : string;
  cbEstadoCivilItem : string;

implementation

{$R *.dfm}

   uses DataModLivraria, clienteListaU;

procedure TfrmClienteDadosGeral.btnSalvarClick(Sender: TObject);
   var cbIndice : integer;
begin
   inherited;
   //Se o idRef = 0 Cadastrar usuar�o
   if idRef = 0 then begin
      //1-realiza o cadastro
      //2-confirma o cadastro com mensagem
      //3-fecha o form
      //4-atualiza o form clienteListaU
      if editID.Text <> '' then begin
         ShowMessage('O campo ID deve estar em branco para realizar um novo cadastro!');
         exit;
      end;
      if editNome.Text <> '' then begin
         //prepara combo sexo
         if cbSexo.ItemIndex = 0 then
            cbSexo.Text := 'F'
         else begin
            cbSexo.Text := 'M';
         end;

         //prepara combobox TipoCliente
         if cbTipoCliente.ItemIndex = 0 then
            cbTipoClienteItem := 'C'
         else if cbTipoCliente.ItemIndex = 1 then
            cbTipoClienteItem := 'F'
         else
            cbTipoClienteItem := 'A';

         adqClientes.Close;
         adqClientes.SQL.Clear;
         adqClientes.SQL.Add('INSERT INTO TBCLIFOR (NOME, CPF_CNPJ, ENDERECO, TELEFONE, CEP, SEXO, DATA_NASC, PROFISSAO, ESTADO_CIVIL, STATUS, TIPO_PESSOA, TIPO_CLI_FOR, ID_USUARIO)');
         adqClientes.SQL.Add(' VALUES (:NOME, :CPF_CNPJ, :ENDERECO, :TELEFONE, :CEP, :SEXO, :DATA_NASC, :PROFISSAO, :ESTADO_CIVIL, :STATUS, :TIPO_PESSOA, :TIPO_CLI_FOR, :ID_USUARIO)');
         adqClientes.ParamByName('NOME').AsString := editNome.Text;
         adqClientes.ParamByName('CPF_CNPJ').AsString := editCpfCnpj.Text;
         adqClientes.ParamByName('ENDERECO').AsString := editEndereco.Text;
         adqClientes.ParamByName('TELEFONE').AsString := editTelefone.Text;
         adqClientes.ParamByName('CEP').AsString := editCep.Text;
         adqClientes.ParamByName('SEXO').AsString := cbSexo.Text;
         adqClientes.ParamByName('DATA_NASC').AsString := editDataNasc.Text;
         adqClientes.ParamByName('PROFISSAO').AsString := editProfissao.Text;
         //adqClientes.ParamByName('ESTADO_CIVIL').AsString := editEstadoCivil.Text;
         adqClientes.ParamByName('STATUS').AsInteger := cbStatus.ItemIndex;
         adqClientes.ParamByName('TIPO_PESSOA').AsInteger := StrToIntDef(editTipoPessoa.Text, 0);
         adqClientes.ParamByName('TIPO_CLI_FOR').AsString := cbTipoClienteItem;
         adqClientes.ParamByName('ID_USUARIO').AsInteger := 1;
         //realiza o cadastro
         adqClientes.ExecSQL;
         //2-confirma o cadastro com mensagem
         ShowMessage('Usu�rio '+editNome.Text+' cadastrado com sucesso!');
         //3-fecha o form
         PostMessage(frmClienteDadosGeral.Handle, WM_CLOSE, 0, 0);
         //4-atualiza o form clienteListaU
         //frmClientesLista.FormShow(Sender);
         frmClientesLista.adqClientes.Refresh;
         frmClientesLista.dbgDados.Refresh;
      end;
      ShowMessage('Usu�rio '+editNome.Text+' cadastrado com sucesso!');
      PostMessage(frmClienteDadosGeral.Handle, WM_CLOSE, 0, 0);
      //PostMessage(frmClientesLista.Refresh, WM_SETFOCUS, 0, 0);
      //frmClientesLista.FormShow(frmClientesLista);
      //frmClientesLista.adqClientes.Refresh;
      //frmClientesLista.dbgDados.Refresh;
   end
   //Se o idRef <> '' Atualizar o usu�rio do ID referencial
   else begin
      //lkjl
      if editID.Text <> '' then begin //verifica id e descri��o se est�o vazios
         adqClientes.Close;
         adqClientes.SQL.Clear;
         adqClientes.SQL.Add('SELECT ID FROM TBCLIFOR WHERE ID = :ID');
         adqClientes.ParamByName('ID').AsString := editID.Text;
         adqClientes.Open;
         if not adqClientes.IsEmpty then begin
            try
               //prepara combobox sexo
               if cbSexo.ItemIndex = 0 then
                  cbSexoItem := 'F'
               else begin
                  cbSexoItem := 'M';
               end;

               //prepara combobox TipoCliente
               if cbTipoCliente.ItemIndex = 0 then
                  cbTipoClienteItem := 'C'
               else if cbTipoCliente.ItemIndex = 1 then
                  cbTipoClienteItem := 'F'
               else
                  cbTipoClienteItem := 'A';

               //prepara combobox EstadoCivil
               if cbEstadoCivil.ItemIndex = 0 then
                  cbEstadoCivilItem := 'S'
               else if cbEstadoCivil.ItemIndex = 1 then
                  cbEstadoCivilItem := 'C'
               else if cbEstadoCivil.ItemIndex = 2 then
                  cbEstadoCivilItem := 'V'
               else if cbEstadoCivil.ItemIndex = 3 then
                  cbEstadoCivilItem := 'D'
               else
                  cbEstadoCivilItem := '';


              { if cbEstadoCivilItem = 'S' then //se S = SOLTEIRO e index 0
                  cbEstadoCivil.ItemIndex := 0
               else if cbTipoClienteItem = 'C' then //se C = CASADO e o index 1
                  cbEstadoCivil.ItemIndex := 1
               else if cbTipoClienteItem = 'V' then //se V = VI�VO e o index 2
                  cbEstadoCivil.ItemIndex := 2
               else if cbTipoClienteItem = 'D' then //se D = DIVORCIADO e o index 3
                  cbEstadoCivil.ItemIndex := 3
               else //se em branco PJ
                  cbEstadoCivil.ItemIndex := 4;  }

               adqClientes.Close;
               adqClientes.SQL.Clear;
               adqClientes.SQL.Add('UPDATE TBCLIFOR SET NOME = :NOME, CPF_CNPJ = :CPF_CNPJ, ENDERECO = :ENDERECO, TELEFONE = :TELEFONE, CEP = :CEP, SEXO = :SEXO,');
               adqClientes.SQL.Add(' DATA_NASC = :DATA_NASC, PROFISSAO = :PROFISSAO, ESTADO_CIVIL = :ESTADO_CIVIL, STATUS = :STATUS, TIPO_PESSOA = :TIPO_PESSOA, TIPO_CLI_FOR = :TIPO_CLI_FOR WHERE ID = :ID');
               adqClientes.ParamByName('NOME').AsString := editNome.Text;
               adqClientes.ParamByName('CPF_CNPJ').AsString := editCpfCnpj.Text;
               adqClientes.ParamByName('ENDERECO').AsString := editEndereco.Text;
               adqClientes.ParamByName('TELEFONE').AsString := editTelefone.Text;
               adqClientes.ParamByName('CEP').AsString := editCep.Text;
               adqClientes.ParamByName('SEXO').AsString := cbSexoItem;
               adqClientes.ParamByName('DATA_NASC').AsString := FormatDateTime('yyyy/mm/dd', StrToDateDef(editDataNasc.Text, 0));
               adqClientes.ParamByName('PROFISSAO').AsString := editProfissao.Text;
               adqClientes.ParamByName('ESTADO_CIVIL').AsString := cbEstadoCivilItem;
               adqClientes.ParamByName('STATUS').AsInteger := cbStatus.ItemIndex;
               adqClientes.ParamByName('TIPO_PESSOA').AsInteger := StrToIntDef(editTipoPessoa.Text, 0);
               adqClientes.ParamByName('TIPO_CLI_FOR').AsString := cbTipoClienteItem;
               //adqClientes.ParamByName('ID_USUARIO').AsInteger := 1;
               adqClientes.ParamByName('ID').AsString := editID.Text;
               adqClientes.ExecSQL;
            finally
               //btnListarClick(Sender);
               ShowMessage('Atualizado com sucesso!');
            end;
         end;
      end;
   end;

end;

procedure TfrmClienteDadosGeral.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
   //adqClientes.Close;
   //frmClientesLista.FormShow(frmClientesLista);
   //frmClientesLista.OnShow(frmClientesLista);
   //frmClientesLista.adqClientes.Refresh;
   //frmClientesLista.dbgDados.Refresh;
   Action := caFree;
   idRef := 0;
   self := nil;
end;

procedure TfrmClienteDadosGeral.FormShow(Sender: TObject);
   var cbIndice : integer;
   var cbItem : string;
begin
  inherited;
  //ShowMessage(IntToStr(idRef));
  if idRef = 0 then begin
      ShowMessage('ID vazio - Acrescente novo usu�rio!');
      //desativa o campo c�digo, pois o mesmo � inserido de forma autoincremento
      editID.Text := '';
      editID.Enabled := false;
      lbCodigo.Enabled := false;
      //editStatus.Text := '';
      editNome.Text := '';
      editCPFCNPJ.Text := '';
      editEndereco.Text := '';
      editTelefone.Text := '';
      editCEP.Text := '';
      //editSexo.Text := '';
      editDataNasc.Text := '';
      editProfissao.Text := '';
      //editEstadoCivil.Text := '';
      editTipoPessoa.Text := '';
      //editCliFor.Text := '';
  end
  else begin
      adqClientes.Close;
      adqClientes.SQL.Clear;
      adqClientes.SQL.Add('SELECT * FROM TBCLIFOR WHERE ID = :ID');
      adqClientes.ParamByName('ID').AsInteger := idRef;
      adqClientes.Open;
      if adqClientes.IsEmpty then begin
          ShowMessage('N�o existe cliente com o c�digo '+IntToStr(idRef)+'!');
          exit;
      end;

      //prepara comboBox Status
      //cbIndice := adqClientes.FieldByName('STATUS').AsInteger;
      {
      //se o id do bd for 0 = status INATIVO
      if cbIndice = 0 then
         cbStatus.Text := 'Inativo'
      else begin
      //se o id do bd for 1 = status ATIVO
         cbStatus.Text := 'Ativo';
      end;  }

      //prepara comboBox Sexo
      cbSexoItem := adqClientes.FieldByName('SEXO').AsString;
      //se F = status FEMININO e index 0
      if cbSexoItem = 'F' then
         cbSexo.ItemIndex := 0
      else begin
      //se M = status MASCULINO e o index 1
         cbSexo.ItemIndex := 1;
      end;

      //prepara comboBox TipoCliente
      cbTipoClienteItem := adqClientes.FieldByName('TIPO_CLI_FOR').AsString;
      if cbTipoClienteItem = 'C' then //se C = tipo CLIENTE e index 0
         cbTipoCliente.ItemIndex := 0
      else if cbTipoClienteItem = 'F' then //se F = tipo FORNECEDOR e o index 1
         cbTipoCliente.ItemIndex := 1
      else //se A = tipo AMBOS e o index 2
         cbTipoCliente.ItemIndex := 2;

      //prepara comboBox EstadoCivil
      cbEstadoCivilItem := adqClientes.FieldByName('ESTADO_CIVIL').AsString;
      if cbEstadoCivilItem = 'S' then //se S = SOLTEIRO e index 0
         cbEstadoCivil.ItemIndex := 0
      else if cbEstadoCivilItem = 'C' then //se C = CASADO e o index 1
         cbEstadoCivil.ItemIndex := 1
      else if cbEstadoCivilItem = 'V' then //se V = VI�VO e o index 2
         cbEstadoCivil.ItemIndex := 2
      else if cbEstadoCivilItem = 'D' then //se D = DIVORCIADO e o index 3
         cbEstadoCivil.ItemIndex := 3
      else //se em branco PJ
         cbEstadoCivil.ItemIndex := 4;

      editID.Text := IntToStr(idRef);
      cbStatus.ItemIndex := adqClientes.FieldByName('STATUS').AsInteger;
      editNome.Text := adqClientes.FieldByName('NOME').AsString;
      editCPFCNPJ.Text := adqClientes.FieldByName('CPF_CNPJ').AsString;
      editEndereco.Text := adqClientes.FieldByName('ENDERECO').AsString;
      editTelefone.Text := adqClientes.FieldByName('TELEFONE').AsString;
      editCEP.Text := adqClientes.FieldByName('CEP').AsString;
      //editSexo.Text := adqClientes.FieldByName('SEXO').AsString;
      //cbSexo.ItemIndex := adqClientes.FieldByName('STATUS').AsInteger;
      editDataNasc.Text := adqClientes.FieldByName('DATA_NASC').AsString;
      editProfissao.Text := adqClientes.FieldByName('PROFISSAO').AsString;
      //editEstadoCivil.Text := adqClientes.FieldByName('ESTADO_CIVIL').AsString;
      editTipoPessoa.Text := adqClientes.FieldByName('TIPO_PESSOA').AsString;
      //editCliFor.Text := adqClientes.FieldByName('TIPO_CLI_FOR').AsString;
  end;

end;

end.
