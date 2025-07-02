unit U_Usuarios;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, U_Padrao, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.DBCtrls, Vcl.Buttons,
  Vcl.ExtCtrls, Vcl.Grids, Vcl.DBGrids, Vcl.StdCtrls, Vcl.Mask;

type
  TfrmUsuarios = class(TfrmPadrao)
    q_PadraoID_USUARIO: TFDAutoIncField;
    q_PadraoNOME: TStringField;
    q_PadraoLOGIN: TStringField;
    q_PadraoSENHA: TStringField;
    q_PadraoTIPO: TStringField;
    q_PadraoCADASTRO: TDateField;
    DBEdit1: TDBEdit;
    DB_NOME: TDBEdit;
    DBEdit3: TDBEdit;
    DBEdit4: TDBEdit;
    DBEdit5: TDBEdit;
    db_Data: TDBEdit;
    Panel3: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    GroupBox1: TGroupBox;
    DBGrid1: TDBGrid;
    procedure bt_FecharClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmUsuarios: TfrmUsuarios;

implementation

{$R *.dfm}

uses U_DM;

procedure TfrmUsuarios.bt_FecharClick(Sender: TObject);
begin
  inherited;
   CLOSE;
end;

end.
