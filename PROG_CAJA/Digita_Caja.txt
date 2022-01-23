unit Digita_Caja;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, Db, DBTables, StdCtrls, Numedit, Menus, Impresion, ComCtrls,
  Mask, Datos, Cheques;

type
  TCajaForm = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    PNumeroBoleta: TPanel;
    PNumeroFactura: TPanel;
    Correlativos: TTable;
    DSCorrelativos: TDataSource;
    CorrelativosEGRESONOW: TFloatField;
    CorrelativosANTINOW: TFloatField;
    CorrelativosBOLETAINI: TFloatField;
    CorrelativosBOLETAFIN: TFloatField;
    CorrelativosBOLETASIG: TFloatField;
    CorrelativosFACTURAINI: TFloatField;
    CorrelativosFACTURAFIN: TFloatField;
    CorrelativosFACTURASIG: TFloatField;
    Impresoras: TTable;
    DSImpresoras: TDataSource;
    ImpresorasTERMINALID: TStringField;
    ImpresorasPUERTABOL: TStringField;
    ImpresorasPUERTAFAC: TStringField;
    Panel6: TPanel;
    Label1: TLabel;
    NumeroVale: TNumEdit;
    Panel7: TPanel;
    Label2: TLabel;
    PTotalVenta: TPanel;
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
    ValesCANTIDAD: TSmallintField;
    ValesPROCESADO: TBooleanField;
    ValesDOCUMENTO: TStringField;
    FormaPagoMenu: TPopupMenu;
    EFECTIVO1: TMenuItem;
    CHEQUE1: TMenuItem;
    CREDITO1: TMenuItem;
    N1: TMenuItem;
    CANCELAR1: TMenuItem;
    DetalleVenta: TTable;
    DSDetalleVenta: TDataSource;
    DetalleVentaNUMERO: TFloatField;
    DetalleVentaTIPODOC: TStringField;
    DetalleVentaFORMAPAGO: TStringField;
    DetalleVentaOCOMPRA: TFloatField;
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
    ProdVendidos: TTable;
    DSProdVendidos: TDataSource;
    Productos: TTable;
    DSProductos: TDataSource;
    ProductosCODIGO: TStringField;
    ProductosSTOCK: TFloatField;
    ValesDESCUENTO: TFloatField;
    ProdVendidosNUMERO: TFloatField;
    ProdVendidosFECHA: TDateField;
    ProdVendidosITEM: TSmallintField;
    ProdVendidosCODIGO: TStringField;
    ProdVendidosNOMBRE: TStringField;
    ProdVendidosPRECIO1: TFloatField;
    ProdVendidosDESCUENTO: TFloatField;
    ProdVendidosPRECIO2: TFloatField;
    ProdVendidosCANTIDAD: TSmallintField;
    ProdVendidosVENDEDOR: TSmallintField;
    Status: TStatusBar;
    Timer1: TTimer;
    MenuSalir: TPopupMenu;
    SALIR1: TMenuItem;
    N2: TMenuItem;
    CANCELAR2: TMenuItem;
    DetalleVentaFECHAEMI: TDateField;
    ValesIMPRESO: TBooleanField;
    procedure FormCreate(Sender: TObject);
    procedure NumeroValeKeyPress(Sender: TObject; var Key: Char);
    procedure SALIR1Click(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure EFECTIVO1Click(Sender: TObject);
    procedure CHEQUE1Click(Sender: TObject);
    procedure CREDITO1Click(Sender: TObject);
    procedure CANCELAR1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  CajaForm: TCajaForm;
  F                      : TextFile;
  CountFac, Items, Lineas: Integer;
  Numero, SumaValorOri   : Real;
  SumaPrecio, SumaDesc   : Real;
  AcumDesc, AcumTotal    : Real;
  BolIni, BolFin, BolSig : Real;
  FacIni, FacFin, FacSig : Real;
  BolPort, FacPort       : String;
  TerminalId, TipoDoc    : String;
  Imprimir               : Boolean;
  Fecha                  : String;
implementation

{$R *.DFM}


procedure TCajaForm.FormCreate(Sender: TObject);
begin
  TerminalId := 'CAJA UNO';
  Fecha := DateToStr(Now);
  Status.Panels[0].Text := Fecha;
  CajaForm.Left := 0;
  CajaForm.Top  := 0;
  CajaForm.Height := 480;
  CajaForm.Width  := 640;
{Inicio ********* Asignacion de Puertas de Impresoras *********************}
  Impresoras.Open;
  Impresoras.IndexFieldNames := 'TERMINALID';
  Impresoras.SetKey;
  If Not Impresoras.FindKey([TerminalId]) Then
    Begin
      MessageBox(Handle, 'TERMINAL NO DEFINIDO.', 'ADVERTENCIA', mb_Ok Or mb_IconStop Or mb_DefButton1);
      Halt;
    End
  Else
    Begin
      BolPort := ImpresorasPuertaBol.Value;
      FacPort := ImpresorasPuertaFac.Value;
    End;
  Impresoras.Close;
{FIN    ********* Asignacion de Puertas de Impresoras *********************}

{Inicio *********  Asignacion Correlativos Iniciales  *********************}
  Correlativos.Open;
  Correlativos.First;
  BolIni := CorrelativosBoletaIni.AsFloat;
  BolFin := CorrelativosBoletaFin.AsFloat;
  BolSig := CorrelativosBoletaSig.AsFloat;
  FacIni := CorrelativosFacturaIni.AsFloat;
  FacFin := CorrelativosFacturaFin.AsFloat;
  FacSig := CorrelativosFacturaSig.AsFloat;
  Correlativos.Close;
{FIN    *********  Asignacion Correlativos Iniciales  *********************}

  PNumeroBoleta.Caption  := Format('%10.0n', [BolSig]);
  PNumeroFactura.Caption := Format('%10.0n', [FacSig]);
end;

procedure TCajaForm.NumeroValeKeyPress(Sender: TObject; var Key: Char);
Var
  OkVale : Boolean;
begin
  If Key = #13 Then
    Begin
      OkVale := False;
      NumeroVale.Enabled := False;
      Numero := StrToFloat(NumeroVale.Text);
      SumaValorOri := 0;
      SumaPrecio   := 0;
      SumaDesc     := 0;
      Items        := 0;
      Vales.Open;
      Vales.First;
      While Not Vales.EOF Do
        Begin
          If (ValesNumero.Value = Numero) And (ValesProcesado.Value = False) Then
            Begin
              Inc(Items);
              OkVale := True;
              TipoDoc := ValesDocumento.Value;
              SumaValorOri := ValesValorOri.AsFloat * ValesCantidad.AsFloat;
              SumaPrecio   := SumaPrecio + (ValesValor.AsFloat * ValesCantidad.AsFloat);
              SumaDesc     := SumaDesc + (ValesDescuento.Value * ValesCantidad.Value);
              Vales.Next;
            End
          Else
            Begin
              Vales.Next;
            End;
        End; {While}
      Vales.Close;
      CountFac := (Items Div 22);
      If ((Items Mod 22) <> 0 )Then
        Begin
          CountFac := CountFac + 1;
        End;
      If (OkVale = True) Then
        Begin
          PTotalVenta.Caption := FloatToStr(SumaPrecio);
          FormaPagoMenu.PopUp(500, 100);
        End
      Else
        Begin
          NumeroVale.Enabled := True;
          NumeroVale.Text := '';
          NumeroVale.SetFocus;
          PTotalVenta.Caption := '';
        End;
    End;
end;



procedure TCajaForm.SALIR1Click(Sender: TObject);
begin
  Close;
end;


procedure TCajaForm.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  Case Key Of
    VK_F10 : Begin
               MenuSalir.PopUp(500, 100);
             End;
  End;
end;


procedure TCajaForm.EFECTIVO1Click(Sender: TObject);
Var
  I, Mensaje : Integer;
begin
  If (TipoDoc = 'B') Then
    Begin
      Imprimir := ImprimirBoleta(BolPort, PTotalVenta.Caption, PNumeroBoleta.Caption);
    End
  Else
    Begin
      Repeat
        DatosForm.ShowModal;
        Mensaje := MessageBox(Handle, '¿ DATOS CORRECTOS ?', 'Información Clientes', mb_YESNOCANCEL or mb_IconQuestion or mb_DefButton1);
        Case Mensaje Of
          2 : Begin {Cancela Operacion}
                PTotalVenta.Caption := '';
                NumeroVale.Enabled := True;
                NumeroVale.Text := '';
                NumeroVale.SetFocus;
                Exit;
              End;
          6 : Begin {Datos Correctos}
                For I := 1 To CountFac Do
                  Begin
                    MessageBox(Handle, 'ASEGURESE QUE LA FACTURA SE ENCUENTRE EN LA POSICION CORRECTA', 'AVISO IMPORTANTE', mb_YESNO or mb_IconStop or mb_DefButton1);
                    AssignFile(F, 'C:\HeadFact.Txt');
                    ReWrite(F);
                    WriteLn(F, DatosForm.Rut.Text);
                    WriteLn(F, DatosForm.Dig.Text);
                    WriteLn(F, DatosForm.Nombre.Text);
                    WriteLn(F, DatosForm.Direccion.Text);
                    WriteLn(F, DatosForm.Fono.Text);
                    WriteLn(F, DatosForm.Fax.Text);
                    WriteLn(F, DatosForm.Comuna.Text);
                    WriteLn(F, DatosForm.Ciudad.Text);
                    WriteLn(F, DatosForm.Giro.Text);
                    WriteLn(F, 'EFECTIVO');
                    WriteLn(F, DatosForm.RutRet.Text + '-' + DatosForm.DigRet.Text);
                    WriteLn(F, DatosForm.NomRet.Text);
                    CloseFile(F);
                    AssignFile(F, 'C:\Lineas.Txt');
                    ReWrite(F); CloseFile(F);
                    Vales.Open;
                    Vales.First;
                    Lineas := 0; AcumDesc := 0; AcumTotal := 0;
                    While (Not Vales.EOF) Do
                      If (ValesNumero.Value = Numero) And (ValesImpreso.Value = False) And (Lineas < 20)Then
                        Begin
                          AssignFile(F, 'C:\Lineas.Txt');
                          Append(F);
                          WriteLn(F, FloatToStr(ValesCantidad.Value));
                          WriteLn(F, ValesNombre.Value);
                          WriteLn(F, FloatToStr(ValesValorOri.Value));
                          WriteLn(F, FloatToStr((ValesValorOri.Value * ValesCantidad.Value)));
{************************ Rebaja de Stock del Maestro de Articulos *****************}
                          Productos.Open;
                          Productos.IndexFieldNames := 'CODIGO';
                          Productos.SetKey;
                          If Not Productos.FindKey([ValesProducto.Value]) Then
                            Begin
                            End
                          Else
                            Begin
                              Productos.Edit;
                              ProductosStock.Value        := ProductosStock.Value - ValesCantidad.Value;
                              Productos.Post;
                              Productos.Close;
                            End;
{************************ Grabacion Codigo Productos Vendidos, Cantidad, Vendedor, Etc.}
                          ProdVendidos.Open;
                          ProdVendidos.Append;
                          ProdVendidosNumero.Value    := FacSig;
                          ProdVendidosFecha.Value     := StrToDateTime(Fecha);
                          ProdVendidosItem.Value      := ValesItem.Value;
                          ProdVendidosCodigo.Value    := ValesProducto.Value;
                          ProdVendidosNombre.Value    := ValesNombre.Value;
                          ProdVendidosPrecio1.Value   := ValesValorOri.Value;
                          ProdVendidosDescuento.Value := ValesDescuento.Value;
                          ProdVendidosPrecio2.Value   := ValesValor.Value;
                          ProdVendidosCantidad.Value  := ValesCantidad.Value;
                          ProdVendidosVendedor.Value  := ValesVendedor.Value;
                          ProdVendidos.Post;
                          ProdVendidos.Close;
                          Inc(Lineas);
                          AcumDesc  := AcumDesc + (ValesDescuento.Value * ValesCantidad.Value);
                          AcumTotal := AcumTotal + (ValesCantidad.Value * ValesValorOri.Value);
                          Vales.Edit;
                          ValesProcesado.Value := True;
                          ValesImpreso.Value   := True;
                          Vales.Post;
                          Vales.Next;
                          CloseFile(F);
                        End
                      Else
                        Begin
                          Vales.Next;
                        End;
                    Imprimir := ImprimeCabecera(FacPort, Lineas, PNumeroFactura.Caption, AcumDesc, AcumTotal);
{************************ Grabacion del Detalle del Documento****************}
                    DetalleVenta.Open;
                    DetalleVenta.Append;
                    DetalleVentaNumero.Value     := FacSig;
                    DetalleVentaTipoDoc.Value    := 'FACTURA';
                    DetalleVentaRutFactura.Value := StrToFloat(DatosForm.Rut.Text);
                    DetalleVentaRutRetira.Value  := DatosForm.RutRet.Text + '-' + DatosForm.DigRet.Text;
                    DetalleVentaNomRetira.Value  := DatosForm.NomRet.Text;
                    DetalleVentaSubTotal.Value   := AcumTotal;
                    DetalleVentaDescuento.Value  := AcumDesc;
                    DetalleVentaNeto.Value       := (AcumTotal - AcumDesc) / 1.18;
                    DetalleVentaIva.Value        := ((AcumTotal - AcumDesc) / 1.18) * 0.18;
                    DetalleVentaTotal.Value      := (AcumTotal - AcumDesc);
                    DetalleVentaFormapago.Value  := 'EFECTIVO';
                    DetalleVentaFechaEmi.Value   := StrToDateTime(Fecha);
                    DetalleVenta.Post;
                    DetalleVenta.Close;
                    Vales.Close;
                    Lineas := 0; AcumDesc := 0; AcumTotal := 0;
{****************** Cambio de Correlativos **********8}
                    Correlativos.Open;
                    Correlativos.First;
                    Correlativos.Edit;
                    CorrelativosFacturaSig.Value  := CorrelativosFacturaSig.Value + 1;
                    FacSig := FacSig + 1;
                    PNumeroFactura.Caption  := Format('%10.0n', [FacSig]);
                    Correlativos.Post;
                    Correlativos.Close;
                  End;
              End;
        End;
      Until (Mensaje = 2) Or (Mensaje = 6);
      Vales.Close;
    End;

{******** Inicio Grabacion Tipo Documento Emitido, Detalle Valores }
  If TipoDoc = 'B' Then
    Begin
      DetalleVenta.Open;
      DetalleVenta.Append;
      DetalleVentaNumero.Value    := BolSig;
      DetalleVentaTipoDoc.Value   := 'BOLETA';
      DetalleVentaSubTotal.Value   := SumaPrecio;
      DetalleVentaDescuento.Value  := SumaDesc;
      DetalleVentaNeto.Value       := SumaPrecio / 1.18;
      DetalleVentaIva.Value        := ((SumaPrecio / 1.18) * 0.18);
      DetalleVentaFormapago.Value := 'EFECTIVO';
      DetalleVentaFechaEmi.Value  := StrToDateTime(Fecha);
      DetalleVentaTotal.Value := StrToFloat(PTotalVenta.Caption);
      DetalleVenta.Post;
      DetalleVenta.Close;

      Vales.Open;
      Vales.First;
      While Not Vales.EOF Do
        Begin
          If (ValesNumero.Value = Numero) And (ValesProcesado.Value = False) And (TipoDoc = 'B')Then
            Begin
              Productos.Open;
              Productos.IndexFieldNames := 'CODIGO';
              Productos.SetKey;
              If Not Productos.FindKey([ValesProducto.Value]) Then
                Begin
                End
              Else
                Begin
                  Productos.Edit;
                  ProductosStock.Value        := ProductosStock.Value - ValesCantidad.Value;
                  Productos.Post;
                  ProdVendidos.Open;
                  ProdVendidos.Append;
                  ProdVendidosNumero.Value    := BolSig;
                  ProdVendidosFecha.Value     := StrToDateTime(Fecha);
                  ProdVendidosItem.Value      := ValesItem.Value;
                  ProdVendidosCodigo.Value    := ValesProducto.Value;
                  ProdVendidosNombre.Value    := ValesNombre.Value;
                  ProdVendidosPrecio1.Value   := ValesValorOri.Value;
                  ProdVendidosDescuento.Value := ValesDescuento.Value;
                  ProdVendidosPrecio2.Value   := ValesValor.Value;
                  ProdVendidosCantidad.Value  := ValesCantidad.Value;
                  ProdVendidosVendedor.Value  := ValesVendedor.Value;
                  ProdVendidos.Post;
                  Vales.Edit;
                  ValesProcesado.Value := True;
                  Vales.Post;
                End;
              Vales.Next;
            End
          Else
            Begin
             Vales.Next;
            End;
        End; {While}
      Productos.Close;
      ProdVendidos.Close;
      Vales.Close;

      Correlativos.Open;
      Correlativos.First;
      Correlativos.Edit;
      CorrelativosBoletaSig.Value  := CorrelativosBoletaSig.Value + 1;
      BolSig := BolSig + 1;
      PNumeroBoleta.Caption  := Format('%10.0n', [BolSig]);
      Correlativos.Post;
      Correlativos.Close;
    End;

  DatosForm.Rut.Text  := ''; DatosForm.Dig.Text := ''; DatosForm.Nombre.Text := ''; DatosForm.Direccion.Text := '';
  DatosForm.Fono.Text := ''; DatosForm.Fax.Text := ''; DatosForm.Comuna.Text := ''; DatosForm.Ciudad.Text    := '';
  DatosForm.Giro.Text := '';

  NumeroVale.Enabled := True;
  NumeroVale.Text := '';
  NumeroVale.SetFocus;
  PTotalVenta.Caption := '';
end;


procedure TCajaForm.CHEQUE1Click(Sender: TObject);
Var
  I, MensajeDatos, MensajeCheque : Integer;
begin
  If TipoDoc = 'B' Then
    Begin
      Repeat
        ChequeForm.ShowModal;
        MensajeCheque := MessageBox(Handle, '¿ DATOS CORRECTOS ?', 'Información Clientes', mb_YESNOCANCEL or mb_IconQuestion or mb_DefButton1);
        Case MensajeCheque Of
          2 : Begin {Cancela Operacion}
                PTotalVenta.Caption := '';
                NumeroVale.Enabled := True;
                NumeroVale.Text := '';
                NumeroVale.SetFocus;
                Exit;
              End;
          6 : Begin {Datos Correctos}
               {Procesos de Impresion de Boleta}
               Imprimir := ImprimirBoleta(BolPort, PTotalVenta.Caption, PNumeroBoleta.Caption);
              End;
        End;
      Until (MensajeCheque = 2) Or (MensajeCheque = 6);
    End
  Else
    Begin
      Repeat
        DatosForm.ShowModal;
        MensajeDatos := MessageBox(Handle, '¿ DATOS CORRECTOS ?', 'Información Clientes', mb_YESNOCANCEL or mb_IconQuestion or mb_DefButton1);
        Case MensajeDatos Of
          2 : Begin {Cancela Operacion}
                PTotalVenta.Caption := '';
                NumeroVale.Enabled := True;
                NumeroVale.Text := '';
                NumeroVale.SetFocus;
                Exit;
              End;
          6 : Begin {Datos Correctos}
                Repeat
                  ChequeForm.ShowModal;
                  MensajeCheque := MessageBox(Handle, '¿ DATOS CORRECTOS ?', 'Información Clientes', mb_YESNOCANCEL or mb_IconQuestion or mb_DefButton1);
                  Case MensajeCheque Of
                    2 : Begin {Cancela Operacion}
                          PTotalVenta.Caption := '';
                          NumeroVale.Enabled := True;
                          NumeroVale.Text := '';
                          NumeroVale.SetFocus;
                          Exit;
                        End;
                    6 : Begin {Datos Correctos}
                          For I := 1 To CountFac Do
                            Begin
                              MessageBox(Handle, 'ASEGURESE QUE LA FACTURA SE ENCUENTRE EN LA POSICION CORRECTA', 'AVISO IMPORTANTE', mb_YESNO or mb_IconStop or mb_DefButton1);
                              AssignFile(F, 'C:\HeadFact.Txt');
                              ReWrite(F);
                              WriteLn(F, DatosForm.Rut.Text);
                              WriteLn(F, DatosForm.Dig.Text);
                              WriteLn(F, DatosForm.Nombre.Text);
                              WriteLn(F, DatosForm.Direccion.Text);
                              WriteLn(F, DatosForm.Fono.Text);
                              WriteLn(F, DatosForm.Fax.Text);
                              WriteLn(F, DatosForm.Comuna.Text);
                              WriteLn(F, DatosForm.Ciudad.Text);
                              WriteLn(F, DatosForm.Giro.Text);
                              WriteLn(F, 'EFECTIVO');
                              WriteLn(F, DatosForm.RutRet.Text + '-' + DatosForm.DigRet.Text);
                              WriteLn(F, DatosForm.NomRet.Text);
                              CloseFile(F);
                              AssignFile(F, 'C:\Lineas.Txt');
                              ReWrite(F); CloseFile(F);
                              Vales.Open;
                              Vales.First;
                              Lineas := 0; AcumDesc := 0; AcumTotal := 0;
                              While (Not Vales.EOF) {Or (Lineas = 20)} Do
                                If (ValesNumero.Value = Numero) And (ValesImpreso.Value = False) And (Lineas < 20)Then
                                  Begin
                                    AssignFile(F, 'C:\Lineas.Txt');
                                    Append(F);
                                    WriteLn(F, FloatToStr(ValesCantidad.Value));
                                    WriteLn(F, ValesNombre.Value);
                                    WriteLn(F, FloatToStr(ValesValorOri.Value));
                                    WriteLn(F, FloatToStr((ValesValorOri.Value * ValesCantidad.Value)));
{************************ Rebaja de Stock del Maestro de Articulos *****************}
                                    Productos.Open;
                                    Productos.IndexFieldNames := 'CODIGO';
                                    Productos.SetKey;
                                    If Not Productos.FindKey([ValesProducto.Value]) Then
                                      Begin
                                      End
                                    Else
                                      Begin
                                        Productos.Edit;
                                        ProductosStock.Value := ProductosStock.Value - ValesCantidad.Value;
                                        Productos.Post;
                                        Productos.Close;
                                      End;
{************************ Grabacion Codigo Productos Vendidos, Cantidad, Vendedor, Etc.}
                                    ProdVendidos.Open;
                                    ProdVendidos.Append;
                                    ProdVendidosNumero.Value    := FacSig;
                                    ProdVendidosFecha.Value     := StrToDateTime(Fecha);
                                    ProdVendidosItem.Value      := ValesItem.Value;
                                    ProdVendidosCodigo.Value    := ValesProducto.Value;
                                    ProdVendidosNombre.Value    := ValesNombre.Value;
                                    ProdVendidosPrecio1.Value   := ValesValorOri.Value;
                                    ProdVendidosDescuento.Value := ValesDescuento.Value;
                                    ProdVendidosPrecio2.Value   := ValesValor.Value;
                                    ProdVendidosCantidad.Value  := ValesCantidad.Value;
                                    ProdVendidosVendedor.Value  := ValesVendedor.Value;
                                    ProdVendidos.Post;
                                    ProdVendidos.Close;
                                    Inc(Lineas);
                                    AcumDesc  := AcumDesc + (ValesDescuento.Value * ValesCantidad.Value);
                                    AcumTotal := AcumTotal + (ValesCantidad.Value * ValesValorOri.Value);
                                    Vales.Edit;
                                    ValesProcesado.Value := True;
                                    ValesImpreso.Value   := True;
                                    Vales.Post;
                                    Vales.Next;
                                    CloseFile(F);
                                  End
                                Else
                                  Begin
                                    Vales.Next;
                                  End;
                              Imprimir := ImprimeCabecera(FacPort, Lineas, PNumeroFactura.Caption, AcumDesc, AcumTotal);
{************************ Grabacion del Detalle del Documento****************}
                              DetalleVenta.Open;
                              DetalleVenta.Append;
                              DetalleVentaNumero.Value     := FacSig;
                              DetalleVentaTipoDoc.Value    := 'FACTURA';
                              DetalleVentaRutFactura.Value := StrToFloat(DatosForm.Rut.Text);
                              DetalleVentaRutRetira.Value  := DatosForm.RutRet.Text + '-' + DatosForm.DigRet.Text;
                              DetalleVentaNomRetira.Value  := DatosForm.NomRet.Text;
                              DetalleVentaSubTotal.Value   := AcumTotal;
                              DetalleVentaDescuento.Value  := AcumDesc;
                              DetalleVentaNeto.Value       := (AcumTotal - AcumDesc) / 1.18;
                              DetalleVentaIva.Value        := ((AcumTotal - AcumDesc) / 1.18) * 0.18;
                              DetalleVentaTotal.Value      := (AcumTotal - AcumDesc);
                              DetalleVentaFormapago.Value  := 'CHEQUE';
                              DetalleVentaFechaEmi.Value   := StrToDateTime(Fecha);
                              DetalleVenta.Post;
                              DetalleVenta.Close;
                              Vales.Close;
                              Lineas := 0; AcumDesc := 0; AcumTotal := 0;
{****************** Cambio de Correlativos **********8}
                              Correlativos.Open;
                              Correlativos.First;
                              Correlativos.Edit;
                              CorrelativosFacturaSig.Value  := CorrelativosFacturaSig.Value + 1;
                              FacSig := FacSig + 1;
                              PNumeroFactura.Caption  := Format('%10.0n', [FacSig]);
                              Correlativos.Post;
                              Correlativos.Close;
                            End;
                        End;
                  End;
                Until (MensajeCheque = 2) Or (MensajeCheque = 6);
              End;
        End;
      Until (MensajeDatos = 2) Or (MensajeDatos = 6);
    End;

{******** Inicio Grabacion Tipo Documento Emitido, Detalle Valores }
  If TipoDoc = 'B' Then
    Begin
      DetalleVenta.Open;
      DetalleVenta.Append;
      DetalleVentaNumero.Value    := BolSig;
      DetalleVentaTipoDoc.Value   := 'BOLETA';
      DetalleVentaSubTotal.Value   := SumaPrecio;
      DetalleVentaDescuento.Value  := SumaDesc;
      DetalleVentaNeto.Value       := SumaPrecio / 1.18;
      DetalleVentaIva.Value        := ((SumaPrecio / 1.18) * 0.18);
      DetalleVentaFormapago.Value := 'CHEQUE';
      DetalleVentaBanco.Value     := ChequeForm.Banco.Text;
      DetalleVentaSerie.Value     := ChequeForm.Serie.Text;
      DetalleVentaCuenta.Value    := ChequeForm.Cuenta.Text;
      DetalleVentaFechaCheq.Value := StrToDateTime(ChequeForm.Fecha.Text);
      DetalleVentaFechaEmi.Value  := StrToDate(Fecha);
      DetalleVentaTotal.Value := StrToFloat(PTotalVenta.Caption);
      DetalleVenta.Post;
      DetalleVenta.Close;
{******** Fin    Grabacion Tipo Documento Emitido, Detalle Valores }

{******** Inicio Grabacion Codigoa Productos Vendidos, Cantidad, Vendedor, Etc.}
      Productos.Open;
      ProdVendidos.Open;
      Vales.Open;
      Vales.First;
      While Not Vales.EOF Do
        Begin
          If (ValesNumero.Value = Numero) And (ValesProcesado.Value = False) Then
            Begin
              Productos.IndexFieldNames := 'CODIGO';
              Productos.SetKey;
              If Not Productos.FindKey([ValesProducto.Value]) Then
                Begin
                End
              Else
                Begin
                  Productos.Edit;
                  ProductosStock.Value        := ProductosStock.Value - ValesCantidad.Value;
                  Productos.Post;
                  ProdVendidos.Append;
                  ProdVendidosNumero.Value    := BolSig;
                  ProdVendidosFecha.Value     := StrToDateTime(Fecha);
                  ProdVendidosItem.Value      := ValesItem.Value;
                  ProdVendidosCodigo.Value    := ValesProducto.Value;
                  ProdVendidosNombre.Value    := ValesNombre.Value;
                  ProdVendidosPrecio1.Value   := ValesValorOri.Value;
                  ProdVendidosDescuento.Value := ValesDescuento.Value;
                  ProdVendidosPrecio2.Value   := ValesValor.Value;
                  ProdVendidosCantidad.Value  := ValesCantidad.Value;
                  ProdVendidosVendedor.Value  := ValesVendedor.Value;
                  ProdVendidos.Post;
                  Vales.Edit;
                  ValesProcesado.Value := True;
                  Vales.Post;
                End;
              Vales.Next;
            End
          Else
            Begin
              Vales.Next;
            End;
        End; {While}
      Productos.Close;
      ProdVendidos.Close;
      Vales.Close;
      Correlativos.Open;
      Correlativos.First;
      Correlativos.Edit;
      CorrelativosBoletaSig.Value  := CorrelativosBoletaSig.Value + 1;
      BolSig := BolSig + 1;
      PNumeroBoleta.Caption  := Format('%10.0n', [BolSig]);
      Correlativos.Post;
      Correlativos.Close;
    End;

  DatosForm.Rut.Text  := ''; DatosForm.Dig.Text := ''; DatosForm.Nombre.Text := ''; DatosForm.Direccion.Text := '';
  DatosForm.Fono.Text := ''; DatosForm.Fax.Text := ''; DatosForm.Comuna.Text:= ''; DatosForm.Ciudad.Text    := '';
  DatosForm.Giro.Text := '';
  ChequeForm.Banco.Text  := ''; ChequeForm.Serie.Text := ''; ChequeForm.Cuenta.Text := '';
  ChequeForm.Fecha.Text := '';  ChequeForm.Monto.Text := '';

  NumeroVale.Enabled := True;
  NumeroVale.Text := '';
  NumeroVale.SetFocus;
  PTotalVenta.Caption := '';
end;

procedure TCajaForm.CREDITO1Click(Sender: TObject);
Var
  I, MensajeDatos, MensajeCheque : Integer;
begin
  If TipoDoc = 'B' Then
    Begin
      Repeat
        ChequeForm.ShowModal;
        MensajeCheque := MessageBox(Handle, '¿ DATOS CORRECTOS ?', 'Información Clientes', mb_YESNOCANCEL or mb_IconQuestion or mb_DefButton1);
        Case MensajeCheque Of
          2 : Begin {Cancela Operacion}
                PTotalVenta.Caption := '';
                NumeroVale.Enabled := True;
                NumeroVale.Text := '';
                NumeroVale.SetFocus;
                Exit;
              End;
          6 : Begin {Datos Correctos}
               {Procesos de Impresion de Boleta}
               Imprimir := ImprimirBoleta(BolPort, PTotalVenta.Caption, PNumeroBoleta.Caption);
              End;
        End;
      Until (MensajeCheque = 2) Or (MensajeCheque = 6);
    End
  Else
    Begin
      Repeat
        DatosForm.ShowModal;
        MensajeDatos := MessageBox(Handle, '¿ DATOS CORRECTOS ?', 'Información Clientes', mb_YESNOCANCEL or mb_IconQuestion or mb_DefButton1);
        Case MensajeDatos Of
          2 : Begin {Cancela Operacion}
                PTotalVenta.Caption := '';
                NumeroVale.Enabled := True;
                NumeroVale.Text := '';
                NumeroVale.SetFocus;
                Exit;
              End;
          6 : Begin {Datos Correctos}
                Repeat
                  ChequeForm.ShowModal;
                  MensajeCheque := MessageBox(Handle, '¿ DATOS CORRECTOS ?', 'Información Clientes', mb_YESNOCANCEL or mb_IconQuestion or mb_DefButton1);
                  Case MensajeCheque Of
                    2 : Begin {Cancela Operacion}
                          PTotalVenta.Caption := '';
                          NumeroVale.Enabled := True;
                          NumeroVale.Text := '';
                          NumeroVale.SetFocus;
                          Exit;
                        End;
                    6 : Begin {Datos Correctos}
                          For I := 1 To CountFac Do
                            Begin
                              MessageBox(Handle, 'ASEGURESE QUE LA FACTURA SE ENCUENTRE EN LA POSICION CORRECTA', 'AVISO IMPORTANTE', mb_YESNO or mb_IconStop or mb_DefButton1);
                              AssignFile(F, 'C:\HeadFact.Txt');
                              ReWrite(F);
                              WriteLn(F, DatosForm.Rut.Text);
                              WriteLn(F, DatosForm.Dig.Text);
                              WriteLn(F, DatosForm.Nombre.Text);
                              WriteLn(F, DatosForm.Direccion.Text);
                              WriteLn(F, DatosForm.Fono.Text);
                              WriteLn(F, DatosForm.Fax.Text);
                              WriteLn(F, DatosForm.Comuna.Text);
                              WriteLn(F, DatosForm.Ciudad.Text);
                              WriteLn(F, DatosForm.Giro.Text);
                              WriteLn(F, 'EFECTIVO');
                              WriteLn(F, DatosForm.RutRet.Text + '-' + DatosForm.DigRet.Text);
                              WriteLn(F, DatosForm.NomRet.Text);
                              CloseFile(F);
                              AssignFile(F, 'C:\Lineas.Txt');
                              ReWrite(F); CloseFile(F);
                              Vales.Open;
                              Vales.First;
                              Lineas := 0; AcumDesc := 0; AcumTotal := 0;
                              While (Not Vales.EOF) {Or (Lineas = 20)} Do
                                If (ValesNumero.Value = Numero) And (ValesImpreso.Value = False) And (Lineas < 20)Then
                                  Begin
                                    AssignFile(F, 'C:\Lineas.Txt');
                                    Append(F);
                                    WriteLn(F, FloatToStr(ValesCantidad.Value));
                                    WriteLn(F, ValesNombre.Value);
                                    WriteLn(F, FloatToStr(ValesValorOri.Value));
                                    WriteLn(F, FloatToStr((ValesValorOri.Value * ValesCantidad.Value)));
{************************ Rebaja de Stock del Maestro de Articulos *****************}
                                    Productos.Open;
                                    Productos.IndexFieldNames := 'CODIGO';
                                    Productos.SetKey;
                                    If Not Productos.FindKey([ValesProducto.Value]) Then
                                      Begin
                                      End
                                    Else
                                      Begin
                                        Productos.Edit;
                                        ProductosStock.Value := ProductosStock.Value - ValesCantidad.Value;
                                        Productos.Post;
                                        Productos.Close;
                                      End;
{************************ Grabacion Codigo Productos Vendidos, Cantidad, Vendedor, Etc.}
                                    ProdVendidos.Open;
                                    ProdVendidos.Append;
                                    ProdVendidosNumero.Value    := FacSig;
                                    ProdVendidosFecha.Value     := StrToDateTime(Fecha);
                                    ProdVendidosItem.Value      := ValesItem.Value;
                                    ProdVendidosCodigo.Value    := ValesProducto.Value;
                                    ProdVendidosNombre.Value    := ValesNombre.Value;
                                    ProdVendidosPrecio1.Value   := ValesValorOri.Value;
                                    ProdVendidosDescuento.Value := ValesDescuento.Value;
                                    ProdVendidosPrecio2.Value   := ValesValor.Value;
                                    ProdVendidosCantidad.Value  := ValesCantidad.Value;
                                    ProdVendidosVendedor.Value  := ValesVendedor.Value;
                                    ProdVendidos.Post;
                                    ProdVendidos.Close;
                                    Inc(Lineas);
                                    AcumDesc  := AcumDesc + (ValesDescuento.Value * ValesCantidad.Value);
                                    AcumTotal := AcumTotal + (ValesCantidad.Value * ValesValorOri.Value);
                                    Vales.Edit;
                                    ValesProcesado.Value := True;
                                    ValesImpreso.Value   := True;
                                    Vales.Post;
                                    Vales.Next;
                                    CloseFile(F);
                                  End
                                Else
                                  Begin
                                    Vales.Next;
                                  End;
                              Imprimir := ImprimeCabecera(FacPort, Lineas, PNumeroFactura.Caption, AcumDesc, AcumTotal);
{************************ Grabacion del Detalle del Documento****************}
                              DetalleVenta.Open;
                              DetalleVenta.Append;
                              DetalleVentaNumero.Value     := FacSig;
                              DetalleVentaTipoDoc.Value    := 'FACTURA';
                              DetalleVentaRutFactura.Value := StrToFloat(DatosForm.Rut.Text);
                              DetalleVentaRutRetira.Value  := DatosForm.RutRet.Text + '-' + DatosForm.DigRet.Text;
                              DetalleVentaNomRetira.Value  := DatosForm.NomRet.Text;
                              DetalleVentaSubTotal.Value   := AcumTotal;
                              DetalleVentaDescuento.Value  := AcumDesc;
                              DetalleVentaNeto.Value       := (AcumTotal - AcumDesc) / 1.18;
                              DetalleVentaIva.Value        := ((AcumTotal - AcumDesc) / 1.18) * 0.18;
                              DetalleVentaTotal.Value      := (AcumTotal - AcumDesc);
                              DetalleVentaFormapago.Value  := 'CHEQUE/CREDITO';
                              DetalleVentaFechaEmi.Value   := StrToDateTime(Fecha);
                              DetalleVenta.Post;
                              DetalleVenta.Close;
                              Vales.Close;
                              Lineas := 0; AcumDesc := 0; AcumTotal := 0;
{****************** Cambio de Correlativos **********8}
                              Correlativos.Open;
                              Correlativos.First;
                              Correlativos.Edit;
                              CorrelativosFacturaSig.Value  := CorrelativosFacturaSig.Value + 1;
                              FacSig := FacSig + 1;
                              PNumeroFactura.Caption  := Format('%10.0n', [FacSig]);
                              Correlativos.Post;
                              Correlativos.Close;
                            End;
                        End;
                  End;
                Until (MensajeCheque = 2) Or (MensajeCheque = 6);
              End;
        End;
      Until (MensajeDatos = 2) Or (MensajeDatos = 6);
    End;
{******** Inicio Grabacion Tipo Documento Emitido, Detalle Valores }
  If TipoDoc = 'B' Then
    Begin
      DetalleVenta.Open;
      DetalleVenta.Append;
      DetalleVentaNumero.Value    := BolSig;
      DetalleVentaTipoDoc.Value   := 'BOLETA';
      DetalleVentaSubTotal.Value   := SumaPrecio;
      DetalleVentaDescuento.Value  := SumaDesc;
      DetalleVentaNeto.Value       := SumaPrecio / 1.18;
      DetalleVentaIva.Value        := ((SumaPrecio / 1.18) * 0.18);
      DetalleVentaFormaPago.Value := 'CHEQUE/CREDITO';
      DetalleVentaBanco.Value     := ChequeForm.Banco.Text;
      DetalleVentaSerie.Value     := ChequeForm.Serie.Text;
      DetalleVentaCuenta.Value    := ChequeForm.Cuenta.Text;
      DetalleVentaFechaCheq.Value := StrToDate(ChequeForm.Fecha.Text);
      DetalleVentaFechaEmi.Value  := StrToDateTime(Fecha);
      DetalleVentaTotal.Value := StrToFloat(PTotalVenta.Caption);
      DetalleVenta.Post;
      DetalleVenta.Close;
{******** Fin    Grabacion Tipo Documento Emitido, Detalle Valores }
{******** Inicio Grabacion Codigoa Productos Vendidos, Cantidad, Vendedor, Etc.}
      Productos.Open;
      ProdVendidos.Open;
      Vales.Open;
      Vales.First;
      While Not Vales.EOF Do
        Begin
          If (ValesNumero.Value = Numero) And (ValesProcesado.Value = False) Then
            Begin
              Productos.IndexFieldNames := 'CODIGO';
              Productos.SetKey;
              If Not Productos.FindKey([ValesProducto.Value]) Then
                Begin
                End
              Else
                Begin
                  Productos.Edit;
                  ProductosStock.Value        := ProductosStock.Value - ValesCantidad.Value;
                  Productos.Post;
                  ProdVendidos.Append;
                  ProdVendidosNumero.Value    := BolSig;
                  ProdVendidosFecha.Value     := StrToDateTime(Fecha);
                  ProdVendidosItem.Value      := ValesItem.Value;
                  ProdVendidosCodigo.Value    := ValesProducto.Value;
                  ProdVendidosNombre.Value    := ValesNombre.Value;
                  ProdVendidosPrecio1.Value   := ValesValorOri.Value;
                  ProdVendidosDescuento.Value := ValesDescuento.Value;
                  ProdVendidosPrecio2.Value   := ValesValor.Value;
                  ProdVendidosCantidad.Value  := ValesCantidad.Value;
                  ProdVendidosVendedor.Value  := ValesVendedor.Value;
                  ProdVendidos.Post;
                  Vales.Edit;
                  ValesProcesado.Value := True;
                  Vales.Post;
                End;
              Vales.Next;
            End
          Else
            Begin
              Vales.Next;
            End;
        End; {While}
      Productos.Close;
      ProdVendidos.Close;
      Vales.Close;
      Correlativos.Open;
      Correlativos.First;
      Correlativos.Edit;
      CorrelativosBoletaSig.Value  := CorrelativosBoletaSig.Value + 1;
      BolSig := BolSig + 1;
      PNumeroBoleta.Caption  := Format('%10.0n', [BolSig]);
      Correlativos.Post;
      Correlativos.Close;
    End;

  DatosForm.Rut.Text  := ''; DatosForm.Dig.Text := ''; DatosForm.Nombre.Text := ''; DatosForm.Direccion.Text := '';
  DatosForm.Fono.Text := ''; DatosForm.Fax.Text := ''; DatosForm.Comuna.Text:= ''; DatosForm.Ciudad.Text    := '';
  DatosForm.Giro.Text := '';
  ChequeForm.Banco.Text  := ''; ChequeForm.Serie.Text := ''; ChequeForm.Cuenta.Text := '';
  ChequeForm.Fecha.Text := '';  ChequeForm.Monto.Text := '';

  NumeroVale.Enabled := True;
  NumeroVale.Text := '';
  NumeroVale.SetFocus;
  PTotalVenta.Caption := '';
end;


procedure TCajaForm.CANCELAR1Click(Sender: TObject);
begin
  PTotalVenta.Caption := '';
  NumeroVale.Enabled := True;
  NumeroVale.Text := '';
  NumeroVale.SetFocus;
  Exit;
end;

end.
