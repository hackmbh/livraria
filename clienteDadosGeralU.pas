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
    editNome: TEdit;
    adqClientes: TADQuery;
    editCPF: TEdit;
    editEndereco: TEdit;
    editTelefone: TEdit;
    editCEP: TEdit;
    editDataNasc: TEdit;
    editProfissao: TEdit;
    lbCodigo: TLabel;
    lbStatus: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    lbCPFCNPJ: TLabel;
    Label6: TLabel;
    lbEndereco: TLabel;
    Label8: TLabel;
    lbTelefone: TLabel;
    lbCEP: TLabel;
    lbClienteFornecedor: TLabel;
    Label13: TLabel;
    cbStatus: TComboBox;
    cbSexo: TComboBox;
    cbTipoCliFor: TComboBox;
    cbEstadoCivil: TComboBox;
    rgPessoa: TRadioGroup;
    lbFantasia: TLabel;
    pnEndereco: TPanel;
    editNumero: TEdit;
    lbNumero: TLabel;
    lbComplemento: TLabel;
    lbCidade: TLabel;
    editCidadeCod: TEdit;
    editCidadeDesc: TEdit;
    lbEstado: TLabel;
    editEstadoCod: TEdit;
    editEstadoDesc: TEdit;
    lbBairro: TLabel;
    editBairroCod: TEdit;
    editBairroDesc: TEdit;
    lbPais: TLabel;
    editPaisCod: TEdit;
    editPaisDesc: TEdit;
    lbTelefone2: TLabel;
    editCelular: TEdit;
    lbEmail: TLabel;
    editEmail: TEdit;
    editSite: TEdit;
    lbSite: TLabel;
    memoComplemento: TMemo;
    gbDadosPJ: TGroupBox;
    editProfissaoCod: TEdit;
    lbRG: TLabel;
    editRGNumero: TEdit;
    lbFormacao: TLabel;
    editFormacao: TEdit;
    Nacionalidade: TLabel;
    editNacionalidadeCod: TEdit;
    editNacionalidadeDesc: TEdit;
    Label1: TLabel;
    editNaturalidadeDesc: TEdit;
    lbCNPJ: TLabel;
    lbNomePJ: TLabel;
    lbInscEstadual: TLabel;
    lbIndicadorIE: TLabel;
    cbIndicadorIE: TComboBox;
    lbNatJuri: TLabel;
    lbContato: TLabel;
    lbCNAE: TLabel;
    lbInscMuni: TLabel;
    lbCadastroReg: TLabel;
    editCadastroReg: TEdit;
    cboxEmpSimples: TCheckBox;
    cboxIsentoICMS: TCheckBox;
    editID: TEdit;
    editCNPJ: TEdit;
    editRazaoSocial: TEdit;
    editInscMun: TEdit;
    editNomeFantasia: TEdit;
    editInscEst: TEdit;
    editNatJurCod: TEdit;
    editNatJurDesc: TEdit;
    editContato: TEdit;
    editCNAECod: TEdit;
    editCNAEDesc: TEdit;
    editRGOrgao: TEdit;
    lbRGOrgao: TLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure rgPessoaClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure editNacionalidadeCodKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
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
   rgPessoaItem : string;
   cbIndicadorIEItem : integer;
implementation

{$R *.dfm}

   uses DataModLivraria, clienteListaU, clientePesquisaU, pesquisaCodDesc;

