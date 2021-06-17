unit FormaPagamento;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, uADStanIntf,
  uADStanOption, uADStanError, uADGUIxIntf, uADPhysIntf, uADStanDef,
  uADStanPool, uADStanAsync, uADPhysManager, uADStanParam, uADDatSManager,
  uADDAptIntf, uADDAptManager, uADGUIxFormsWait, Data.DB, uADCompGUIx,
  uADPhysODBCBase, uADPhysASA, Vcl.Grids, Vcl.DBGrids, uADCompDataSet,
  uADCompClient;

type
  TfrmFormPagto = class(TForm)
    LabeledEdit1: TLabeledEdit;
    Button1: TButton;
    Button2: TButton;
    //Button3: TButton;
    Button4: TButton;
    ADQuery1: TADQuery;
    DBGrid1: TDBGrid;
    DataSource1: TDataSource;
    Button5: TButton;
    LabeledEdit2: TLabeledEdit;
    Edit1: TEdit;
    procedure Button1Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure LabeledEdit2Exit(Sender: TObject);
    procedure DBGrid1CellClick(Column: TColumn);
    procedure Button4Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmFormPagto: TfrmFormPagto;

implementation

{$R *.dfm}

uses DataModLivraria;

//cadastra forma de pgto
procedure TfrmFormPagto.Button1Click(Sender: TObject);
begin
if LabeledEdit2.Text <> '' then begin
   ShowMessage('O campo deve estar em branco!');
   exit;
end;
if LabeledEdit1.Text <> '' then begin
   ADQuery1.Close;
   ADQuery1.SQL.Clear;
   ADQuery1.SQL.Add('INSERT INTO TBFORM_PAGAMENTO (DESCRICAO) VALUES (:DESCRICAO)');
   ADQuery1.ParamByName('DESCRICAO').AsString := LabeledEdit1.Text;
   ADQuery1.ExecSQL;
   Button5Click(Sender);
end;

end;

//limpar campos forma de pgto
procedure TfrmFormPagto.Button2Click(Sender: TObject);
begin
   LabeledEdit2.Clear;
   LabeledEdit1.Clear;
end;

//deleta forma de pgto
procedure TfrmFormPagto.Button3Click(Sender: TObject);
begin
if LabeledEdit2.Text <> '' then begin //verifica id e descri��o se est�o vazios
   ADQuery1.Close;
   ADQuery1.SQL.Clear;
   ADQuery1.SQL.Add('SELECT ID FROM TBFORM_PAGAMENTO WHERE ID = :ID');
   ADQuery1.ParamByName('ID').AsString := LabeledEdit2.Text;
   ADQuery1.Open;
   if not ADQuery1.IsEmpty then begin
      try
         ADQuery1.Close;
         ADQuery1.SQL.Clear;
         ADQuery1.SQL.Add('DELETE FROM TBFORM_PAGAMENTO WHERE ID = :ID');
         ADQuery1.ParamByName('ID').AsString := LabeledEdit2.Text;
         ADQuery1.ExecSQL;
      finally
         LabeledEdit2.Clear;
         LabeledEdit1.Clear;
         Button5Click(Sender);
         ShowMessage('Deletado com sucesso!');
      end;
   end;
end;
end;

//atualiza forma de pgto
procedure TfrmFormPagto.Button4Click(Sender: TObject);
begin
if LabeledEdit2.Text <> '' then begin //verifica id e descri��o se est�o vazios
   ADQuery1.Close;
   ADQuery1.SQL.Clear;
   ADQuery1.SQL.Add('SELECT ID FROM TBFORM_PAGAMENTO WHERE ID = :ID');
   ADQuery1.ParamByName('ID').AsString := LabeledEdit2.Text;
   ADQuery1.Open;
   if not ADQuery1.IsEmpty then begin
      try
         ADQuery1.Close;
         ADQuery1.SQL.Clear;
         ADQuery1.SQL.Add('UPDATE TBFORM_PAGAMENTO SET DESCRICAO = :DESCRICAO WHERE ID = :ID');
         ADQuery1.ParamByName('DESCRICAO').AsString := LabeledEdit1.Text;
         ADQuery1.ParamByName('ID').AsString := LabeledEdit2.Text;
         ADQuery1.ExecSQL;
      finally
         ShowMessage('Atualizado com sucesso!');
      end;
   end;
end;

if LabeledEdit1.Text <> '' then begin //insert / insere nova forma de pgto
   ADQuery1.Close;
   ADQuery1.SQL.Clear;
   ADQuery1.SQL.Add('INSERT INTO TBFORM_PAGAMENTO (DESCRICAO) VALUES (:PARCELADO)');
   ADQuery1.ParamByName('PARCELADO').AsString := LabeledEdit1.Text;
   ADQuery1.ExecSQL;
   Button5Click(Sender);
end;
end;

//pesquisa por todas as formas de pgto
procedure TfrmFormPagto.Button5Click(Sender: TObject);
begin
   ADQuery1.Close;
   ADQuery1.SQL.Clear;
   ADQuery1.SQL.Add('SELECT * FROM TBFORM_PAGAMENTO');
   ADQuery1.Open;
end;

//ao clicar em um item da DBgrid apresenta o ID e a Descri��o nos campos edit
procedure TfrmFormPagto.DBGrid1CellClick(Column: TColumn);
begin
LabeledEdit1.Text := DBGrid1.DataSource.DataSet.FieldByName('DESCRICAO').AsString;
LabeledEdit2.Text := DBGrid1.DataSource.DataSet.FieldByName('ID').AsString;
end;

//ao mostrar o formul�rio carrega os dados na DB grid
procedure TfrmFormPagto.FormShow(Sender: TObject);
begin
   Button5Click(Sender);
end;

//pesquisa pela forma de pgto ao prencher o id e sair do campo
procedure TfrmFormPagto.LabeledEdit2Exit(Sender: TObject);
begin
if LabeledEdit2.Text <> '' then begin
   ADQuery1.Close;
   ADQuery1.SQL.Clear;
   ADQuery1.SQL.Add('SELECT DESCRICAO FROM TBFORM_PAGAMENTO WHERE ID = :ID');
   ADQuery1.ParamByName('ID').AsString := LabeledEdit2.Text;
   ADQuery1.Open;
   if ADQuery1.IsEmpty then begin
      ShowMessage('N�o existe forma de pagamento com este c�digo!');
      exit;
   end;
   LabeledEdit1.Text := ADQuery1.FieldByName('DESCRICAO').AsString;
end;
end;

end.
