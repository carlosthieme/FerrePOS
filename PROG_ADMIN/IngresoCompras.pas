unit IngresoCompras;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables, Grids, AdvGrid, StdCtrls, ComCtrls, Numedit, ExtCtrls,
  Menus, DBGrids, Buttons;

type
  TIngresoComprasForm = class(TForm)
    Panel1: TPanel;
    Dig: TEdit;
    Rut: TNumEdit;
    Nombre: TEdit;
    Numero: TNumEdit;
    Fecha: TDateTimePicker;
    TipoDoc: TComboBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Grid: TAdvStringGrid;
    Proves: TTable;
    DSProves: TDataSource;
    Artics: TTable;
    DSArtics: TDataSource;
    Compras: TTable;
    DSCompras: TDataSource;
    ProvesRUT: TFloatField;
    ProvesDIG: TStringField;
    ProvesNOMBRE: TStringField;
    ArticsCODIGO: TStringField;
    ArticsALTER1: TStringField;
    ArticsALTER2: TStringField;
    ArticsNOMBRE: TStringField;
    ArticsMODIF: TBooleanField;
    ArticsDESC: TFloatField;
    ArticsPRECIO: TFloatField;
    ArticsSTOCK: TFloatField;
    ArticsVUCOMPRA: TFloatField;
    Status: TStatusBar;
    ProvesDESC01: TSmallintField;
    ProvesDESC02: TSmallintField;
    ProvesDESC03: TSmallintField;
    ProvesDESC04: TSmallintField;
    ProvesDESC05: TSmallintField;
    ProvesDESC06: TSmallintField;
    ProvesDESC07: TSmallintField;
    ProvesDESC08: TSmallintField;
    ProvesDESC09: TSmallintField;
    ProvesDESC10: TSmallintField;
    ProvesDESCPROMO: TSmallintField;
    ProvesDESCPP01: TSmallintField;
    ProvesDESCPP02: TSmallintField;
    ProvesDESCPP03: TSmallintField;
    ProvesDESCPP04: TSmallintField;
    PBusca: TPanel;
    EBusca: TEdit;
    GridBusca: TDBGrid;
    ComprasRUTPROVE: TFloatField;
    ComprasDOCUMENTO: TStringField;
    ComprasNUMERO: TStringField;
    ComprasFECHA: TDateField;
    ComprasITEM: TSmallintField;
    ComprasCODIGO: TStringField;
    ComprasCANTIDAD: TSmallintField;
    ComprasPRECIO: TFloatField;
    ComprasDE01: TSmallintField;
    ComprasDE02: TSmallintField;
    ComprasDE03: TSmallintField;
    ComprasDE04: TSmallintField;
    ComprasDE05: TSmallintField;
    ComprasDE06: TSmallintField;
    ComprasDE07: TSmallintField;
    ComprasDE08: TSmallintField;
    ComprasDE09: TSmallintField;
    ComprasDE10: TSmallintField;
    ComprasDEPR: TSmallintField;
    ComprasDEPP1: TSmallintField;
    ComprasDEPP2: TSmallintField;
    ComprasDEPP3: TSmallintField;
    ComprasDEPP4: TSmallintField;
    ComprasIMP01: TSmallintField;
    ComprasIMP02: TSmallintField;
    ComprasIMP03: TSmallintField;
    ComprasIMP04: TSmallintField;
    ComprasIMP05: TSmallintField;
    BtnGrabar: TSpeedButton;
    procedure RutKeyPress(Sender: TObject; var Key: Char);
    procedure GridKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure GridGetAlignment(Sender: TObject; ARow, ACol: Integer; var AAlignment: TAlignment);
    procedure EBuscaChange(Sender: TObject);
    procedure EBuscaKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure GridBuscaKeyDown(Sender: TObject; var Key: Word;  Shift: TShiftState);
    procedure NumeroKeyPress(Sender: TObject; var Key: Char);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure BtnGrabarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  IngresoComprasForm: TIngresoComprasForm;
  Existe : Boolean;
  Items : Integer;
implementation

uses MantProves;

{$R *.DFM}

