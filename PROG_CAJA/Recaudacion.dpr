program Recaudacion;

uses
  Forms,
  Digita_Caja in 'Digita_Caja.pas' {CajaForm},
  Num2Word in 'Num2Word.pas',
  Impresion in 'Impresion.pas',
  Datos in 'Datos.pas' {DatosForm},
  Cheques in 'Cheques.pas' {ChequeForm};

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TCajaForm, CajaForm);
  Application.CreateForm(TDatosForm, DatosForm);
  Application.CreateForm(TChequeForm, ChequeForm);
  Application.Run;
end.
