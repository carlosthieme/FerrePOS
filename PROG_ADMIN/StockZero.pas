unit StockZero;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, StdCtrls, Buttons, DBTables, ComCtrls, ExtCtrls;

type
  TStockZeroForm = class(TForm)
    Panel1: TPanel;
    ProgressBar: TProgressBar;
    ArticulosNew: TTable;
    DataSource2: TDataSource;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    ArticulosNewCODIGO: TStringField;
    ArticulosNewALTER1: TStringField;
    ArticulosNewALTER2: TStringField;
    ArticulosNewNOMBRE: TStringField;
    ArticulosNewMODIF: TBooleanField;
    ArticulosNewDESC: TFloatField;
    ArticulosNewTIPODESC: TBooleanField;
    ArticulosNewPRECIO: TFloatField;
    ArticulosNewSTOCK: TFloatField;
    ArticulosNewCOMP1: TSmallintField;
    ArticulosNewCOMP2: TSmallintField;
    ArticulosNewCOMP3: TSmallintField;
    ArticulosNewCOMP4: TSmallintField;
    ArticulosNewCOMP5: TSmallintField;
    ArticulosNewCOMP6: TSmallintField;
    ArticulosNewCOMP7: TSmallintField;
    ArticulosNewCOMP8: TSmallintField;
    ArticulosNewCOMP9: TSmallintField;
    ArticulosNewCOMP10: TSmallintField;
    ArticulosNewCOMP11: TSmallintField;
    ArticulosNewCOMP12: TSmallintField;
    ArticulosNewCOMP13: TSmallintField;
    ArticulosNewCOMP14: TSmallintField;
    ArticulosNewCOMP15: TSmallintField;
    ArticulosNewVUCOMPRA: TFloatField;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  StockZeroForm: TStockZeroForm;

implementation

{$R *.DFM}

procedure TStockZeroForm.FormCreate(Sender: TObject);
begin
  ArticulosNew.Open;
end;

procedure TStockZeroForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  ArticulosNew.Close;
end;

procedure TStockZeroForm.BitBtn1Click(Sender: TObject);
Var
  Registros : Integer;
begin
  ArticulosNew.First;
  Registros   := ArticulosNew.RecordCount;
  ProgressBar.Min  := 0;
  ProgressBar.Max  := Registros;
  ProgressBar.Step := 1;
  While Not(ArticulosNew.Eof) Do
    Begin
      ArticulosNew.Edit;
      ArticulosNewStock.Value := 0;
      ArticulosNew.Post;
      ArticulosNew.Next;
      ProgressBar.StepIt;
    End;
  ArticulosNew.Close;
end;

end.
