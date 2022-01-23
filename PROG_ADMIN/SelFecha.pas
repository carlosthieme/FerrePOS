unit SelFecha;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, StdCtrls, Buttons, ComCtrls;

type
  TSelFechaForm = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    FechaSel: TDateTimePicker;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Grupo: TRadioGroup;
    Label2: TLabel;
    FechaSel2: TDateTimePicker;
    procedure BitBtn1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  SelFechaForm: TSelFechaForm;
  Filtro : String;
  FechaIni, FechaFin : String;
implementation

uses CuadraCaja, VentasFecha, TraspaFecha;

{$R *.DFM}

procedure TSelFechaForm.BitBtn1Click(Sender: TObject);
begin
  FechaIni := DateToStr(FechaSel.Date);
  FechaFin := DateToStr(FechaSel2.Date);
  Case Grupo.ItemIndex Of
    0 : Begin
          Filtro := 'Fecha >= ' + '''' + FechaIni + '''' + ' And ' + 'Fecha <=' + '''' + FechaFin + '''';
          VentasFechaForm.Table1.Filter := Filtro;
          VentasFechaForm.RepVentaFecha.Preview;
        End;
    2 : Begin
          Filtro := 'FechaEmi >= ' + '''' + FechaIni + '''' + ' And ' + 'FechaEmi <=' + '''' + FechaFin + '''';
          CuadraCajaForm.Table1.Filter := Filtro;
          CuadraCajaForm.RepCuadra.Preview;
        End;
    3 : Begin
          Filtro := 'Fecha >= ' + '''' + FechaIni + '''' + ' And ' + 'Fecha <=' + '''' + FechaFin + '''' + ' And ' + 'Documento =' + '''' + 'T' + '''';
          TraspaFechaForm.Table1.Filter := Filtro;
          TraspaFechaForm.RepTraspaFecha.Preview;
        End;
  End;
end;



procedure TSelFechaForm.FormCreate(Sender: TObject);
begin
  FechaSel.Date  := Now;
  FechaSel2.Date := Now;
end;

end.
