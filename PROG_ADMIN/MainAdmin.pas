unit MainAdmin;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Menus, ExtCtrls;

type
  TAdminForm = class(TForm)
    Panel1: TPanel;
    MainMenu1: TMainMenu;
    AdminTools: TMenuItem;
    Informes1: TMenuItem;
    Utilitarios1: TMenuItem;
    Correlativos1: TMenuItem;
    DestinosdeImpresin1: TMenuItem;
    StockZeroAllArtics1: TMenuItem;
    AnulacinDocumentos1: TMenuItem;
    AnularValesVenta1: TMenuItem;
    AnularVentas1: TMenuItem;
    N3: TMenuItem;
    ParametrosDocumentos1: TMenuItem;
    InformesporFecha1: TMenuItem;
    N2: TMenuItem;
    MantencinBasesdeDatos1: TMenuItem;
    MantencindeArtculos2: TMenuItem;
    MantencindeProveedores2: TMenuItem;
    Inventario1: TMenuItem;
    IngresodeMercadera1: TMenuItem;
    N1: TMenuItem;
    SALIR1: TMenuItem;
    procedure Salir1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure Correlativos1Click(Sender: TObject);
    procedure StockZeroAllArtics1Click(Sender: TObject);
    procedure AnularValesVenta1Click(Sender: TObject);
    procedure AnularVentas1Click(Sender: TObject);
    procedure InformesporFecha1Click(Sender: TObject);
    procedure MantencindeProveedores2Click(Sender: TObject);
    procedure MantencindeArtculos2Click(Sender: TObject);
    procedure IngresodeMercadera1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  AdminForm: TAdminForm;

implementation

uses MantArtics, MantCorre, StockZero, AnulaValeVenta, AnularVenta, SelFecha,
  MantProves, IngresoCompras;

{$R *.DFM}

procedure TAdminForm.Salir1Click(Sender: TObject);
begin
  Close;
end;

procedure TAdminForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action :=caFree;
end;

procedure TAdminForm.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  CanClose := True;
end;

procedure TAdminForm.Correlativos1Click(Sender: TObject);
begin
  MantCorrelativosForm.ShowModal;
end;

procedure TAdminForm.StockZeroAllArtics1Click(Sender: TObject);
begin
  StockZeroForm.ShowModal;
end;

procedure TAdminForm.AnularValesVenta1Click(Sender: TObject);
begin
  AnulaValeVentaForm.ShowModal;
end;

procedure TAdminForm.AnularVentas1Click(Sender: TObject);
begin
  AnularVentaForm.ShowModal;
end;

procedure TAdminForm.InformesporFecha1Click(Sender: TObject);
begin
  SelFechaForm.ShowModal;
end;

procedure TAdminForm.MantencindeProveedores2Click(Sender: TObject);
begin
  MantProveForm.ShowModal;
end;

procedure TAdminForm.MantencindeArtculos2Click(Sender: TObject);
begin
  MantArticsForm.ShowModal;
end;

procedure TAdminForm.IngresodeMercadera1Click(Sender: TObject);
begin
  IngresoComprasForm.ShowModal;
end;

end.