procedure TIngresoComprasForm.RutKeyPress(Sender: TObject; var Key: Char);
begin
  If Key = #13 Then
    Begin
      Proves.Open;
      Proves.SetKey;
      Try
        If Not Proves.FindKey([Rut.Text]) Then
          Begin
            {Proveedor No Existe}
            MantProveForm.ShowModal;
          End
        Else
          Begin
            Dig.Text    := ProvesDig.AsString;
            Nombre.Text := ProvesNombre.AsString;
            Numero.SetFocus;
          End;
      Except On EConvertError Do
        Begin
          Rut.Text := '';
          Rut.SetFocus;
        End;
      End;{Try}
    End;
end;

procedure TIngresoComprasForm.GridKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
Var
  I : Integer;
begin
  Status.Panels[2].Text := IntToStr(Key);
  If (Grid.Options = [goFixedVertLine,goFixedHorzLine,goVertLine,goHorzLine,goAlwaysShowEditor,goRowSelect]) Then
    Grid.Options := [goFixedVertLine,goFixedHorzLine,goVertLine,goHorzLine,goAlwaysShowEditor,goEditing];
  Case Grid.Col Of
    0 : Begin
          Case Key Of
            13 : Begin
                   If Grid.Cells[0, Grid.Row] = '' Then
                     Begin
                       PBusca.Visible := True;
                       Artics.Active := True;
                       EBusca.SetFocus;
                     End
                   Else
                     Begin
                       Artics.Open;
                       Artics.IndexFieldNames := 'ALTER2';
                       Artics.SetKey;
                       If Not Artics.FindKey([Grid.Cells[0, Grid.Row]]) Then
                         Begin
                           {Codigo No Existe}
                           Artics.IndexFieldNames := 'ALTER1';
                           Artics.SetKey;
                           If Not Artics.FindKey([Grid.Cells[0, Grid.Row]]) Then
                             Begin
                             {Codigo No Existe}
                             End
                           Else
                             Begin
                               Grid.Cells[0, Grid.Row] := ArticsCodigo.AsString;
                               Grid.Cells[1, Grid.Row] := ArticsNombre.AsString;
                               Grid.Cells[3, Grid.Row] := ArticsVUCompra.AsString;
                               Grid.Cells[4, Grid.Row] := ArticsStock.AsString;
                               Grid.Cells[5, Grid.Row] := ArticsPrecio.AsString;
                               Grid.Cells[6, Grid.Row] := ArticsDesc.AsString;
                               If (ArticsModif.Value = True) Then
                                 Grid.Cells[7, Grid.Row] := 'SI'
                               Else
                                 Grid.Cells[7, Grid.Row] := 'NO';
                               Grid.Col := 2;
                             End;
                         End
                       Else
                         Begin
                           Grid.Cells[0, Grid.Row] := ArticsCodigo.AsString;
                           Grid.Cells[1, Grid.Row] := ArticsNombre.AsString;
                           Grid.Cells[3, Grid.Row] := ArticsVUCompra.AsString;
                           Grid.Cells[4, Grid.Row] := ArticsStock.AsString;
                           Grid.Cells[5, Grid.Row] := ArticsPrecio.AsString;
                           Grid.Cells[6, Grid.Row] := ArticsDesc.AsString;
                           If (ArticsModif.Value = True) Then
                             Grid.Cells[7, Grid.Row] := 'SI'
                           Else
                             Grid.Cells[7, Grid.Row] := 'NO';
                           Grid.Col := 2;
                         End;
                     End;
                 End;
          End; {Case Key Of}
        End; {Columa 0, Codigo}
    1 : Begin
          Grid.Col := 2;
        End; {Columna 1, Nombre Articulo}
    2 : Begin
          Case Key Of
            13 : Begin
                   Grid.Col := 3;
                 End;
          End; {Case Key Of}
        End; {Columna 2, Cantidad}
    3 : Begin
          Case Key Of
          13 : Begin
                 Grid.Col := 5;
               End;
          End; {Case Key Of}
        End; {Columna 3, Precio Ultima Compra}
    4 : Begin
          Grid.Col := 5;
        End; {Columna 4, Stock}
    5 : Begin
          Case Key Of
            13 : Begin
                   Grid.Col := 6;
                 End;
          End; {Case Key Of}
        End; {Columna 5, Precio Venta Publico}
    6 : Begin
          Case Key Of
            13 : Begin
                   If (Grid.Cells[6, Grid.Row] = '') Then
                     Begin
                       Grid.Cells[6, Grid.Row] := '0';
                     End;
                   Grid.Col := 7;
                 End;
          End; {Case Key Of}
        End; {Columna 6, Descuento Precio Venta Publico}
    7 : Begin
          Case Key Of
            13 : Begin
                   If Grid.Cells[7, Grid.Row] = '' Then
                     Grid.Cells[7, Grid.Row] := 'NO';
                   Grid.Cells[8, Grid.Row] := ProvesDesc01.AsString;
                   Grid.Cells[9, Grid.Row] := ProvesDesc02.AsString;
                   Grid.Cells[10, Grid.Row] := ProvesDesc03.AsString;
                   Grid.Cells[11, Grid.Row] := ProvesDesc04.AsString;
                   Grid.Cells[12, Grid.Row] := ProvesDesc05.AsString;
                   Grid.Cells[13, Grid.Row] := ProvesDesc06.AsString;
                   Grid.Cells[14, Grid.Row] := ProvesDesc07.AsString;
                   Grid.Cells[15, Grid.Row] := ProvesDesc08.AsString;
                   Grid.Cells[16, Grid.Row] := ProvesDesc09.AsString;
                   Grid.Cells[17, Grid.Row] := ProvesDesc10.AsString;
                   Grid.Cells[18, Grid.Row] := ProvesDescPromo.AsString;
                   Grid.Cells[19, Grid.Row] := ProvesDescPP01.AsString;
                   Grid.Cells[20, Grid.Row] := ProvesDescPP02.AsString;
                   Grid.Cells[21, Grid.Row] := ProvesDescPP03.AsString;
                   Grid.Cells[22, Grid.Row] := ProvesDescPP04.AsString;
                   Grid.Col := 0;
                   Grid.Row := Grid.Row + 1;
                 End;
          End; {Case Key Of}
        End; {Columna 7, Precio Venta modificable al Vender}
  End; {Case Key Of Columna}
