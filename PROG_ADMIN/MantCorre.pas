unit MantCorre;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, DBCtrls, Mask, Db, ExtCtrls, DBTables;

type
  TMantCorrelativosForm = class(TForm)
    Panel1: TPanel;
    Correlativos: TTable;
    DSCorrelativos: TDataSource;
    Bevel1: TBevel;
    Bevel2: TBevel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    CorrelativosVALENOW: TFloatField;
    CorrelativosEGRESONOW: TFloatField;
    CorrelativosANTINOW: TFloatField;
    CorrelativosBOLETAINI: TFloatField;
    CorrelativosBOLETAFIN: TFloatField;
    CorrelativosBOLETASIG: TFloatField;
    CorrelativosFACTURAINI: TFloatField;
    CorrelativosFACTURAFIN: TFloatField;
    CorrelativosFACTURASIG: TFloatField;
    Label4: TLabel;
    Bevel3: TBevel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    DBEdit4: TDBEdit;
    DBEdit5: TDBEdit;
    DBEdit6: TDBEdit;
    DBEdit7: TDBEdit;
    DBNavigator1: TDBNavigator;
    BitBtn1: TBitBtn;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  MantCorrelativosForm: TMantCorrelativosForm;

implementation

{$R *.DFM}

procedure TMantCorrelativosForm.FormCreate(Sender: TObject);
begin
  Correlativos.Open;
end;

end.
