unit TraspaFecha;

interface

uses
  SysUtils, Windows, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, Quickrpt, QRCtrls, Db, DBTables;

type
  TTraspaFechaForm = class(TForm)
    Table1: TTable;
    RepTraspaFecha: TQuickRep;
    QRBand1: TQRBand;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRBand2: TQRBand;
    QRExpr2: TQRExpr;
    QRExpr4: TQRExpr;
    QRExpr5: TQRExpr;
    QRExpr6: TQRExpr;
    QRLabel14: TQRLabel;
    QRBand3: TQRBand;
    QRExpr8: TQRExpr;
    QRExpr9: TQRExpr;
    QRExpr10: TQRExpr;
    QRExpr11: TQRExpr;
    QRLabel13: TQRLabel;
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
    QRExpr3: TQRExpr;
    Table1NUMERO: TFloatField;
    Table1FECHA: TDateField;
    Table1VENDEDOR: TSmallintField;
    Table1ITEM: TSmallintField;
    Table1PRODUCTO: TStringField;
    Table1NOMBRE: TStringField;
    Table1VALOR: TFloatField;
    Table1VALORORI: TFloatField;
    Table1DESCUENTO: TFloatField;
    Table1CANTIDAD: TSmallintField;
    Table1PROCESADO: TBooleanField;
    Table1DOCUMENTO: TStringField;
    Table1IMPRESO: TBooleanField;
    QRDBText7: TQRDBText;
    QRLabel2: TQRLabel;
    QRExpr7: TQRExpr;
    QRLabel9: TQRLabel;
    QRExpr12: TQRExpr;
    QRExpr13: TQRExpr;
  private
  end;

var
  TraspaFechaForm: TTraspaFechaForm;
implementation

{$R *.DFM}







end.
