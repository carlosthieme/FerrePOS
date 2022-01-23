program Administracion;

uses
  Forms,
  MainAdmin in 'MainAdmin.pas' {AdminForm},
  StockZero in 'StockZero.pas' {StockZeroForm},
  MantArtics in 'MantArtics.pas' {MantArticsForm},
  MantCorre in 'MantCorre.pas' {MantCorrelativosForm},
  AnulaValeVenta in 'AnulaValeVenta.pas' {AnulaValeVentaForm},
  AnularVenta in 'AnularVenta.pas' {AnularVentaForm},
  SelFecha in 'SelFecha.pas' {SelFechaForm},
  CuadraCaja in 'CuadraCaja.pas' {CuadraCajaForm},
  TraspaFecha in 'TraspaFecha.pas' {TraspaFechaForm},
  VentasFecha in 'VentasFecha.pas' {VentasFechaForm},
  IngresoCompras in 'IngresoCompras.pas' {IngresoComprasForm},
  MantProves in 'MantProves.pas' {MantProveForm};

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TAdminForm, AdminForm);
  Application.CreateForm(TStockZeroForm, StockZeroForm);
  Application.CreateForm(TMantArticsForm, MantArticsForm);
  Application.CreateForm(TMantCorrelativosForm, MantCorrelativosForm);
  Application.CreateForm(TAnulaValeVentaForm, AnulaValeVentaForm);
  Application.CreateForm(TAnularVentaForm, AnularVentaForm);
  Application.CreateForm(TSelFechaForm, SelFechaForm);
  Application.CreateForm(TCuadraCajaForm, CuadraCajaForm);
  Application.CreateForm(TTraspaFechaForm, TraspaFechaForm);
  Application.CreateForm(TVentasFechaForm, VentasFechaForm);
  Application.CreateForm(TIngresoComprasForm, IngresoComprasForm);
  Application.CreateForm(TMantProveForm, MantProveForm);
  Application.Run;
end.
