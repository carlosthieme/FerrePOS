unit Digita_Ventas;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, Grids, AdvGrid, StdCtrls, Db, DBTables, Numedit, Menus, DBGrids,
  ComCtrls;

type
  TIngresosForm = class(TForm)
    Panel1: TPanel;
    Grid: TAdvStringGrid;
    Panel2: TPanel;
    PNumeroVale: TPanel;
    Panel3: TPanel;
    Panel4: TPanel;
    PTotalVenta: TPanel;
    Correlativos: TTable;
    DSCorrelativos: TDataSource;
    CorrelativosVALENOW: TFloatField;
    PNombre: TPanel;
    Usuarios: TTable;
    DSUsuarios: TDataSource;
    UsuariosCODIGO: TSmallintField;
    UsuariosIDENTIFICA: TStringField;
    UsuariosNOMBRE: TStringField;
    UsuariosCLAVE: TStringField;
    Vendedor: TNumEdit;
    Productos: TTable;
    DSProductos: TDataSource;
    ProductosCODIGO: TStringField;
    ProductosALTER1: TStringField;
    ProductosALTER2: TStringField;
    ProductosNOMBRE: TStringField;
    ProductosMODIF: TBooleanField;
    ProductosPRECIO: TFloatField;
    ProductosSTOCK: TFloatField;
    ProductosCOMP1: TSmallintField;
    ProductosCOMP2: TSmallintField;
    ProductosCOMP3: TSmallintField;
    ProductosCOMP4: TSmallintField;
    ProductosCOMP5: TSmallintField;
    ProductosCOMP6: TSmallintField;
    ProductosCOMP7: TSmallintField;
    ProductosCOMP8: TSmallintField;
    ProductosCOMP9: TSmallintField;
    ProductosCOMP10: TSmallintField;
    ProductosCOMP11: TSmallintField;
    ProductosCOMP12: TSmallintField;
    ProductosCOMP13: TSmallintField;
    ProductosCOMP14: TSmallintField;
    ProductosCOMP15: TSmallintField;
    ProductosVUCOMPRA: TFloatField;
    VentaMenu: TPopupMenu;
    VENTA1: TMenuItem;
    COTIZACION1: TMenuItem;
    N1: TMenuItem;
    CANCELAR1: TMenuItem;
    PBusca: TPanel;
    EBusca: TEdit;
    GridBusca: TDBGrid;
    ProductosTIPODESC: TBooleanField;
    PClaves: TPanel;
    EIdentif: TEdit;
    EPassw: TEdit;
    UsuariosDESCUENTO: TBooleanField;
    SalirMenu: TPopupMenu;
    SALIR1: TMenuItem;
    CANCELAR2: TMenuItem;
    N2: TMenuItem;
    TipDocMenu: TPopupMenu;
    BOLETA1: TMenuItem;
    N3: TMenuItem;
    FACTURA1: TMenuItem;
    Vales: TTable;
    DSVales: TDataSource;
    ValesNUMERO: TFloatField;
    ValesFECHA: TDateField;
    ValesVENDEDOR: TSmallintField;
    ValesITEM: TSmallintField;
    ValesPRODUCTO: TStringField;
    ValesNOMBRE: TStringField;
    ValesVALOR: TFloatField;
    ValesCANTIDAD: TSmallintField;
    ValesPROCESADO: TBooleanField;
    ValesDOCUMENTO: TStringField;
    ValesVALORORI: TFloatField;
    Impresoras: TTable;
    DSImpresoras: TDataSource;
    ImpresorasTERMINALID: TStringField;
    ImpresorasPUERTAVALE: TStringField;
    ProductosDESC: TFloatField;
    ValesDESCUENTO: TFloatField;
    Status: TStatusBar;
    Timer1: TTimer;
    ValesIMPRESO: TBooleanField;
    N4: TMenuItem;
    TRASPASOAVOSS1: TMenuItem;
    procedure FormCreate(Sender: TObject);
    procedure GridGetAlignment(Sender: TObject; ARow,
      ACol: Integer; var AAlignment: TAlignment);
    procedure VendedorKeyPress(Sender: TObject; var Key: Char);
    procedure GridKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure VENTA1Click(Sender: TObject);
    procedure COTIZACION1Click(Sender: TObject);
    procedure EBuscaChange(Sender: TObject);
    procedure EBuscaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure GridBuscaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EIdentifKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EPasswKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure SALIR1Click(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BOLETA1Click(Sender: TObject);
    procedure FACTURA1Click(Sender: TObject);
    procedure GridAutoDeleteRow(Sender: TObject; aRow: Integer);
    procedure GridGetFormat(Sender: TObject; ACol: Integer;
      var AStyle: TSortStyle; var aPrefix, aSuffix: String);
    procedure GridCanEditCell(Sender: TObject; Arow, Acol: Integer;
      var canedit: Boolean);
    procedure Timer1Timer(Sender: TObject);
    procedure TipDocMenuPopup(Sender: TObject);
    procedure TRASPASOAVOSS1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  IngresosForm : TIngresosForm;
  TotalVenta   : Real;
  Items        : Integer;
  ValPort      : String;
  BolPort      : String;
  TerminalId   : String;
implementation

{$R *.DFM}

procedure TIngresosForm.FormCreate(Sender: TObject);
begin
  TerminalID := 'VENTAS UNO';
  IngresosForm.Left := 0;
  IngresosForm.Top  := 0;
  IngresosForm.Height := 480;
  IngresosForm.Width  := 640;

{Inicio : Carga Inicial de Correlativos. Apertura, Edicion y Cierre Base de Datos ***}
  Correlativos.Open;
  Correlativos.First;
  PNumeroVale.Caption := CorrelativosValeNow.AsString;
  Correlativos.Edit;
  CorrelativosValeNow.AsFloat := CorrelativosValeNow.AsFloat + 1;
  Correlativos.Post;
  Correlativos.Close;
{Fin    : Carga Inicial de Correlativos. Apertura, Edicion y Cierre Base de Datos ***}

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
      ValPort := ImpresorasPuertaVale.Value;
    End;
  Impresoras.Close;
{FIN    ********* Asignacion de Puertas de Impresoras *********************}

end;


procedure TIngresosForm.GridGetAlignment(Sender: TObject; ARow, ACol: Integer; var AAlignment: TAlignment);
begin
  If (ACol in [0, 1, 2, 3, 4, 5, 6, 7]) And (ARow = 0) Then AAlignment := taCenter;
  If (ACol in [0, 2, 3, 4, 5, 6]) And (ARow <> 0) Then AAlignment := taRightJustify;
  If (ACol in [7]) And (ARow <> 0) Then AAlignment := taLeftJustify;
end;

procedure TIngresosForm.GridCanEditCell(Sender: TObject; Arow, Acol: Integer; var canedit: Boolean);
begin
{ canedit:=(acol<>1) Or (acol<>3) Or (acol<>4) Or (acol<>6) Or (acol<>7);}
end;


procedure TIngresosForm.VendedorKeyPress(Sender: TObject; var Key: Char);
begin
  If Key = #13 Then
    Begin
      Try
        Usuarios.Open;
        Usuarios.IndexFieldNames := 'CODIGO';
        Usuarios.SetKey;
        If Not (Usuarios.FindKey([StrToInt(Vendedor.Text)])) Then
          Begin
            Vendedor.Text := '';
            Vendedor.SetFocus;
          End
        Else
          Begin
            PNombre.Caption := UsuariosIdentifica.AsString;
            Grid.SetFocus;
            Vendedor.Enabled := False;
            TotalVenta := 0;
            Boleta1.Visible := True;
            N3.Visible := True;
            Factura1.Visible := True;
            Grid.Options := [goFixedVertLine,goFixedHorzLine,goVertLine,goHorzLine,goEditing]
          End;
      Except On EConvertError Do
        Begin
          Vendedor.Text := '';
          Vendedor.SetFocus;
        End;
      End;
    End;
end;

procedure TIngresosForm.GridKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
Var
  Numero, Monto : Real;
begin
  Case Key Of
    13      : Begin
                If (Grid.Options = [goFixedVertLine,goFixedHorzLine,goVertLine,goHorzLine,goRowSelect]) Then
                  Begin
                    Key := 0;
                    PBusca.Visible := True;
                    EBusca.SetFocus;
                  End
                Else If (Grid.Options = [goFixedVertLine,goFixedHorzLine,goVertLine,goHorzLine,goEditing]) Then
                  Begin
                    Case Grid.Col Of
{Columna Codigo}      0 : Begin
                            Productos.Open;
                            If (Grid.Cells[0, Grid.Row] = '') Then
                              Begin
                                PBusca.Visible := True;
                                EBusca.SetFocus;
                              End
                            Else
                              Begin
                                Productos.IndexFieldNames := 'ALTER1';
                                Productos.SetKey;
                               {Busqueda de Productos Por Codigo Alternativo 1}
                                If Not (Productos.FindKey([Grid.Cells[0, Grid.Row]]))  Then
                                  Begin {Si No Encuentra Codigo Alternativo 1, Busca Productos por Codigo Alternativo 2}
                                    Productos.IndexFieldNames := 'ALTER2';
                                    Productos.SetKey;
                                    If Not (Productos.FindKey([Grid.Cells[0, Grid.Row]])) Then
                                      Begin {Si No Encuentra Codigo Alternativo 2}
                                        PBusca.Visible := True;
                                        EBusca.SetFocus;
                                      End
                                    Else
                                      Begin {Si Encuentra Codigo Alternativo 2}
                                        Grid.Cells[0, Grid.Row] := ProductosCodigo.AsString;
                                        Grid.Cells[1, Grid.Row] := ProductosNombre.AsString;
                                        Grid.Cells[2, Grid.Row] := ProductosPrecio.AsString;
                                        Grid.Cells[3, Grid.Row] := ProductosDesc.AsString;
                                        Grid.Cells[4, Grid.Row] := FloatToStr(ProductosPrecio.Value - ProductosDesc.Value);
                                        Grid.Cells[7, Grid.Row] := ProductosAlter1.AsString;
                                        {Si Producto Tiene Valor Fijo o Variable}
                                        If (ProductosModif.Value = True)Then
                                          Begin
                                            Grid.Col := 2;
                                          End
                                        Else
                                          Begin
                                            Grid.Col := 5;
                                          End;
                                      End;
                                  End
                                Else
                                  Begin {Si Encuentra Codigo Alternativo 1}
                                    Grid.Cells[0, Grid.Row] := ProductosCodigo.AsString;
                                    Grid.Cells[1, Grid.Row] := ProductosNombre.AsString;
                                    Grid.Cells[2, Grid.Row] := ProductosPrecio.AsString;
                                    Grid.Cells[3, Grid.Row] := ProductosDesc.AsString;
                                    Grid.Cells[4, Grid.Row] := FloatToStr(ProductosPrecio.Value - ProductosDesc.Value);
                                    Grid.Cells[7, Grid.Row] := ProductosAlter1.AsString;
                                    {Si Producto Tiene Valor Fijo o Variable}
                                    If (ProductosModif.Value = True) Then
                                      Begin
                                        Grid.Col := 2;
                                      End
                                    Else
                                      Begin
                                        Grid.Col := 5;
                                      End;
                                  End;
                              End;
                          End;
{Columna Descripcion} 1 : Begin
                            Grid.Col := 0;
                          End;
{Columna P.Unitario}  2 : Begin
                            Try
                              Numero := StrToFloat(Grid.Cells[2, Grid.Row]);
                              Grid.Cells[4, Grid.Row] := FloatToStr((StrToFloat(Grid.Cells[2, Grid.Row]) - ProductosDesc.Value));
                              Grid.Col := 5;
                            Except On EConvertError Do
                              Begin
                                Grid.Cells[2, Grid.Row] := '';
                                Grid.Col := 2;
                              End;
                            End;
                          End;
{Columna Max. Desc}   3 : Begin
                            Grid.Col := 0;
                          End;
{Columna P. Final}    4 : Begin
                            Grid.Col := 0;
                          End;
{Columna Cantidad}    5 : Begin
                            Try
                              Numero := StrToFloat(Grid.Cells[4, Grid.Row]);
                              Numero := Numero * StrToFloat(Grid.Cells[5, Grid.Row]);
                              Grid.Cells[6, Grid.Row] := FloatToStr(Numero);
                              TotalVenta := TotalVenta + Numero;
                              PTotalVenta.Caption := FloatToStr(TotalVenta);
                              Grid.Col := 0;
                              Grid.Row := Grid.Row + 1;
                              Inc(Items);
                            Except On EConvertError Do
                              Begin
                                Grid.Cells[5, Grid.Row] := '';
                                Grid.Col := 5;
                              End;
                           End;
                          End;
                      6 : Begin
                            Grid.Col := 0;
                          End;
                      7 : Begin
                            Grid.Col := 0;
                          End;
                    End;{Case Columna}
                  End;
              End;
    33..34  : Begin
                Key := 0;
              End;
    35      : Begin {Tecla FIN}
                If (Grid.Options = [goFixedVertLine,goFixedHorzLine,goVertLine,goHorzLine,goRowSelect]) Then
                  Begin
                    Grid.Tag := 10;
                    Key := 0;
                  End
                Else
                  Begin
                    Grid.Tag := 10;
                    If (Items > 0) And (Grid.Row > Items) Then
                      Begin
                        Grid.ClearRect(0, Grid.Row, 7, Grid.Row);
                        Grid.Row := Items;
                        Grid.Col := 0;
                      End
                    Else
                      If (Items = 0) And (Grid.Row = 1) Then
                        Begin
                          Key := 0;
                        End;
                    Key := 0;
                    Grid.Options := [goFixedVertLine,goFixedHorzLine,goVertLine,goHorzLine,goRowSelect];
                  End;
              End;
    37, 39  : Begin {Teclas de Flechas Izquierda o Derecha}
                Key := 0;
              End;
    38      : Begin {Flecha Arriba}
                If (Grid.Options = [goFixedVertLine,goFixedHorzLine,goVertLine,goHorzLine,goEditing]) Then
                  Begin
                    Key := 0;
                  End;
              End;
    40      : Begin {Flecha Abajo}
                If (Grid.Options = [goFixedVertLine,goFixedHorzLine,goVertLine,goHorzLine,goEditing]) Then
                  Begin
                    Key := 0;
                  End
                Else
                  Begin
                    If (Grid.Row > Items) Then
                      Begin
                        Key :=0;
                      End;
                  End;
              End;
    46      : Begin {Tecla Suprimir}
                If (Items = 0) Or (Grid.Options = [goFixedVertLine,goFixedHorzLine,goVertLine,goHorzLine,goEditing]) Or (TotalVenta = 0)Then
                  Begin
                    Key := 0;
                  End
                Else
                  Begin
                    TotalVenta := TotalVenta - StrToFloat(Grid.Cells[6, Grid.Row]);
                    PTotalVenta.Caption := FloatToStr(TotalVenta);
                  End;
              End;
    48..57,
    96..105 : Begin {Teclas de Numeros}
                Grid.Tag := 1;
                Grid.Options := [goFixedVertLine,goFixedHorzLine,goVertLine,goHorzLine,goEditing];
              End;
{    VK_F1   : Begin
                Productos.Open;
                PBusca.Visible := True;
                EBusca.SetFocus;
              End;
}
    VK_F6   : Begin {Tecla Funcion F6}
                If (Grid.Focused) And (Grid.Row <= Items) Then
                  Begin
                    PClaves.Visible := True;
                    EIDentif.SetFocus;
                  End
                Else
                  Key := 0;
              End;
  End; {Case Key Of}
end;

procedure TIngresosForm.VENTA1Click(Sender: TObject);
begin
  TipDocMenu.PopUp(520,100);
end;

procedure TIngresosForm.COTIZACION1Click(Sender: TObject);
Var
  A : TextFile;
  I, J, K : Integer;
  Linea : String[80];
  Unitario, Cantidad, Total2 : String;
begin
  {Impresion de vale de cotización}
  AssignFile(A, ValPort);
  ReWrite(A);
  WriteLn(A, #14 + '* PINTURERIAS  AKP *');
  WriteLn(A, ' ');
  WriteLn(A, #14 + '***  COTIZACION  ***');
  WriteLn(A, ' ');
  WriteLn(A, #14 + 'Fecha :   ' + DateToStr(Now));
  WriteLn(A, '========================================');
  WriteLn(A, 'Cant. Descripcion                VALOR  ');
  WriteLn(A, '========================================');
  For I := 1 To Items Do
    Begin
      Linea := '                                        ';
      Unitario    := Grid.Cells[4, I];
      Cantidad    := Grid.Cells[5, I];
      Total2      := Grid.Cells[6, I];

      Linea := Cantidad + 'x' + Unitario;
      K := Length(Total2);
      For J := 40 DownTo (40-K) Do
        Begin
          Linea[J] := Total2[K];
          Dec(K);
        End;
      WriteLn(A, Grid.Cells[1, I]);
      For J := 1 To 40 Do
        Begin
          Write(A, Linea[J]);
        End;
      WriteLn(A, '');
    End;
  WriteLn(A, #14 + '====================');
  WriteLn(A, #14 + ' TOTAL   $'+ PTotalVenta.Caption);
  WriteLn(A, '');
  WriteLn(A, '');
  WriteLn(A, '');
  WriteLn(A, '');
  WriteLn(A, '');
  WriteLn(A, '');
  WriteLn(A, '');
  WriteLn(A, '');
  WriteLn(A, '');
  WriteLn(A, '');
  WriteLn(A, '');
  WriteLn(A, '');
  WriteLn(A, '');
  WriteLn(A, '');
  CloseFile(A);
  {Limpieza de Grilla}

  Grid.ClearNormalCells;
  TotalVenta := 0;
  Items := 0;
  Grid.Row := 1;
  Grid.Tag := 0;
  PTotalVenta.Caption := '';
  Vendedor.Enabled := True;
  Vendedor.Text := '';
  Vendedor.SetFocus;
end;

procedure TIngresosForm.EBuscaChange(Sender: TObject);
begin
  Productos.IndexFieldNames := 'NOMBRE';
  Productos.SetKey;
  ProductosNombre.Value := EBusca.Text;
  Productos.GoToNearest;
end;

procedure TIngresosForm.EBuscaKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  Case Key Of
        13 : Begin
               Key := 0;
               Grid.Options := [goFixedVertLine,goFixedHorzLine,goVertLine,goHorzLine,goEditing];
               Grid.Cells[0, Grid.Row] := ProductosAlter1.Value;
               Grid.SetFocus;
               Grid.Col := 0;
               Productos.IndexFieldNames := 'ALTER1';
               Productos.SetKey;
               PBusca.Visible :=  False;
             End;
    37..40 : Begin
               GridBusca.SetFocus;
             End;
        35 : Begin
               Key := 0;
               Grid.SetFocus;
               Productos.IndexFieldNames := 'ALTER1';
               Productos.SetKey;
               PBusca.Visible := False;
             End;
  End;
end;

procedure TIngresosForm.GridBuscaKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  Case Key Of
        13 : Begin
               Key := 0;
               Grid.Options := [goFixedVertLine,goFixedHorzLine,goVertLine,goHorzLine,goEditing];
               Grid.Cells[0, Grid.Row] := ProductosAlter1.Value;
               Grid.SetFocus;
               Grid.Col := 0;
               Productos.IndexFieldNames := 'ALTER1';
               Productos.SetKey;
               PBusca.Visible :=  False;
             End;
     37,39 : Begin
               EBusca.Text := '';
               EBusca.SetFocus;
             End;
        35 : Begin
               Key := 0;
               Grid.SetFocus;
               Productos.IndexFieldNames := 'ALTER1';
               Productos.SetKey;
               PBusca.Visible := False;
             End;
  End;

end;

procedure TIngresosForm.EIdentifKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  Case Key Of
    13 : Begin
           EPassw.SetFocus;
         End;
    35 : Begin
           Grid.SetFocus;
           PClaves.Visible := False;
         End;
  End;
end;

procedure TIngresosForm.EPasswKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
Var
  Valor : String;
  Monto : Real;
begin
  Case Key Of
    13 : Begin
           Usuarios.IndexName := 'IDENTIF';
           Usuarios.SetKey;
           If Not (Usuarios.FindKey([EIdentif.Text])) Then
             Begin
               Grid.SetFocus;
               EIdentif.Text := '';
               EPassw.Text   := '';
               PClaves.Visible := False;
             End
           Else
             Begin
               If (UsuariosClave.Value = EPassw.Text) And (UsuariosDescuento.Value = True) Then
                 Begin
                   Monto := StrToFloat(Grid.Cells[4, Grid.Row]);
                   TotalVenta := TotalVenta - StrToFloat(Grid.Cells[6, Grid.Row]);
                   Valor := FloatToStr(Monto);
                   Valor := InputBox('Descuento a Productos', 'Ingrese Valor Final del Producto', Valor);
                   Try
                     Monto := StrToFloat(Valor);
                     Grid.Cells[3, Grid.Row] := FloatToStr(StrToFloat(Grid.Cells[2, Grid.Row]) - Monto);
                     Grid.Cells[4, Grid.Row] := Format('%10.0f', [Monto]);
                     Grid.Cells[6, Grid.Row] := FloatToStr(StrToFloat(Grid.Cells[4, Grid.Row]) * StrToFloat(Grid.Cells[5, Grid.Row]));
                     TotalVenta := TotalVenta + StrToFloat(Grid.Cells[6, Grid.Row]);
                     PTotalVenta.Caption := FloatToStr(TotalVenta);
                     Grid.SetFocus;
                     Grid.Row := Items;
                     EIdentif.Text := '';
                     EPassw.Text   := '';
                     PClaves.Visible := False;
                   Except On EConvertError Do
                     Begin
                       MessageBox(Handle, 'INGRESE NUMERO VÁLIDO', 'ADVERTENCIA', mb_Ok Or mb_IconStop Or mb_DefButton1);
                       Grid.SetFocus;
                       Grid.Row := Items;
                       EIdentif.Text := '';
                       EPassw.Text   := '';
                       PClaves.Visible := False;
                     End;
                   End; {Try}
                 End
               Else
                 Begin
                   MessageBox(Handle, 'USUARIO NO AUTORIZADO', 'ADVERTENCIA', mb_Ok Or mb_IconStop Or mb_DefButton1);
                   Grid.SetFocus;
                   EIdentif.Text := '';
                   EPassw.Text   := '';
                   PClaves.Visible := False;
                 End;
             End;
         End;
    35 : Begin
           Grid.SetFocus;
           EIdentif.Text := '';
           EPassw.Text   := '';
           PClaves.Visible := False;
         End;
  End;
end;

procedure TIngresosForm.SALIR1Click(Sender: TObject);
begin
  Close;
end;

procedure TIngresosForm.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  Case Key Of
     35 : Begin
            If (Grid.Focused) And (Grid.Tag = 10) Then
              VentaMenu.PopUp(520, 100);
          End;
 {   112 : Begin
            Productos.Open;
            PBusca.Visible := True;
            EBusca.SetFocus;
          End;
}
    115 : Begin
            Key := 0;
          End;
    120 : Begin
            Key := 0;
            Grid.ClearNormalCells;
            TotalVenta := 0;
            PTotalVEnta.Caption := '';
            Grid.Row := 1;
            Grid.Col := 0;
            Vendedor.Enabled := True;
            Vendedor.Text := '';
            Vendedor.SetFocus;
            Items := 0;
            Exit;
          End;
    121 : Begin
            SalirMenu.PopUp(520, 100);
          End;
  End;
end;

procedure TIngresosForm.BOLETA1Click(Sender: TObject);
Var
  A : TextFile;
  Linea : String[80];
  Unidades, I, J, K : Integer;
  SCode, GCode, Unitario, Original, Cantidad, Total2, Descto : String;
begin
  AssignFile(A, ValPort);
  ReWrite(A);
  WriteLn(A, #14 + '* PINTURERIAS  AKP *');
  WriteLn(A, ' ');
  WriteLn(A, ' ');
  WriteLn(A, #14 + 'VALE : ' + PNumeroVale.Caption);
  WriteLn(A, '----------------------------------------');
  WriteLn(A, 'Fecha    : ' + DateToStr(Now));
  WriteLn(A, 'Vendedor : ' + Vendedor.Text + '  ' + PNombre.Caption);
  WriteLn(A, '----------------------------------------');
  WriteLn(A, 'Cant Precio Descuento   Valor    TOTAL  ');
  WriteLn(A, '----------------------------------------');
  Unidades := 0;
  For I := 1 To Items Do
    Begin
      Linea    := '                                        ';
      GCode    := Grid.Cells[0, I];
      Original := Grid.Cells[2, I];
      If (Grid.Cells[3, I] = '') Then
        Begin
          Descto := '0';
        End
      Else
        Begin
          Descto   := Grid.Cells[3, I];
        End;
      Unitario := Grid.Cells[4, I];
      Cantidad := Grid.Cells[5, I];
      Total2   := Grid.Cells[6, I];
      SCode    := Grid.Cells[7, I];
      Unidades := Unidades + StrToInt(Grid.Cells[5, I]);

      {Total Articulo}
      K := Length(Total2);
      For J := 40 DownTo (40-K) Do
        Begin
          Linea[J] := Total2[K];
          Dec(K);
        End;

      {Precio Final Articulo}
      K := Length(Unitario);
      For J := 30 DownTo (30 - K) Do
        Begin
          Linea[J] := Unitario[K];
          Dec(K);
        End;

      {Valor del Descuento en Pesos}
      K := Length(Descto);
      For J := 22 DownTo (22-K) Do
        Begin
          Linea[J] := Descto[K];
          Dec(K);
        End;

      K := Length(Original);
      For J := 11 DownTo (11 - K) Do
        Begin
          Linea[J]  := Original[K];
          Dec(K);
        End;

      K := Length(Cantidad);
      For J:= 4 DownTo (4 - K) Do
        Begin
          Linea[5] := 'x';
          Linea[J] := Cantidad[K];
          Dec(K);
        End;

      For J := 1 To 40 Do
        Begin
          Write(A, Linea[J]);
        End;

      WriteLn(A, '');
      WriteLn(A, 'Cod : ' + Grid.Cells[7, I] + '-->' + Grid.Cells[1, I]);
    End;
  WriteLn(A, #14 + '====================');
  WriteLn(A, #14 + ' TOTAL   $'+ PTotalVenta.Caption);
  WriteLn(A, #14 + '====================');
  WriteLn(A, '');
  WriteLn(A, 'Cantidad Unidades : ' + IntToStr(Unidades));
  WriteLn(A, '');
  WriteLn(A, 'Documento a Emitir : BOLETA');
  WriteLn(A, '');
  WriteLn(A, '');
  WriteLn(A, '');
  WriteLn(A, '');
  WriteLn(A, '');
  WriteLn(A, '');
  WriteLn(A, '');
  CloseFile(A);

  {Grabacion de base de datos}
  Vales.Open;
  For I := 1 To Items Do
    Begin
      Vales.Append;
      ValesNumero.Value    := StrToFloat(PNumeroVale.Caption);
      ValesFecha.Value     := Now;
      ValesVendedor.Value  := StrToInt(Vendedor.Text);
      ValesItem.Value      := I;
      ValesProducto.Value  := Grid.Cells[0, I];
      ValesNombre.Value    := Grid.Cells[1, I];
      ValesValorOri.Value  := StrToFloat(Grid.Cells[2, I]);
      If (Grid.Cells[3, I] = '') Then
        Begin
          Grid.Cells[3, I] := '0';
        End
      Else
        Begin
          ValesDescuento.Value := StrToFloat(Grid.Cells[3, I]);
        End;
      ValesValor.Value     := StrToFloat(Grid.Cells[4, I]);
      ValesCantidad.Value  := StrToInt(Grid.Cells[5, I]);
      ValesProcesado.Value := False;
      ValesDocumento.Value := 'B';
      ValesImpreso.Value   := False;
      Vales.Post
    End;
  Vales.Close;

{Inicio : Carga Inicial de Correlativos. Apertura, Edicion y Cierre Base de Datos ***}
  Correlativos.Open;
  Correlativos.First;
  PNumeroVale.Caption := CorrelativosValeNow.AsString;
  Correlativos.Edit;
  CorrelativosValeNow.AsFloat := CorrelativosValeNow.AsFloat + 1;
  Correlativos.Post;
  Correlativos.Close;
{Fin    : Carga Inicial de Correlativos. Apertura, Edicion y Cierre Base de Datos ***}

  TotalVenta := 0;
  PTotalVenta.Caption := '';
  Grid.ClearNormalCells;
  Items := 0;
  Grid.Row := 1;
  Grid.Tag := 0;
  Vendedor.Text := '';
  Vendedor.Enabled := True;
  Vendedor.SetFocus;
end;


procedure TIngresosForm.FACTURA1Click(Sender: TObject);
Var
  A : TextFile;
  Linea : String[80];
  Unidades, I, J, K : Integer;
  SCode, GCode, Unitario, Original, Cantidad, Total2, Descto : String;
begin
  AssignFile(A, ValPort);
  ReWrite(A);
  WriteLn(A, #14 + '* PINTURERIAS  AKP *');
  WriteLn(A, ' ');
  WriteLn(A, ' ');
  WriteLn(A, #14 + 'VALE : ' + PNumeroVale.Caption);
  WriteLn(A, '----------------------------------------');
  WriteLn(A, 'Fecha    : ' + DateToStr(Now));
  WriteLn(A, 'Vendedor : ' + Vendedor.Text + '  ' + PNombre.Caption);
  WriteLn(A, '----------------------------------------');
  WriteLn(A, 'Cant Precio Descuento   Valor    TOTAL  ');
  WriteLn(A, '----------------------------------------');
  Unidades := 0;
  For I := 1 To Items Do
    Begin
      Linea    := '                                        ';
      GCode    := Grid.Cells[0, I];
      Original := Grid.Cells[2, I];
      If (Grid.Cells[3, I] = '') Then
        Begin
          Descto := '0';
        End
      Else
        Begin
          Descto   := Grid.Cells[3, I];
        End;
      Unitario := Grid.Cells[4, I];
      Cantidad := Grid.Cells[5, I];
      Total2   := Grid.Cells[6, I];
      SCode    := Grid.Cells[7, I];
      Unidades := Unidades + StrToInt(Grid.Cells[5, I]);

      {Total Articulo}
      K := Length(Total2);
      For J := 40 DownTo (40-K) Do
        Begin
          Linea[J] := Total2[K];
          Dec(K);
        End;

      {Precio Final Articulo}
      K := Length(Unitario);
      For J := 30 DownTo (30 - K) Do
        Begin
          Linea[J] := Unitario[K];
          Dec(K);
        End;

      {Valor del Descuento en Pesos}
      K := Length(Descto);
      For J := 22 DownTo (22-K) Do
        Begin
          Linea[J] := Descto[K];
          Dec(K);
        End;

      K := Length(Original);
      For J := 11 DownTo (11 - K) Do
        Begin
          Linea[J]  := Original[K];
          Dec(K);
        End;

      K := Length(Cantidad);
      For J:= 4 DownTo (4 - K) Do
        Begin
          Linea[5] := 'x';
          Linea[J] := Cantidad[K];
          Dec(K);
        End;

      For J := 1 To 40 Do
        Begin
          Write(A, Linea[J]);
        End;

      WriteLn(A, '');
      WriteLn(A, 'Cod : ' + Grid.Cells[7, I] + '-->' + Grid.Cells[1, I]);
    End;
  WriteLn(A, #14 + '====================');
  WriteLn(A, #14 + ' TOTAL   $'+ PTotalVenta.Caption);
  WriteLn(A, #14 + '====================');
  WriteLn(A, '');
  WriteLn(A, 'Cantidad Unidades : ' + IntToStr(Unidades));
  WriteLn(A, '');
  WriteLn(A, 'Documento a Emitir : FACTURA');
  WriteLn(A, '');
  WriteLn(A, '');
  WriteLn(A, '');
  WriteLn(A, '');
  WriteLn(A, '');
  WriteLn(A, '');
  WriteLn(A, '');
  CloseFile(A);

  {Grabacion de base de datos}
  Vales.Open;
  For I := 1 To Items Do
    Begin
      Vales.Append;
      ValesNumero.Value    := StrToFloat(PNumeroVale.Caption);
      ValesFecha.Value     := Now;
      ValesVendedor.Value  := StrToInt(Vendedor.Text);
      ValesItem.Value      := I;
      ValesProducto.Value  := Grid.Cells[0, I];
      ValesNombre.Value    := Grid.Cells[1, I];
      ValesValorOri.Value  := StrToFloat(Grid.Cells[2, I]);
      If (Grid.Cells[3, I] = '') Then
        Begin
          Grid.Cells[3, I] := '0';
        End
      Else
        Begin
          ValesDescuento.Value := StrToFloat(Grid.Cells[3, I]);
        End;
      ValesValor.Value     := StrToFloat(Grid.Cells[4, I]);
      ValesCantidad.Value  := StrToInt(Grid.Cells[5, I]);
      ValesProcesado.Value := False;
      ValesDocumento.Value := 'F';
      ValesImpreso.Value   := False;
      Vales.Post
    End;
  Vales.Close;

{Inicio : Carga Inicial de Correlativos. Apertura, Edicion y Cierre Base de Datos ***}
  Correlativos.Open;
  Correlativos.First;
  PNumeroVale.Caption := CorrelativosValeNow.AsString;
  Correlativos.Edit;
  CorrelativosValeNow.AsFloat := CorrelativosValeNow.AsFloat + 1;
  Correlativos.Post;
  Correlativos.Close;
{Fin    : Carga Inicial de Correlativos. Apertura, Edicion y Cierre Base de Datos ***}

  TotalVenta := 0;
  PTotalVenta.Caption := '';
  Grid.ClearNormalCells;
  Items := 0;
  Grid.Row := 1;
  Grid.Tag := 0;
  Vendedor.Text := '';
  Vendedor.Enabled := True;
  Vendedor.SetFocus;
end;


procedure TIngresosForm.GridAutoDeleteRow(Sender: TObject; aRow: Integer);
begin
  If (Items = 0) Or (Grid.Options = [goFixedVertLine,goFixedHorzLine,goVertLine,goHorzLine,goEditing]) Or (TotalVenta = 0)Then
    Begin
      Grid.ClearNormalCells;
      Grid.Row := 1;
    End
  Else
    Begin
      Dec(Items);
      Grid.Row := 1;
      Grid.Row := Items;
    End;
end;

procedure TIngresosForm.GridGetFormat(Sender: TObject; ACol: Integer; var AStyle: TSortStyle; var aPrefix, aSuffix: String);
begin
  Case aCol Of
    2..6 : Begin
             AStyle := ssNumeric;
           End;
  End;
end;

procedure TIngresosForm.Timer1Timer(Sender: TObject);
begin
  Status.Panels[1].Text := TimeToStr(Now);
end;

procedure TIngresosForm.TipDocMenuPopup(Sender: TObject);
begin
  If (TotalVenta < 2000) Then
    Begin
      N3.Visible := False;
      Factura1.Visible := False;
    End;
end;

procedure TIngresosForm.TRASPASOAVOSS1Click(Sender: TObject);
Var
  A : TextFile;
  Linea : String[80];
  Unidades, I, J, K : Integer;
  SCode, GCode, Unitario, Original, Cantidad, Total2, Descto : String;
begin
  AssignFile(A, ValPort);
  ReWrite(A);
  WriteLn(A, #14 + '* PINTURERIAS  AKP *');
  WriteLn(A, ' ');
  WriteLn(A, #14 + ' TRASPASO DE BODEGA ');
  WriteLn(A, ' ');
  WriteLn(A, ' ');
  WriteLn(A, #14 + 'VALE : ' + PNumeroVale.Caption);
  WriteLn(A, '----------------------------------------');
  WriteLn(A, 'Fecha    : ' + DateToStr(Now));
  WriteLn(A, 'Vendedor : ' + Vendedor.Text + '  ' + PNombre.Caption);
  WriteLn(A, '----------------------------------------');
  WriteLn(A, 'Cant Precio Descuento   Valor    TOTAL  ');
  WriteLn(A, '----------------------------------------');
  Unidades := 0;
  For I := 1 To Items Do
    Begin
      Linea    := '                                        ';
      GCode    := Grid.Cells[0, I];
      Original := Grid.Cells[2, I];
      If (Grid.Cells[3, I] = '') Then
        Begin
          Descto := '0';
        End
      Else
        Begin
          Descto   := Grid.Cells[3, I];
        End;
      Unitario := Grid.Cells[4, I];
      Cantidad := Grid.Cells[5, I];
      Total2   := Grid.Cells[6, I];
      SCode    := Grid.Cells[7, I];
      Unidades := Unidades + StrToInt(Grid.Cells[5, I]);

      {Total Articulo}
      K := Length(Total2);
      For J := 40 DownTo (40-K) Do
        Begin
          Linea[J] := Total2[K];
          Dec(K);
        End;

      {Precio Final Articulo}
      K := Length(Unitario);
      For J := 30 DownTo (30 - K) Do
        Begin
          Linea[J] := Unitario[K];
          Dec(K);
        End;

      {Valor del Descuento en Pesos}
      K := Length(Descto);
      For J := 22 DownTo (22-K) Do
        Begin
          Linea[J] := Descto[K];
          Dec(K);
        End;

      K := Length(Original);
      For J := 11 DownTo (11 - K) Do
        Begin
          Linea[J]  := Original[K];
          Dec(K);
        End;

      K := Length(Cantidad);
      For J:= 4 DownTo (4 - K) Do
        Begin
          Linea[5] := 'x';
          Linea[J] := Cantidad[K];
          Dec(K);
        End;

      For J := 1 To 40 Do
        Begin
          Write(A, Linea[J]);
        End;

      WriteLn(A, '');
      WriteLn(A, 'Cod : ' + Grid.Cells[7, I] + '-->' + Grid.Cells[1, I]);
    End;
  WriteLn(A, #14 + '====================');
  WriteLn(A, #14 + ' TOTAL   $'+ PTotalVenta.Caption);
  WriteLn(A, #14 + '====================');
  WriteLn(A, '');
  WriteLn(A, 'Cantidad Unidades : ' + IntToStr(Unidades));
  WriteLn(A, '');
  WriteLn(A, 'DOCUMENTO : TRASPASO DE BODEGAS');
  WriteLn(A, '');
  WriteLn(A, '');
  WriteLn(A, '');
  WriteLn(A, '');
  WriteLn(A, '');
  WriteLn(A, '');
  WriteLn(A, '');
  CloseFile(A);

  {Grabacion de base de datos}
  Vales.Open;
  For I := 1 To Items Do
    Begin
      Vales.Append;
      ValesNumero.Value    := StrToFloat(PNumeroVale.Caption);
      ValesFecha.Value     := Now;
      ValesVendedor.Value  := StrToInt(Vendedor.Text);
      ValesItem.Value      := I;
      ValesProducto.Value  := Grid.Cells[0, I];
      ValesNombre.Value    := Grid.Cells[1, I];
      ValesValorOri.Value  := StrToFloat(Grid.Cells[2, I]);
      If (Grid.Cells[3, I] = '') Then
        Begin
          Grid.Cells[3, I] := '0';
        End
      Else
        Begin
          ValesDescuento.Value := StrToFloat(Grid.Cells[3, I]);
        End;
      ValesValor.Value     := StrToFloat(Grid.Cells[4, I]);
      ValesCantidad.Value  := StrToInt(Grid.Cells[5, I]);
      ValesProcesado.Value := True;
      ValesDocumento.Value := 'T';
      ValesImpreso.Value   := True;
      Vales.Post
    End;
  Vales.Close;

  {Grabación de Descarga de Bodega}
  Productos.Open;
  Productos.IndexFieldNames := 'CODIGO';
  Productos.SetKey;
  For I := 1 To Items Do
    Begin
      Productos.SetKey;
      If Not Productos.FindKey([Grid.Cells[0, I]]) Then
        Begin
        End
      Else
        Begin
          Productos.Edit;
          ProductosStock.Value := ProductosStock.Value - StrToFloat(Grid.Cells[5, I]);
          Productos.Post;
        End;
    End;
  Productos.Close;

{Inicio : Carga Inicial de Correlativos. Apertura, Edicion y Cierre Base de Datos ***}
  Correlativos.Open;
  Correlativos.First;
  PNumeroVale.Caption := CorrelativosValeNow.AsString;
  Correlativos.Edit;
  CorrelativosValeNow.AsFloat := CorrelativosValeNow.AsFloat + 1;
  Correlativos.Post;
  Correlativos.Close;
{Fin    : Carga Inicial de Correlativos. Apertura, Edicion y Cierre Base de Datos ***}

  TotalVenta := 0;
  PTotalVenta.Caption := '';
  Grid.ClearNormalCells;
  Items := 0;
  Grid.Row := 1;
  Grid.Tag := 0;
  Vendedor.Text := '';
  Vendedor.Enabled := True;
  Vendedor.SetFocus;
end;

end.
