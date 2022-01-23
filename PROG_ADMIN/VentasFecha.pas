unit VentasFecha;

interface

uses
  SysUtils, Windows, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, Quickrpt, QRCtrls, Db, DBTables;

type
  TVentasFechaForm = class(TForm)
    Table1: TTable;
    Table1NUMERO: TFloatField;
    Table1FECHA: TDateField;
    Table1ITEM: TSmallintField;
    Table1CODIGO: TStringField;
    Table1NOMBRE: TStringField;
    Table1PRECIO1: TFloatField;
    Table1DESCUENTO: TFloatField;
    Table1PRECIO2: TFloatField;
    Table1CANTIDAD: TSmallintField;
    Table1VENDEDOR: TSmallintField;
    RepVentaFecha: TQuickRep;
    QRBand1: TQRBand;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    Pagado: TQRExpr;
    QRBand2: TQRBand;
    QRExpr2: TQRExpr;
    QRExpr4: TQRExpr;
    QRExpr5: TQRExpr;
    QRExpr6: TQRExpr;
    QRLabel14: TQRLabel;
    Expre1: TQRExpr;
    QRBand3: TQRBand;
    QRExpr8: TQRExpr;
    QRExpr9: TQRExpr;
    QRExpr10: TQRExpr;
    QRExpr11: TQRExpr;
    QRLabel13: TQRLabel;
    QRExpr7: TQRExpr;
    QRBand4: TQRBand;
    QRLabel4: TQRLabel;
    QRSysData1: TQRSysData;
    QRSysData2: TQRSysData;
    QRLabel10: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel12: TQRLabel;
    QRExpr1: TQRExpr;
    QRGroup1: TQRGroup;
    QRLabel1: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel2: TQRLabel;
    QRExpr3: TQRExpr;
  private
  end;

var
  VentasFechaForm: TVentasFechaForm;
implementation

{$R *.DFM}






end.
