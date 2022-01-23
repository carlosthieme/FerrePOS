unit Impresion;

interface

uses
    Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
    StdCtrls, Numedit, ComCtrls, Num2Word;


    Function ImprimirBoleta(Puerta, Monto, NumeroBoleta : String) : Boolean;
    Function ImprimeCabecera(Puerta : String; Lineas : Integer; Numero : String; AcumDesc, AcumTotal : Real) : Boolean;

implementation
Var
  Encabezado : Array[1..16] Of String;

Function ImprimirBoleta(Puerta, Monto, NumeroBoleta : String) : Boolean;
Var
  Fecha : String;
  DD, MM, AA   : String;
  A : TextFile;
  Linea, LValor, LFecha, LBoleta : String;
Begin

  Fecha := DateToStr(Now);
  DD := FormatDateTime('dd', StrToDate(Fecha));
  MM := FormatDateTime('mm', StrToDate(Fecha));
  AA := FormatDateTime('yyyy', StrToDate(Fecha));
  Linea    := ' ';
  LValor   := Monto;
  LFecha   := '                       ' + DD + '/' + MM + '/' + AA;
  LBoleta  := '   #' + NumeroBoleta;
  AssignFile(A, Puerta);
  ReWrite(A);
  WriteLn(A, Linea);
  WriteLn(A, Linea);
  WriteLn(A, Linea);
  WriteLn(A, #14 + LBoleta);
  WriteLn(A, Linea);
  WriteLn(A, Linea);
  WriteLn(A, Linea);
  WriteLn(A, Linea);
  WriteLn(A, Linea);
  WriteLn(A, '    TOTAL '#14 + LValor + '.-');
  WriteLn(A, Linea);
  WriteLn(A, Linea);
  WriteLn(A, Linea);
  WriteLn(A, Linea);
  WriteLn(A, Linea);
  WriteLn(A, LFecha);
  WriteLn(A, Linea);
  WriteLn(A, Linea);
  WriteLn(A, Linea);
  WriteLn(A, Linea);
  WriteLn(A, Linea);
  WriteLn(A, Linea);
  WriteLn(A, Linea);
  WriteLn(A, Linea);
  CloseFile(A);
  Result := True;
End;


Function ImprimeCabecera(Puerta : String; Lineas : Integer; Numero : String; AcumDesc, AcumTotal : Real) : Boolean;
Var
  A, B : TextFile;
  Largo, I, J : Integer;
  Palabra, Palabra2  : String;
  Fecha, DD, MM, AA, Linea : String;
  LNeto, LIVa, LTotalFact : String[10];
  Cantidad, Nombre, Unitario, Precio : String;
  SubTotal, Descuento, Neto, Iva, Total  : Real;
  LDescuento, NetoStr, IvaStr, TotalStr : String;

Begin
  Fecha  := DateToStr(Now);
  DD     := FormatDateTime('dd', StrToDate(Fecha)); MM := FormatDateTime('mmmm', StrToDate(Fecha)); AA := FormatDateTime('yy', StrToDate(Fecha));
  MM     := UpperCase(MM);

  SubTotal   := AcumTotal;
  Descuento  := AcumDesc;
  SubTotal   := SubTotal - Descuento;
  Neto       := SubTotal / 1.18;
  Iva        := Neto * 0.18;
  Total      := Neto * 1.18;
  LDescuento := FloatToStr(Descuento);
  AssignFile(B, 'C:\HeadFact.Txt');
  Reset(B);
  For I := 1 To 16 Do
    Begin
      ReadLn(B, Encabezado[I]);
    End;
  CloseFile(B);

  AssignFile(A, Puerta);
  Rewrite(A);
  WriteLn(A, ' ');
  WriteLn(A, ' ');
  WriteLn(A, ' ');
  WriteLn(A, ' ');
  WriteLn(A, ' ');
  WriteLn(A, '                                                   ' + Numero);
  WriteLn(A, ' ');
  WriteLn(A, ' ');
  WriteLn(A, ' ');
 {Impresion linea de Fecha}
  Largo := Length(MM);
  Linea := Format('%*.*s', [50,2, DD]);
  Linea := Linea + '       ' + MM;
  Linea := Linea + Format('%*.*s', [10+ (10-Largo), 2, AA]);
  WriteLn(A, Linea);
  WriteLn(A, ' ');
 {Imprime linea Razon Social}
  Linea := '        ' + Encabezado[3];
  WriteLn(A, Linea);
  WriteLn(A, ' ');
 {Imprime linea Direccion y Telefono}
  Largo := Length(Encabezado[4]);
  Linea := Encabezado[4];
  Linea := '        ' + Linea + Format('%*.*s', [55 + (10-Largo), 30, Encabezado[5]]);
  WriteLn(A, Linea);
  WriteLn(A, ' ');
 {Impresion linea Ciudad, Comuna y RUT}
  Largo := Length(Encabezado[8]);
  Linea := Encabezado[8];
  Linea := Linea + Format('%*.*s', [30 + (10-Largo),15, Encabezado[7]]);
  Largo := Length(Encabezado[1]);
  Linea := Linea + Format('%*.*s', [25,15, Encabezado[1]]);
  Linea := Linea + '-';
  Linea := '      ' + Linea + Format('%*.*s', [1,1, Encabezado[2]]);
  WriteLn(A, Linea);
  WriteLn(A, ' ');
 {Impresion linea Giro, Condiciones Venta}
  Largo := Length(Encabezado[9]);
  Linea := '    ' + Encabezado[9];
  Linea := Linea + Format('%*.*s', [(20+(45-Largo)),15, Encabezado[10]]);
  WriteLn(A, Linea);
{  WriteLn(A, ' ');}
  WriteLn(A, ' ');
  WriteLn(A, ' ');
  WriteLn(A, ' ');
  WriteLn(A, ' ');
  WriteLn(A, ' ');
  WriteLn(A, ' ');
  AssignFile(B, 'C:\Lineas.Txt');
  Reset(B);
  For J := 1 To Lineas Do
    Begin
      ReadLn(B, Cantidad);
      ReadLn(B, Nombre);
      ReadLn(B, Unitario);
      ReadLn(B, Precio);
      Largo := Length(Nombre);
      Linea := Format('%*.*s', [10,10, Cantidad]);
      Linea := Linea + '    ' + Nombre;
      Linea := Linea + Format('%*.*s', [(19+(30-Largo)) ,10, Unitario]);
      Linea := Linea + Format('%*.*s', [15,10, Precio]);
      WriteLn(A, Linea);
    End;

  If (AcumDesc > 0) Then
    Begin
      Linea := '                                                                                ';
      Linea := Format('%*.*s', [78,30, 'Descuento $ ' + LDescuento]);
      WriteLn(A, '                                                                     ===========');
      WriteLn(A, Linea);
      Lineas := LIneas + 2;
    End;

  If Lineas < 23 Then
    Begin
      Repeat
        WriteLn(A, ' ');
        Inc(Lineas);
      Until Lineas = 23
    End;
  WriteLn(A, '  Solicitada Por : ' + Encabezado[12]);
  WriteLn(A, '  R.U.T.         : ' + Encabezado[11]);
  WriteLn(A, '  Firma          :_____________________');
  WriteLn(A, ' ');

  NetoStr      := Format('%*.*f', [10, 0, Neto]);
  IvaStr       := Format('%*.*f', [10, 0, Iva]);
  TotalStr     := Format('%*.*f', [10, 0, Total]);

  Largo := Length(NetoStr);
  J     := Largo;
  For I := 10 DownTo Largo Do
    Begin
      LNeto[I] := NetoStr[J];
      Dec(J);
    End;

  Largo := Length(IvaStr);
  J     := Largo;
  For I := 10 DownTo Largo Do
    Begin
      LIva[I] := IvaStr[J];
      Dec(J);
    End;

  Largo := Length(TotalStr);
  J     := Largo;
  For I := 10 DownTo Largo Do
    Begin
      LTotalFact[I] := TotalStr[J];
      Dec(J);
    End;

  Largo := Length(FloatToStr(AcumTotal));
  Case Largo Of
    1 : Palabra := Unidades(StrToInt(TotalStr));
    2 : Palabra := Decenas(StrToInt(TotalStr));
    3 : Palabra := Centenas(StrToInt(TotalStr));
    4 : Palabra := Millares(StrToInt(TotalStr));
    5 : Palabra := DecenasMil(StrToInt(TotalStr));
    6 : Palabra := CentenasMil(StrToInt(TotalStr));
    7 : Palabra := Millones(StrToInt(TotalStr));
    8 : Palabra := DecenasMillon(StrToInt(TotalStr));
    9 : Palabra := CentenasMillon(StrToInt(TotalStr));
   10 : Palabra := MillaresMillon(StrToInt(TotalStr));
  End;

  {Impresion linea Neto}
  Linea := Format('%*.*s', [78,10, NetoStr]);
  WriteLn(A, Linea);

  {Impresion Linea Palabra e IVA}
  Largo := Length(Palabra);
  Case Largo Of
    1..40 : Begin
              Linea := Format('%*.*s', [78,10, IvaStr]);
              WriteLn(A, '     ' + Palabra + ' PESOS.-');
              WriteLn(A, Linea);
            End;
   41..99 : Begin
              Palabra2 := Copy(Palabra, 41, 40);
              Palabra2 := Palabra2 + ' PESOS.-';
              Palabra  := Copy(Palabra, 1, 40);
              Largo := Length(Palabra2);
              Linea := Format('%*.*s', [(20+(53-Largo)) ,10, IvaStr]);
              WriteLn(A, '     ' + Palabra + '-');
              WriteLn(A, '     ' + Palabra2 + Linea);
            End;
  End;
  Palabra  := '';
  Palabra2 := '';
  WriteLn(A, ' ');

  {Impresion Linea Total}
  Linea := Format('%*.*s', [78,10, TotalStr]);
  WriteLn(A, Linea);

  {Impresion codigos de reposicionamiento  de la hoja}
  {WriteLn(A, #12); {Avance Pagina}
  {WriteLn(A, #27 + #78 + #1); {Skip Perforation}

  CloseFile(A);
  CloseFile(B);
  Result := True;
End;





end.

