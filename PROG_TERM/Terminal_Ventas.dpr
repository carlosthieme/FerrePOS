program Terminal_Ventas;

uses
  Forms,
  Digita_Ventas in 'Digita_Ventas.pas' {IngresosForm};

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TIngresosForm, IngresosForm);
  Application.Run;
end.
