unit Usuarios;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, uADStanIntf,
  uADStanOption, uADStanParam, uADStanError, uADDatSManager, uADPhysIntf,
  uADDAptIntf, uADStanAsync, uADDAptManager, Data.DB, uADCompDataSet,
  uADCompClient, Vcl.Grids, Vcl.DBGrids;

type
  TfrmUsuarios = class(TForm)
    bntExcluir: TButton;
    editNome: TLabeledEdit;
    editSenha: TLabeledEdit;
    comboStatus: TComboBox;
    Label2: TLabel;
    btnCancelar: TButton;
    editID: TLabeledEdit;
    btnAtualizar: TButton;
    btnSalvar: TButton;
    btnListar: TButton;
    dbGridUsuarios: TDBGrid;
    ADQuery1: TADQuery;
    DataSource1: TDataSource;
    procedure dbGridUsuariosCellClick(Column: TColumn);
    procedure FormShow(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure btnListarClick(Sender: TObject);
    procedure btnAtualizarClick(Sender: TObject);
    procedure bntExcluirClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmUsuarios: TfrmUsuarios;

implementation

{$R *.dfm}

//deleta usuario
procedure TfrmUsuarios.bntExcluirClick(Sender: TObject);
begin
if editID.Text <> '' then begin //verifica id e descri??o se est?o vazios
   ADQuery1.Close;
   ADQuery1.SQL.Clear;
   ADQuery1.SQL.Add('SELECT ID FROM TBUSUARIO WHERE ID = :ID');
   ADQuery1.ParamByName('ID').AsString := editID.Text;
   ADQuery1.Open;
   if not ADQuery1.IsEmpty then begin
      try
         ADQuery1.Close;
         ADQuery1.SQL.Clear;
         ADQuery1.SQL.Add('DELETE FROM TBUSUARIO WHERE ID = :ID');
         ADQuery1.ParamByName('ID').AsString := editID.Text;
         ADQuery1.ExecSQL;
      finally
         editID.Clear;
         editNome.Clear;
         editSenha.Clear;
         comboStatus.Clear;
         btnListarClick(Sender);
         ShowMessage('Deletado com sucesso!');
      end;
   end;
end;
end;

//atualiza usuario
procedure TfrmUsuarios.btnAtualizarClick(Sender: TObject);
begin
   if editID.Text <> '' then begin //verifica id e descri??o se est?o vazios
      ADQuery1.Close;
      ADQuery1.SQL.Clear;
      ADQuery1.SQL.Add('SELECT ID FROM TBUSUARIO WHERE ID = :ID');
      ADQuery1.ParamByName('ID').AsString := editID.Text;
      ADQuery1.Open;
      if not ADQuery1.IsEmpty then begin
         try
            ADQuery1.Close;
            ADQuery1.SQL.Clear;
            ADQuery1.SQL.Add('UPDATE TBUSUARIO SET NOME = :NOME, SENHA = :SENHA, STATUS = :STATUS WHERE ID = :ID');
            ADQuery1.ParamByName('NOME').AsString := editNome.Text;
            ADQuery1.ParamByName('SENHA').AsString := editSenha.Text;
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

//limpa campos do formul?rio
procedure TfrmUsuarios.btnCancelarClick(Sender: TObject);
begin
   editID.Clear;
   editNome.Clear;
   editSenha.Clear;
   comboStatus.Clear;
   btnListarClick(Sender);
end;

//lista usarios na dbgrid
procedure TfrmUsuarios.btnListarClick(Sender: TObject);
begin
   ADQuery1.Close;
   ADQuery1.SQL.Clear;
   ADQuery1.SQL.Add('SELECT * FROM TBUSUARIO');
   ADQuery1.Open;
end;

//cadastra usu?rio
procedure TfrmUsuarios.btnSalvarClick(Sender: TObject);
begin
   if editID.Text <> '' then begin
      ShowMessage('O campo ID deve estar em branco para realizar um novo cadastro!');
      exit;
   end;
   if editNome.Text <> '' then begin
      ADQuery1.Close;
      ADQuery1.SQL.Clear;
      ADQuery1.SQL.Add('INSERT INTO TBUSUARIO (NOME, SENHA, STATUS) VALUES (:NOME, :SENHA, :STATUS)');
      ADQuery1.ParamByName('NOME').AsString := editNome.Text;
      ADQuery1.ParamByName('SENHA').AsString := editSenha.Text;
      ADQuery1.ParamByName('STATUS').AsInteger := StrToIntDef(comboStatus.Text, 0);
      ADQuery1.ExecSQL;
      btnListarClick(Sender);
   end;
end;

procedure TfrmUsuarios.dbGridUsuariosCellClick(Column: TColumn);
begin
   editID.Text := dbGridUsuarios.DataSource.DataSet.FieldByName('ID').AsString;
   editNome.Text := dbGridUsuarios.DataSource.DataSet.FieldByName('NOME').AsString;
   editSenha.Text := dbGridUsuarios.DataSource.DataSet.FieldByName('SENHA').AsString;
   comboStatus.Text := dbGridUsuarios.DataSource.DataSet.FieldByName('STATUS').AsString;
end;

//carrega os dados ao mostrar o formul?rio
procedure TfrmUsuarios.FormShow(Sender: TObject);
begin
   ADQuery1.Close;
   ADQuery1.SQL.Clear;
   ADQuery1.SQL.Add('SELECT * FROM TBUSUARIO');
   ADQuery1.Open;
end;

end.