end;

procedure TIngresoComprasForm.GridGetAlignment(Sender: TObject; ARow, ACol: Integer; var AAlignment: TAlignment);
begin
  If (ARow = 0) And (ACol In [0..23]) Then AAlignment := taCenter;
  If (ARow > 0) And (ACol In[0, 2, 3, 4, 5, 6, 8..23]) Then AAlignment := taRightJustify;
  If (ARow > 0) And (ACol = 1) Then AAlignment := taLeftJustify;
  If (ARow > 0) And (ACol = 7) Then AAlignment := taCenter;
end;

procedure TIngresoComprasForm.EBuscaChange(Sender: TObject);
begin
  Artics.IndexFieldNames := 'NOMBRE';
  Artics.SetKey;
  ArticsNombre.Value := EBusca.Text;
  Artics.GotoNearest;
end;

procedure TIngresoComprasForm.EBuscaKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  Case Key Of
        13 : Begin
               Grid.Cells[0, Grid.Row] := ArticsCodigo.AsString;
               Grid.Cells[1, Grid.Row] := ArticsNombre.AsString;
               Grid.Cells[3, Grid.Row] := ArticsVUCompra.AsString;
               Grid.Cells[4, Grid.Row] := ArticsStock.AsString;
               Grid.Cells[5, Grid.Row] := ArticsPrecio.AsString;
               Grid.Cells[6, Grid.Row] := ArticsDesc.AsString;
               If (ArticsModif.Value = True) Then
                 Grid.Cells[7, Grid.Row] := 'SI'
               Else
                 Grid.Cells[7, Grid.Row] := 'NO';
               Grid.SetFocus;
               Grid.Col := 2;
               Artics.IndexFieldNames := 'ALTER2';
               Artics.SetKey;
               Artics.Active := False;
               PBusca.Visible := False;
             End;
        35 : Begin
               Artics.IndexFieldNames := 'ALTER2';
               Artics.SetKey;
               Artics.Active := False;
               Grid.SetFocus;
               Grid.Col := 0;
               PBusca.Visible := False;
             End;
    37..40 : Begin
               GridBusca.SetFocus;
             End;
  End;
