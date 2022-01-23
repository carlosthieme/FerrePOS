unit AnulaValeVenta;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids, DBGrids, Db, DBTables, ExtCtrls, StdCtrls, Buttons, DBCtrls;

type
  TAnulaValeVentaForm = class(TForm)
    Panel1: TPanel;
    Vales: TTable;
    DSVales: TDataSource;
    ValesNUMERO: TFloatField;
    ValesFECHA: TDateField;
    ValesVENDEDOR: TSmallintField;
    ValesITEM: TSmallintField;
    ValesPRODUCTO: TStringField;
    ValesNOMBRE: TStringField;
    ValesVALOR: TFloatField;
    ValesVALORORI: TFloatField;
    ValesDESCUENTO: TFloatField;
    ValesCANTIDAD: TSmallintField;
    ValesPROCESADO: TBooleanField;
    ValesDOCUMENTO: TStringField;
    ValesIMPRESO: TBooleanField;
    DBGrid1: TDBGrid;
    DBNavigator1: TDBNavigator;
    BitBtn1: TBitBtn;
    procedure FormCreate(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  AnulaValeVentaForm: TAnulaValeVentaForm;

implementation

{$R *.DFM}

procedure TAnulaValeVentaForm.FormCreate(Sender: TObject);
begin
  Vales.Open;
end;

procedure TAnulaValeVentaForm.DBGrid1DblClick(Sender: TObject);
begin
  Vales.Edit;
  ValesProducto.Value  := 'ANULADO';
  ValesNombre.Value    := 'ANULADO';
  ValesCantidad.Value  := 0;
  ValesValor.Value     := 0;
  ValesValorOri.Value  := 0;
  ValesDescuento.Value := 0;
  ValesDocumento.Value := 'A';
  ValesProcesado.Value := True;
  ValesImpreso.Value   := True;
  Vales.Post; 
end;

end.