procedure TfrmClienteDadosGeral.btnSalvarClick(Sender: TObject);
   var cbIndice, cbSimples, cbIsentoICMS : integer;
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

         //prepara radioGroup TipoPessoa
         if rgPessoa.ItemIndex = 0 then
            rgPessoaItem := 'F'
         else if rgPessoa.ItemIndex = 1 then
            rgPessoaItem := 'J'
         else if rgPessoa.ItemIndex = 2 then
            rgPessoaItem := 'E';

         adqClientes.Close;
         adqClientes.SQL.Clear;

         //dados e query espec�ficos para pessoa F�SICA e ESTRANGEIRA
         if (rgPessoaItem = 'F') or (rgPessoaItem = 'E') then begin

            //prepara combo sexo
            if cbSexo.ItemIndex = 0 then
               cbSexo.Text := 'F'
            else begin
               cbSexo.Text := 'M';
            end;

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

            adqClientes.SQL.Add('INSERT INTO TBCLIFOR (NOME, CPF_CNPJ, ENDERECO, TELEFONE, CEP, SEXO, DATA_NASC, PROFISSAO, ESTADO_CIVIL, STATUS, TIPO_PESSOA, TIPO_CLI_FOR, ID_USUARIO)');
            adqClientes.SQL.Add(' VALUES (:NOME, :CPF_CNPJ, :ENDERECO, :TELEFONE, :CEP, :SEXO, :DATA_NASC, :PROFISSAO, :ESTADO_CIVIL, :STATUS, :TIPO_PESSOA, :TIPO_CLI_FOR, :ID_USUARIO)');
            adqClientes.ParamByName('CPF_CNPJ').AsString := editCPF.Text;
            adqClientes.ParamByName('NOME').AsString := editNome.Text;
            adqClientes.ParamByName('DATA_NASC').AsString := editDataNasc.Text;
            //adqClientes.ParamByName('DATA_NASC').AsString := editDataNasc.Text;
            //adqClientes.ParamByName('RG_NUMERO').AsString := editRGNumero.Text;
            //adqClientes.ParamByName('RG_ORGAO').AsString := editRGOrgao.Text;
            adqClientes.ParamByName('ESTADO_CIVIL').AsString := cbEstadoCivilItem;
            adqClientes.ParamByName('SEXO').AsString := cbSexo.Text;
            //adqClientes.ParamByName('FORMACAO').AsString := editFormacao.Text;
            //adqClientes.ParamByName('ID_NACIONALIDADE').AsInteger := StrToIntDef(editNacionalidadeCod.Text, 0);
            //adqClientes.ParamByName('ID_NATURALIDADE').AsInteger := StrToIntDef(editNaturalidadeCod.Text, 0);

         end
         //dados e query espec�ficos para pessoa JUR�DICA
         else if rgPessoaItem = 'J' then begin

            //prepara combobox Indicador IE
            if cbIndicadorIE.ItemIndex = 0 then
               cbIndicadorIEItem := 1
            else if cbIndicadorIE.ItemIndex = 1 then
               cbIndicadorIEItem := 2
            else if cbIndicadorIE.ItemIndex = 2 then
            cbIndicadorIEItem := 9;

            //prepara checkbox Op��o Simples Nacional
            if cboxEmpSimples.Checked = False then
               cbSimples := 0
            else cbSimples := 1;

            //prepara checkbox Op��o Isento ICMS
            if cboxIsentoICMS.Checked = False then
               cbIsentoICMS := 0
            else cbIsentoICMS := 1;

            adqClientes.SQL.Add('INSERT INTO TBCLIFOR (NOME, CPF_CNPJ, ENDERECO, TELEFONE, CEP, SEXO, DATA_NASC, PROFISSAO, ESTADO_CIVIL, STATUS, TIPO_PESSOA, TIPO_CLI_FOR, ID_USUARIO)');
            adqClientes.SQL.Add(' VALUES (:NOME, :CPF_CNPJ, :ENDERECO, :TELEFONE, :CEP, :SEXO, :DATA_NASC, :PROFISSAO, :ESTADO_CIVIL, :STATUS, :TIPO_PESSOA, :TIPO_CLI_FOR, :ID_USUARIO)');
            adqClientes.ParamByName('CPF_CNPJ').AsString := editCNPJ.Text;
            adqClientes.ParamByName('NOME').AsString := editRazaoSocial.Text;
            adqClientes.ParamByName('INSCRICAO_MUNICIPAL').AsString := editInscMun.Text;
            adqClientes.ParamByName('NOME_FANTASIA').AsString := editNomeFantasia.Text;
            adqClientes.ParamByName('INSCRICAO_ESTADUAL').AsString := editInscMun.Text;
            adqClientes.ParamByName('INDICADOR_IE').AsInteger := cbIndicadorIEItem;
            adqClientes.ParamByName('ID_NAT_JURIDICA').AsInteger := StrToIntDef(editNatJurCod.Text, 0);
            adqClientes.ParamByName('CONTATO').AsString := editContato.Text;
            adqClientes.ParamByName('ID_CNAE_FISCAL').AsInteger := StrToIntDef(editCNAECod.Text, 0);
            adqClientes.ParamByName('EMP_OPT_SIMPLES').AsInteger := cbSimples;
            adqClientes.ParamByName('EMP_ISENTO_ICMS').AsInteger := cbIsentoICMS;
         end;

         //dados comuns para pessoa F�SICA, ESTRANGEIRA E JUR�DICA
         //prepara combobox TipoCliente
         if cbTipoCliFor.ItemIndex = 0 then
            cbTipoClienteItem := 'C'
         else if cbTipoCliFor.ItemIndex = 1 then
            cbTipoClienteItem := 'F'
         else
            cbTipoClienteItem := 'A';

         adqClientes.ParamByName('TIPO_PESSOA').AsString := rgPessoaItem;
         adqClientes.ParamByName('ENDERECO').AsString := editEndereco.Text;
         adqClientes.ParamByName('TELEFONE').AsString := editTelefone.Text;
         adqClientes.ParamByName('CEP').AsString := editCep.Text;
         adqClientes.ParamByName('PROFISSAO').AsString := editProfissao.Text;
         adqClientes.ParamByName('STATUS').AsInteger := cbStatus.ItemIndex;

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
               if cbTipoCliFor.ItemIndex = 0 then
                  cbTipoClienteItem := 'C'
               else if cbTipoCliFor.ItemIndex = 1 then
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

               //prepara radioGroup TipoPessoa
               if rgPessoa.ItemIndex = 0 then
                  rgPessoaItem := 'F'
               else if rgPessoa.ItemIndex = 1 then
                  rgPessoaItem := 'J'
               else if rgPessoa.ItemIndex = 2 then
                  rgPessoaItem := 'E';


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

               //dados e query espec�ficos de cada tipo de pessoa
               if (rgPessoaItem = 'F') or (rgPessoaItem = 'E') then begin
                  adqClientes.SQL.Add('UPDATE TBCLIFOR SET NOME = :NOME, CPF_CNPJ = :CPF_CNPJ, ENDERECO = :ENDERECO, TELEFONE = :TELEFONE, CEP = :CEP, SEXO = :SEXO,');
                  adqClientes.SQL.Add(' DATA_NASC = :DATA_NASC, PROFISSAO = :PROFISSAO, ESTADO_CIVIL = :ESTADO_CIVIL, STATUS = :STATUS, TIPO_PESSOA = :TIPO_PESSOA, TIPO_CLI_FOR = :TIPO_CLI_FOR WHERE ID = :ID');
                  adqClientes.ParamByName('NOME').AsString := editNome.Text;
                  adqClientes.ParamByName('CPF_CNPJ').AsString := editCPF.Text;
                  adqClientes.ParamByName('SEXO').AsString := cbSexoItem;
                  adqClientes.ParamByName('DATA_NASC').AsString := FormatDateTime('yyyy/mm/dd', StrToDateDef(editDataNasc.Text, 0));
                  adqClientes.ParamByName('ESTADO_CIVIL').AsString := cbEstadoCivilItem;
               end
               else if rgPessoaItem = 'J' then begin
                  adqClientes.SQL.Add('UPDATE TBCLIFOR SET NOME = :NOME, CPF_CNPJ = :CPF_CNPJ, ENDERECO = :ENDERECO, TELEFONE = :TELEFONE, CEP = :CEP, SEXO = :SEXO,');
                  adqClientes.SQL.Add(' DATA_NASC = :DATA_NASC, PROFISSAO = :PROFISSAO, ESTADO_CIVIL = :ESTADO_CIVIL, STATUS = :STATUS, TIPO_PESSOA = :TIPO_PESSOA, TIPO_CLI_FOR = :TIPO_CLI_FOR WHERE ID = :ID');
                  adqClientes.ParamByName('NOME').AsString := editNome.Text;
                  adqClientes.ParamByName('CPF_CNPJ').AsString := editCPF.Text;
               end;

               //dados comuns
               adqClientes.ParamByName('ENDERECO').AsString := editEndereco.Text;
               adqClientes.ParamByName('TELEFONE').AsString := editTelefone.Text;
               adqClientes.ParamByName('CEP').AsString := editCep.Text;
               adqClientes.ParamByName('PROFISSAO').AsString := editProfissao.Text;
               adqClientes.ParamByName('STATUS').AsInteger := cbStatus.ItemIndex;
               adqClientes.ParamByName('TIPO_PESSOA').AsString := rgPessoaItem;
               adqClientes.ParamByName('TIPO_CLI_FOR').AsString := cbTipoClienteItem;
               //adqClientes.ParamByName('ID_USUARIO').AsInteger := 1;
               adqClientes.ParamByName('ID').AsString := editID.Text;

               adqClientes.ExecSQL;
            finally
               //btnListarClick(Sender);
               //ShowMessage('Atualizado com sucesso!');
               //MessageBox(application.Handle, Pchar('Cliente '+editNome.Text+' atualizado com sucesso!'),  Pchar('Informa��o'), MB_OK+MB_ICONINFORMATION);
               //MessageDlg('Atualizado com sucesso!',mtWarning ,[mbOk],0);
               Application.MessageBox('Cliente atualizado com sucesso!','Sucesso',MB_ICONINFORMATION+MB_OK);
               //adqClientes.Close;
               //adqClientes.SQL.Clear;
               frmClienteDadosGeral.Close;
               //frmClientesLista.dbgDados.DataSource.DataSet.Refresh;
               //frmClientesLista.adqClientes.DataSource.DataSet.Refresh;
               //frmClientesLista.editFiltro.SetFocus;
               //frmClientesLista.Close;
               //application.processmessages;
            end;
         end;
      end;
   end;

