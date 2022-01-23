unit MantProves;

interface

uses
  SysUtils, Windows, Messages, Classes, Graphics, Controls,
  StdCtrls, Forms, DBCtrls, DB, Buttons, DBTables, Mask, ExtCtrls;

type
  TMantProveForm = class(TForm)
    Table1RUT: TFloatField;
    Table1DIG: TStringField;
    Table1NOMBRE: TStringField;
    Table1DIRECCION: TStringField;
    Table1COMUNA: TStringField;
    Table1CIUDAD: TStringField;
    Table1REGION: TStringField;
    Table1CASILLA: TStringField;
    Table1CPOSTAL: TStringField;
    Table1FONO: TStringField;
    Table1FAX: TStringField;
    Table1CONTACTO: TStringField;
    Table1FONO2: TStringField;
    Table1DESC01: TSmallintField;
    Table1DESC02: TSmallintField;
    Table1DESC03: TSmallintField;
    Table1DESC04: TSmallintField;
    Table1DESC05: TSmallintField;
    Table1DESC06: TSmallintField;
    Table1DESC07: TSmallintField;
    Table1DESC08: TSmallintField;
    Table1DESC09: TSmallintField;
    Table1DESC10: TSmallintField;
    Table1DESCPROMO: TSmallintField;
    Table1DESCPP01: TSmallintField;
    Table1DESCPP02: TSmallintField;
    Table1DESCPP03: TSmallintField;
    Table1DESCPP04: TSmallintField;
    Table1FORMULA: TStringField;
    ScrollBox: TScrollBox;
    Label1: TLabel;
    EditRUT: TDBEdit;
    EditDIG: TDBEdit;
    Label3: TLabel;
    EditNOMBRE: TDBEdit;
    Label4: TLabel;
    EditDIRECCION: TDBEdit;
    Label5: TLabel;
    EditCOMUNA: TDBEdit;
    Label6: TLabel;
    EditCIUDAD: TDBEdit;
    Label7: TLabel;
    EditREGION: TDBEdit;
    Label8: TLabel;
    EditCASILLA: TDBEdit;
    Label9: TLabel;
    EditCPOSTAL: TDBEdit;
    Label10: TLabel;
    EditFONO: TDBEdit;
    Label11: TLabel;
    EditFAX: TDBEdit;
    Label12: TLabel;
    EditCONTACTO: TDBEdit;
    Label13: TLabel;
    EditFONO2: TDBEdit;
    DBNavigator: TDBNavigator;
    Panel1: TPanel;
    DataSource1: TDataSource;
    Panel2: TPanel;
    Table1: TTable;
    BitBtn1: TBitBtn;
    GroupBox1: TGroupBox;
    Label2: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    DBEdit4: TDBEdit;
    DBEdit5: TDBEdit;
    DBEdit6: TDBEdit;
    DBEdit7: TDBEdit;
    DBEdit8: TDBEdit;
    DBEdit9: TDBEdit;
    DBEdit10: TDBEdit;
    Label18: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    DBEdit11: TDBEdit;
    DBEdit12: TDBEdit;
    DBEdit13: TDBEdit;
    DBEdit14: TDBEdit;
    DBEdit15: TDBEdit;
    Label23: TLabel;
    Label24: TLabel;
    Label25: TLabel;
    Label26: TLabel;
    Label27: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
  private
    { private declarations }
  public
    { public declarations }
  end;

var
  MantProveForm: TMantProveForm;

implementation

{$R *.DFM}

procedure TMantProveForm.FormCreate(Sender: TObject);
begin
  Table1.Open;
end;

procedure TMantProveForm.FormKeyPress(Sender: TObject; var Key: Char);
begin
  If Key = #13 Then
    Begin
      Key := #0;
      Perform(WM_NextDlgCtl,0 ,0);
    End;
end;

end.