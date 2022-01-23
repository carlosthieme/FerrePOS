unit AnularVenta;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Db, DBTables, ExtCtrls, Grids, DBGrids, Buttons;

type
  TAnularVentaForm = class(TForm)
    Panel1: TPanel;
    DetalleVenta: TTable;
    DataSource2: TDataSource;
    ProdVend: TTable;
    DataSource3: TDataSource;
    DBGrid2: TDBGrid;
    DBGrid3: TDBGrid;
    DetalleVentaNUMERO: TFloatField;
    DetalleVentaTIPODOC: TStringField;
    DetalleVentaFORMAPAGO: TStringField;
    DetalleVentaOCOMPRA: TFloatField;
    DetalleVentaFECHAEMI: TDateField;
    DetalleVentaSUBTOTAL: TFloatField;
    DetalleVentaDESCUENTO: TFloatField;
    DetalleVentaNETO: TFloatField;
    DetalleVentaIVA: TFloatField;
    DetalleVentaTOTAL: TFloatField;
    DetalleVentaRUTFACTURA: TFloatField;
    DetalleVentaBANCO: TStringField;
    DetalleVentaSERIE: TStringField;
    DetalleVentaCUENTA: TStringField;
    DetalleVentaFECHACHEQ: TDateField;
    DetalleVentaRUTRETIRA: TStringField;
    DetalleVentaNOMRETIRA: TStringField;
    ProdVendNUMERO: TFloatField;
    ProdVendFECHA: TDateField;
    ProdVendITEM: TSmallintField;
    ProdVendCODIGO: TStringField;
    ProdVendNOMBRE: TStringField;
    ProdVendPRECIO1: TFloatField;
    ProdVendDESCUENTO: TFloatField;
    ProdVendPRECIO2: TFloatField;
    ProdVendCANTIDAD: TSmallintField;
    ProdVendVENDEDOR: TSmallintField;
    Panel2: TPanel;
    Panel3: TPanel;
    NumDoc: TEdit;
    BitBtn1: TBitBtn;
    Artics: TTable;
    DSArtics: TDataSource;
    ArticsCODIGO: TStringField;
    ArticsSTOCK: TFloatField;
    BtnAnular: TBitBtn;
    procedure FormCreate(Sender: TObject);
    procedure BtnAnularClick(Sender: TObject);
    procedure NumDocKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  AnularVentaForm: TAnularVentaForm;

implementation

{$R *.DFM}

procedure TAnularVentaForm.FormCreate(Sender: TObject);
begin
  DetalleVenta.Open;
  ProdVend.Open;
end;

procedure TAnularVentaForm.BtnAnularClick(Sender: TObject);
begin
  DetalleVenta.Edit;
  DetalleVentaTipoDoc.Value   := 'ANULADO';
  DetalleVentaFormapago.Value := 'ANULADO';
  DetalleVentaSubTotal.Value  := 0;
  DetalleVentaDescuento.Value := 0;
  DetalleVentaNeto.Value      := 0;
  DetalleVentaIva.Value       := 0;
  DetalleVentaTotal.Value     := 0;
  DetalleVenta.Post;

  ProdVend.First;
  While Not (ProdVend.EOF) Do
    If ProdVendNumero.Value = StrToFloat(NumDoc.Text) Then
      Begin
        Artics.Open;
        Artics.SetKey;
        If Not Artics.FindKey([ProdVendCodigo.Value]) Then
          Begin
          End
        Else
          Begin
            Artics.Edit;
            ArticsStock.Value := ArticsStock.Value + ProdVendCantidad.Value;
            Artics.Post;
          End;
        Artics.Close;
        ProdVend.Delete;
        ProdVend.Next;
      End
    Else
      Begin
        ProdVend.Next;
      End;
end;

procedure TAnularVentaForm.NumDocKeyPress(Sender: TObject; var Key: Char);
begin
  If Key = #13 Then
    Begin
      DetalleVenta.Filter  := 'Numero = ' + NumDoc.Text;
      ProdVend.Filter      := 'Numero = ' + NumDoc.Text;
    End;
end;

end.