end;

procedure TfrmClienteDadosGeral.editNacionalidadeCodKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
   inherited;
   {
   if Key = VK_F9 then
      callBackAction := 'nacionalidade';
      //callBackAction := self.;
      //frmPesquisa.
      frmPCodDesc.ShowModal;

   }
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
   //frmClientesLista.Close;
   //dsModelo.DataSet.Refresh;
   //frmClientesLista.adqClientes.DataSource.DataSet.Refresh;
   //adqClientes.Close;
   //adqClientes.SQL.Clear;
   //frmClientesLista.dbgDados.DataSource.DataSet.Refresh;
   //frmClientesLista.adqClientes.DataSource.DataSet.Refresh;
   //frmClientesLista.Close();
   //Action := caFree;
   idRef := 0;
   //self := nil;
end;

procedure TfrmClienteDadosGeral.FormKeyDown(Sender: TObject; var Key: Word;
   Shift: TShiftState);
begin
   inherited;

   if Key = VK_F9 then begin
      callBackAction := Screen.ActiveControl.Name;
      if callBackAction = 'editID' then begin
         callBackActionSQL := 'SELECT ID, NOME, CPF_CNPJ FROM TBCLIFOR';
         frmPCodDesc.Caption := 'Pesquisa por qualquer coisa';
         //frmPCodDesc.dbgPesquisa.Columns[0].Width := 50;
         //frmPCodDesc.dbgPesquisa.Columns[1].Width := 150;
         //frmPCodDesc.dbgPesquisa.Columns[2].Width := 150;
         frmPCodDesc.ShowModal;
      end
      else if callBackAction = 'editCidadeCod' then begin
         callBackActionSQL := 'SELECT CODIGO, NOME FROM TBCIDADE';
         frmPCodDesc.Caption := 'Pesquisa por qualquer coisa';
         //frmPCodDesc.dbgPesquisa.Columns[0].Width := 50;
         //frmPCodDesc.dbgPesquisa.Columns[1].Width := 150;
         frmPCodDesc.ShowModal;
      end
      else
         ShowMessage('N�o existe pesquisa para este campo!');
   end;
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
      rgPessoa.ItemIndex := 0;
      cbStatus.ItemIndex := 1;
      cbTipoCliFor.ItemIndex := 0;
      cbTipoCliFor.Enabled := false;
      //editFisica.Visible := true;
      editID.Text := '';
      editID.Enabled := false;
      editCadastroReg.Enabled := false;
      lbCodigo.Enabled := false;
      //editStatus.Text := '';
      editNome.Text := '';
      editCPF.Text := '';
      editEndereco.Text := '';
      editTelefone.Text := '';
      editCEP.Text := '';
      //editSexo.Text := '';
      editDataNasc.Text := '';
      editProfissao.Text := '';
      //editEstadoCivil.Text := '';
      //editTipoPessoa.Text := '';
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

      rgPessoa.Enabled := false;

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
         cbTipoCliFor.ItemIndex := 0
      else if cbTipoClienteItem = 'F' then //se F = tipo FORNECEDOR e o index 1
         cbTipoCliFor.ItemIndex := 1
      else //se A = tipo AMBOS e o index 2
         cbTipoCliFor.ItemIndex := 2;

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

      //prepara radioGroup TipoPessoa
      rgPessoaItem := adqClientes.FieldByName('TIPO_PESSOA').AsString;
      if rgPessoaitem = 'F' then //se F = FISICA e index 0
         rgPessoa.ItemIndex := 0
      else if rgPessoaitem = 'J' then //se J = JURIDICA e index 1
         rgPessoa.ItemIndex := 1
      else if rgPessoaitem = 'E' then //se E = ESTRANGEIRA e index 2
         rgPessoa.ItemIndex := 2;

      editID.Text := IntToStr(idRef);
      cbStatus.ItemIndex := adqClientes.FieldByName('STATUS').AsInteger;
      editEndereco.Text := adqClientes.FieldByName('ENDERECO').AsString;
      editTelefone.Text := adqClientes.FieldByName('TELEFONE').AsString;
      editCEP.Text := adqClientes.FieldByName('CEP').AsString;
      editProfissao.Text := adqClientes.FieldByName('PROFISSAO').AsString;

      if (rgPessoaItem = 'F') or (rgPessoaItem = 'E') then begin
         editNome.Text := adqClientes.FieldByName('NOME').AsString;
         editCPF.Text := adqClientes.FieldByName('CPF_CNPJ').AsString;
         editDataNasc.Text := adqClientes.FieldByName('DATA_NASC').AsString;
         rgPessoaClick(Sender); //Verifica o TipoPessoa e exibe os campos necess�rios
      end
      else if rgPessoaItem = 'J' then begin
         editRazaoSocial.Text := adqClientes.FieldByName('NOME').AsString;
         editNomeFantasia.Text := adqClientes.FieldByName('NOME').AsString;
         editCNPJ.Text := adqClientes.FieldByName('CPF_CNPJ').AsString;
         rgPessoaClick(Sender); //Verifica o TipoPessoa e exibe os campos necess�rios
      end;
  end;