end;

procedure TIngresoComprasForm.GridBuscaKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
 Case Key Of
       13 : Begin
              Grid.Cells[0, Grid.Row] := ArticsCodigo.AsString;
              Grid.Cells[1, Grid.Row] := ArticsNombre.AsString;
              Grid.Cells[3, Grid.Row] := ArticsVUCompra.AsString;
              Grid.Cells[4, Grid.Row] := ArticsStock.AsString;
              Grid.Cells[5, Grid.Row] := ArticsPrecio.AsString;
              Grid.Cells[6, Grid.Row] := ArticsDesc.AsString;
              If (ArticsModif.Value = True) Then
                Grid.Cells[7, Grid.Row] := 'SI'
              Else
                Grid.Cells[7, Grid.Row] := 'NO';
              Grid.SetFocus;
              Grid.Col := 2;
              Artics.IndexFieldNames := 'ALTER2';
              Artics.SetKey;
              Artics.Active := False;
              PBusca.Visible := False;
              PBusca.Visible := False;
            End;
       35 : Begin
              Artics.IndexFieldNames := 'ALTER2';
              Artics.SetKey;
              Artics.Active := False;
              Grid.SetFocus;
              Grid.Col := 0;
            End;
   37, 39 : Begin
              EBusca.Text := '';
              EBusca.SetFocus;
            End;
 End;
end;

procedure TIngresoComprasForm.NumeroKeyPress(Sender: TObject; var Key: Char);
Var
  I : Integer;
begin
  If Key = #13 Then
    Begin
      Existe := False;
      Grid.Row := 1;
      I := Grid.Row;
      Compras.Open;
      Compras.First;
      While Not Compras.EOF Do
        Begin
          If (ComprasNumero.Value = Numero.Text) And (ComprasRutProve.Value = StrToFloat(Rut.Text)) Then
            Begin
              Existe := True;
              TipoDoc.Text     := ComprasDocumento.AsString;
              Fecha.Date       := ComprasFecha.Value;
              Grid.Cells[0, I] := ComprasCodigo.AsString;
              Artics.Open;
              Artics.IndexFieldNames := 'CODIGO';
              Artics.SetKey;
              If Artics.FindKey([ComprasCodigo.AsString]) Then
                Begin
                  Grid.Cells[1, I] := ArticsNombre.AsString;
                  Grid.Cells[4, I] := ArticsStock.AsString;
                  Grid.Cells[5, I] := ArticsPrecio.AsString;
                  Grid.Cells[6, I] := ArticsDesc.AsString;
                  If (ArticsModif.Value = True) Then
                    Grid.Cells[7, I] := 'SI'
                  Else
                    Grid.Cells[7, I] := 'NO';
                End;
              Artics.Close;
              Grid.Cells[2, I]  := ComprasCantidad.AsString;
              Grid.Cells[3, I]  := ComprasPrecio.AsString;
              Grid.Cells[8, I]  := ComprasDE01.AsString;
              Grid.Cells[9, I]  := ComprasDE02.AsString;
              Grid.Cells[10, I] := ComprasDE03.AsString;
              Grid.Cells[11, I] := ComprasDE04.AsString;
              Grid.Cells[12, I] := ComprasDE05.AsString;
              Grid.Cells[13, I] := ComprasDE06.AsString;
              Grid.Cells[14, I] := ComprasDE07.AsString;
              Grid.Cells[15, I] := ComprasDE08.AsString;
              Grid.Cells[16, I] := ComprasDE09.AsString;
              Grid.Cells[17, I] := ComprasDE10.AsString;
              Grid.Cells[18, I] := ComprasDEPR.AsString;
              Grid.Cells[19, I] := ComprasDEPP1.AsString;
              Grid.Cells[20, I] := ComprasDEPP2.AsString;
              Grid.Cells[21, I] := ComprasDEPP3.AsString;
              Grid.Cells[22, I] := ComprasDEPP4.AsString;
              Compras.Next;
              Inc(I);
            End
          Else
            Begin
              Compras.Next;
            End;
        End;
      If Existe = True Then
        Begin
          Grid.Options := [goFixedVertLine,goFixedHorzLine,goVertLine,goHorzLine,goAlwaysShowEditor,goRowSelect];
        End
      Else
        TipoDoc.SetFocus;
    End;
