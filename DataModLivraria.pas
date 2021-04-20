unit DataModLivraria;

interface

uses
  System.SysUtils, System.Classes, uADStanIntf, uADStanOption, uADStanError,
  uADGUIxIntf, uADPhysIntf, uADStanDef, uADStanPool, uADStanAsync,
  uADPhysManager, uADGUIxFormsWait, uADCompGUIx, uADPhysODBCBase, uADPhysASA,
  Data.DB, uADCompClient;

type
  TDataModuleLivraria = class(TDataModule)
    ADConnection1: TADConnection;
    ADPhysASADriverLink1: TADPhysASADriverLink;
    ADGUIxWaitCursor1: TADGUIxWaitCursor;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DataModuleLivraria: TDataModuleLivraria;

implementation

{%CLASSGROUP 'System.Classes.TPersistent'}

{$R *.dfm}

end.
