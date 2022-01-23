unit MantArtics;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DBCtrls, Db, DBTables, Grids, DBGrids, ExtCtrls, StdCtrls, Buttons;

type
  TMantArticsForm = class(TForm)
    Panel1: TPanel;
    DSArtics: TDataSource;
    Artics: TTable;
    BitBtn1: TBitBtn;
    Grid: TDBGrid;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    SpeedButton4: TSpeedButton;
    BtnAgrega: TSpeedButton;
    BtnEdita: TSpeedButton;
    BtnAcepta: TSpeedButton;
    BtnCancela: TSpeedButton;
    Busca: TEdit;
    ArticsCODIGO: TStringField;
    ArticsALTER1: TStringField;
    ArticsALTER2: TStringField;
    ArticsNOMBRE: TStringField;
    ArticsMODIF: TBooleanField;
    ArticsDESC: TFloatField;
    ArticsTIPODESC: TBooleanField;
    ArticsPRECIO: TFloatField;
    ArticsSTOCK: TFloatField;
    ArticsCOMP1: TSmallintField;
    ArticsCOMP2: TSmallintField;
    ArticsCOMP3: TSmallintField;
    ArticsCOMP4: TSmallintField;
    ArticsCOMP5: TSmallintField;
    ArticsCOMP6: TSmallintField;
    ArticsCOMP7: TSmallintField;
    ArticsCOMP8: TSmallintField;
    ArticsCOMP9: TSmallintField;
    ArticsCOMP10: TSmallintField;
    ArticsCOMP11: TSmallintField;
    ArticsCOMP12: TSmallintField;
    ArticsCOMP13: TSmallintField;
    ArticsCOMP14: TSmallintField;
    ArticsCOMP15: TSmallintField;
    ArticsVUCOMPRA: TFloatField;
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure BtnAgregaClick(Sender: TObject);
    procedure BtnEditaClick(Sender: TObject);
    procedure BtnCancelaClick(Sender: TObject);
    procedure BtnAceptaClick(Sender: TObject);
    procedure GridKeyPress(Sender: TObject; var Key: Char);
    procedure BuscaChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  MantArticsForm: TMantArticsForm;

implementation

{$R *.DFM}

procedure TMantArticsForm.SpeedButton1Click(Sender: TObject);
begin
  Artics.First;
end;

procedure TMantArticsForm.SpeedButton2Click(Sender: TObject);
begin
  Artics.Prior;
end;

procedure TMantArticsForm.SpeedButton3Click(Sender: TObject);
begin
  Artics.Next;
end;

procedure TMantArticsForm.SpeedButton4Click(Sender: TObject);
begin
  Artics.Last;
end;

procedure TMantArticsForm.BtnAgregaClick(Sender: TObject);
begin
  Artics.Insert;
  Grid.Options := [dgTitles,dgIndicator,dgColLines,dgRowLines,dgTabs,dgEditing,dgAlwaysShowSelection,dgConfirmDelete,dgCancelOnExit]
end;

procedure TMantArticsForm.BtnEditaClick(Sender: TObject);
begin
  Artics.Edit;
  Grid.Options := [dgTitles,dgIndicator,dgColLines,dgRowLines,dgTabs,dgEditing,dgAlwaysShowSelection,dgConfirmDelete,dgCancelOnExit]
end;

procedure TMantArticsForm.BtnCancelaClick(Sender: TObject);
begin
  If Artics.State in [dsEdit, dsInsert] Then Artics.Cancel;
  Grid.Options := [dgTitles,dgIndicator,dgColLines,dgRowLines,dgTabs,dgRowSelect,dgAlwaysShowSelection,dgConfirmDelete,dgCancelOnExit]
end;

procedure TMantArticsForm.BtnAceptaClick(Sender: TObject);
begin
  If Artics.State in [dsEdit, dsInsert] Then
    Begin
      Artics.Post;
      Grid.Options := [dgTitles,dgIndicator,dgColLines,dgRowLines,dgTabs,dgRowSelect,dgAlwaysShowSelection,dgConfirmDelete,dgCancelOnExit]
    End;
end;

procedure TMantArticsForm.GridKeyPress(Sender: TObject; var Key: Char);
begin
{  If Key = #13 Then
    Begin
      If Artics.State in [dsEdit, dsInsert] Then
        Begin
          Artics.Post;
          Grid.Options := [dgTitles,dgIndicator,dgColLines,dgRowLines,dgTabs,dgRowSelect,dgAlwaysShowSelection,dgConfirmDelete,dgCancelOnExit]
        End
      Else
        Begin
          Artics.Last;
          Artics.Append;
          Grid.Options := [dgTitles,dgIndicator,dgColLines,dgRowLines,dgTabs,dgEditing,dgAlwaysShowSelection,dgConfirmDelete,dgCancelOnExit]
        End;

    End;
 }   
end;

procedure TMantArticsForm.BuscaChange(Sender: TObject);
begin
  Artics.IndexFieldNames := 'NOMBRE';
  Artics.SetKey;
  ArticsNombre.Value := Busca.Text;
  Artics.GotoNearest;
end;

procedure TMantArticsForm.FormCreate(Sender: TObject);
begin
  Artics.Open;
end;

end.