end;

procedure TfrmClienteDadosGeral.rgPessoaClick(Sender: TObject);
   var rgPessoaItemSelected : integer;
begin
   inherited;
   //rgPessoa.ItemIndex := 0;
   rgPessoaItemSelected := rgPessoa.ItemIndex;
   //rgPessoaItemSelected := 0;

   //ShowMessage('Item selecionado: : ' + IntToStr(rgPessoaItemSelected));
   if rgPessoaItemSelected = 0 then begin
      //ShowMessage('Item selecionado: ' + IntToStr(rgPessoaItemSelected));
      gbDados.Visible := true;
      gbDadosPJ.Visible := false;
      lbCPFCNPJ.Caption := 'CPF:';
      lbCPFCNPJ.Enabled := true;
      editCPF.Enabled := true;
   end
   else if rgPessoaItemSelected = 1 then begin
      //ShowMessage('Item selecionado: ' + IntToStr(rgPessoaItemSelected));
      gbDados.Visible := false;
      gbDadosPJ.Visible := true;
      lbCPFCNPJ.Caption := 'CNPJ:';
      lbCPFCNPJ.Enabled := true;
      editCPF.Enabled := true;
      lbCPFCNPJ.Visible := true;
      editCPF.Visible := true;
   end
   else if rgPessoaItemSelected = 2 then begin
      //ShowMessage('Item selecionado: ' + IntToStr(rgPessoaItemSelected));
      gbDados.Visible := true;
      gbDadosPJ.Visible := false;
      lbCPFCNPJ.Enabled := false;
      editCPF.Enabled := false;
      editCPF.Text := '';
   end;
end;

end.
