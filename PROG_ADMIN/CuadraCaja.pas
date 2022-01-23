unit CuadraCaja;

interface

uses
  SysUtils, Windows, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, Quickrpt, QRCtrls, Db, DBTables;

type
  TCuadraCajaForm = class(TForm)
    RepCuadra: TQuickRep;
    QRBand1: TQRBand;
    QRExpr1: TQRExpr;
    QRDBText1: TQRDBText;
    QRBand2: TQRBand;
    QRExpr2: TQRExpr;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText7: TQRDBText;
    QRExpr4: TQRExpr;
    QRExpr5: TQRExpr;
    QRExpr6: TQRExpr;
    QRExpr7: TQRExpr;
    QRLabel2: TQRLabel;
    QRBand3: TQRBand;
    QRExpr3: TQRExpr;
    QRExpr8: TQRExpr;
    QRExpr9: TQRExpr;
    QRExpr10: TQRExpr;
    QRExpr11: TQRExpr;
    QRBand4: TQRBand;
    QRLabel4: TQRLabel;
    QRSysData1: TQRSysData;
    QRSysData2: TQRSysData;
    QRLabel10: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel12: TQRLabel;
    QRLabel13: TQRLabel;
    QRLabel14: TQRLabel;
    QRLabel1: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    Table1: TTable;
    Table1NUMERO: TFloatField;
    Table1TIPODOC: TStringField;
    Table1FORMAPAGO: TStringField;
    Table1FECHAEMI: TDateField;
    Table1SUBTOTAL: TFloatField;
    Table1DESCUENTO: TFloatField;
    Table1NETO: TFloatField;
    Table1IVA: TFloatField;
    Table1TOTAL: TFloatField;
    QRExpr12: TQRExpr;
  private
  end;

var
  CuadraCajaForm: TCuadraCajaForm;
implementation

{$R *.DFM}


end.
