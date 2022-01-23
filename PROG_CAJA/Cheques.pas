unit Cheques;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Mask, ExtCtrls, Db, DBTables;

type
  TChequeForm = class(TForm)
    Panel1: TPanel;
    CodeBanco: TEdit;
    Banco: TEdit;
    Serie: TEdit;
    Cuenta: TEdit;
    Monto: TEdit;
    Fecha: TMaskEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Bancos: TTable;
    DSBancos: TDataSource;
    BancosCODIGO: TSmallintField;
    BancosNOMBRE: TStringField;
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure MontoExit(Sender: TObject);
    procedure CodeBancoExit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  ChequeForm: TChequeForm;

implementation

{$R *.DFM}

procedure TChequeForm.FormKeyPress(Sender: TObject; var Key: Char);
begin
  If Key = #13 Then
    Begin
      Key := #0;
      Perform(WM_NextDlgCtl, 0,0);
    End;
end;

procedure TChequeForm.MontoExit(Sender: TObject);
begin
  Bancos.SetKey;
  Try
    If Not (Bancos.FindKey([StrToInt(CodeBanco.Text)])) Then
      Begin
        Bancos.Append;
        BancosCodigo.Value     := StrToInt(CodeBanco.Text);
        BancosNombre.Value     := Banco.Text;
        Bancos.Post;
      End
    Else
      Begin
        Banco.Text := BancosNombre.AsString;
      End;
  Except on EConvertError Do
    Begin
      CodeBanco.Text := '';
      CodeBanco.SetFocus;
    End;
  End;
  Bancos.Close;
  Close;
end;

procedure TChequeForm.CodeBancoExit(Sender: TObject);
begin
  Bancos.Open;
  Bancos.SetKey;
  Try
    If Not (Bancos.FindKey([StrToInt(CodeBanco.Text)])) Then
      Begin
        Banco.SetFocus;
      End
    Else
      Begin
        Banco.Text := BancosNombre.AsString;
      End;
  Except On EConvertError Do
    Begin
      CodeBanco.Text := '';
      CodeBanco.SetFocus;
    End;
  End;
end;

end.
