unit Datos;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Mask, StdCtrls, Numedit, ExtCtrls, Db, DBTables, Buttons;

type
  TDatosForm = class(TForm)
    Panel1: TPanel;
    PDatosCliente: TPanel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Dig: TEdit;
    Nombre: TEdit;
    Direccion: TEdit;
    Fono: TEdit;
    Fax: TEdit;
    Comuna: TEdit;
    Ciudad: TEdit;
    Giro: TEdit;
    Clientes: TTable;
    DSClientes: TDataSource;
    ClientesRUT: TFloatField;
    ClientesDIG: TStringField;
    ClientesNOMBRES: TStringField;
    ClientesDIRECCION: TStringField;
    ClientesFONO: TStringField;
    ClientesFAX: TStringField;
    ClientesCOMUNA: TStringField;
    ClientesCIUDAD: TStringField;
    ClientesREGION: TStringField;
    ClientesCASILLA: TStringField;
    ClientesCPOSTAL: TStringField;
    ClientesGIRO: TStringField;
    ClientesCREDITO: TBooleanField;
    Rut: TEdit;
    RutRet: TEdit;
    DigRet: TEdit;
    NomRet: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure NomRetExit(Sender: TObject);
    procedure DigExit(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DatosForm: TDatosForm;

implementation

{$R *.DFM}



procedure TDatosForm.FormKeyPress(Sender: TObject; var Key: Char);
begin
  If Key = #13 Then
    Begin
      Key := #0;
      Perform(WM_NextDlgCtl, 0,0);
    End;
end;

procedure TDatosForm.NomRetExit(Sender: TObject);
begin
  Clientes.SetKey;
  Try
    If Not (Clientes.FindKey([StrToFloat(Rut.Text)])) Then
      Begin
        Clientes.Append;
        ClientesRut.Value          := StrToFloat(Rut.Text);
        ClientesDig.Value          := Dig.Text;
        ClientesNombres.Value      := Nombre.Text;
        ClientesDireccion.Value    := Direccion.Text;
        ClientesFono.Value         := Fono.Text;
        ClientesFax.Value          := Fax.Text;
        ClientesComuna.Value       := Comuna.Text;
        ClientesCiudad.Value       := Ciudad.Text;
        ClientesGiro.Value         := Giro.Text;
        Clientes.Post
      End
  Except On EConvertError Do
    Begin
      Rut.Text := '';
      Rut.SetFocus;
    End;
  End;
  Clientes.Close;
  Close;
end;

procedure TDatosForm.DigExit(Sender: TObject);
begin
  Clientes.Open;
  Clientes.SetKey;
  Try
    If Not (Clientes.FindKey([StrToFloat(Rut.Text)])) Then
      Begin
        Nombre.SetFocus;
      End
    Else
      Begin
        Rut.Text       := ClientesRut.AsString;
        Dig.Text       := ClientesDig.AsString;
        Nombre.Text    := ClientesNombres.AsString;
        Direccion.Text := ClientesDireccion.AsString;
        Fono.Text      := ClientesFono.AsString;
        Fax.Text       := ClientesFax.AsString;
        Comuna.Text    := ClientesComuna.AsString;
        Ciudad.Text    := ClientesCiudad.AsString;
        Giro.Text      := ClientesGiro.AsString;
        RutRet.SetFocus;
      End;
  Except On EConvertError Do
    Begin
      Rut.Text := '';
      Rut.SetFocus;
    End;
  End;  
end;

end.