end;

procedure TIngresoComprasForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TIngresoComprasForm.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  CanClose := True;
end;

procedure TIngresoComprasForm.BtnGrabarClick(Sender: TObject);
Var
  I, J : Integer;
begin
  Items := 0;
  For I := 1 To Grid.RowCount Do
    If (Grid.Cells[0, I] <> '') Then
      Inc(Items);

  For I := 1 To Items Do
    For J := 1 To 23 Do
      If Grid.Cells[J, I] = '' Then
        Begin
          Grid.Cells[J, I] := '0';
        End;

  Compras.Open;
  For I := 1 To Items Do
    Begin
      Compras.Append;
      ComprasRutProve.Value  := StrToFloat(Rut.Text);
      ComprasDocumento.Value := TipoDoc.Text;
      ComprasNumero.Value    := Numero.Text;
      ComprasFecha.Value     := Fecha.Date;
      ComprasItem.Value      := I;
      ComprasCodigo.Value    := Grid.Cells[0, I];
      ComprasCantidad.Value  := StrToInt(Grid.Cells[2, I]);
      ComprasPrecio.Value    := StrToFloat(Grid.Cells[3, I]);
      ComprasDE01.Value      := StrToInt(Grid.Cells[8, I]);
      ComprasDE02.Value      := StrToInt(Grid.Cells[9, I]);
      ComprasDE03.Value      := StrToInt(Grid.Cells[10, I]);
      ComprasDE04.Value      := StrToInt(Grid.Cells[11, I]);
      ComprasDE05.Value      := StrToInt(Grid.Cells[12, I]);
      ComprasDE06.Value      := StrToInt(Grid.Cells[13, I]);
      ComprasDE07.Value      := StrToInt(Grid.Cells[14, I]);
      ComprasDE08.Value      := StrToInt(Grid.Cells[15, I]);
      ComprasDE09.Value      := StrToInt(Grid.Cells[16, I]);
      ComprasDE10.Value      := StrToInt(Grid.Cells[17, I]);
      ComprasDEPR.Value      := StrToInt(Grid.Cells[18, I]);
      ComprasDEPP1.Value     := StrToInt(Grid.Cells[19, I]);
      ComprasDEPP2.Value     := StrToInt(Grid.Cells[20, I]);
      ComprasDEPP3.Value     := StrToInt(Grid.Cells[21, I]);
      ComprasDEPP4.Value     := StrToInt(Grid.Cells[22, I]);
      Compras.Post;
      Artics.Open;
      Artics.IndexFieldNames := 'CODIGO';
      Artics.SetKey;
      If Not Artics.FindKey([Grid.Cells[0, I]]) Then
        Begin
        End
      Else
        Begin
          Artics.Edit;
          ArticsPrecio.Value   := StrToFloat(Grid.Cells[5, I]);
          ArticsStock.Value    := ArticsStock.Value + StrToFloat(Grid.Cells[2, I]);
          ArticsDesc.Value     := StrToFloat(Grid.Cells[6, I]);
          ArticsVUCompra.Value := StrToFloat(Grid.Cells[3, I]);
          If Grid.Cells[7, I] = 'SI' Then
            ArticsModif.Value := True
          Else
            ArticsModif.Value := False;
          Artics.Post;
          Artics.Close;
        End;
    End;

  Grid.ClearNormalCells;
  Grid.Options := [goFixedVertLine,goFixedHorzLine,goVertLine,goHorzLine,goAlwaysShowEditor,goEditing];
  Rut.Text := '';
  Dig.Text := '';
  Nombre.Text := '';
  Numero.Text := '';
  Grid.Row := 1;
  Grid.Col := 0;
  Rut.SetFocus;
end;

end.
