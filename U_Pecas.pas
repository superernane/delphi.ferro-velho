unit U_Pecas;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, U_Padrao, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.DBCtrls, Vcl.Buttons,
  Vcl.ExtCtrls, Vcl.Grids, Vcl.DBGrids, Vcl.StdCtrls, Vcl.Mask;

type
  TfrmPecas = class(TfrmPadrao)
    q_PadraoID_PECAS: TFDAutoIncField;
    q_PadraoDESCRICAO: TStringField;
    q_PadraoQUANTIDADE: TFMTBCDField;
    q_PadraoV_VENDAS: TFMTBCDField;
    q_PadraoCADASTRO: TDateField;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label2: TLabel;
    db_nome: TDBEdit;
    Label3: TLabel;
    DBEdit3: TDBEdit;
    Label5: TLabel;
    DBEdit5: TDBEdit;
    Label6: TLabel;
    db_data: TDBEdit;
    GroupBox2: TGroupBox;
    DBGrid1: TDBGrid;
    procedure bt_FecharClick(Sender: TObject);
    procedure bt_NovoClick(Sender: TObject);
    procedure DBEdit1Exit(Sender: TObject);
    procedure bt_SalvarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPecas: TfrmPecas;

implementation

{$R *.dfm}

procedure TfrmPecas.bt_FecharClick(Sender: TObject);
begin
  inherited;
  close;
end;

procedure TfrmPecas.bt_NovoClick(Sender: TObject);
begin
  inherited;
   db_nome.SetFocus;
end;

procedure TfrmPecas.bt_SalvarClick(Sender: TObject);
begin
  inherited;
    q_Padrao.Refresh;
end;

procedure TfrmPecas.DBEdit1Exit(Sender: TObject);
begin
  inherited;
      db_data.Text := DateToStr(now);
end;

end.
