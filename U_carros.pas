unit U_carros;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, U_Padrao, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.DBCtrls, Vcl.Buttons,
  Vcl.ExtCtrls, Vcl.Grids, Vcl.DBGrids, Vcl.StdCtrls, Vcl.Mask;

type
  TfrmCarros = class(TfrmPadrao)
    q_PadraoID_CARROS: TFDAutoIncField;
    q_PadraoNUMERO: TStringField;
    q_PadraoNOME: TStringField;
    q_PadraoMODELO: TStringField;
    q_PadraoCOR: TStringField;
    q_PadraoANO: TStringField;
    q_PadraoMOTOR: TStringField;
    q_PadraoCAMBIO: TStringField;
    q_PadraoCOMBUSTIVEL: TStringField;
    q_PadraoCADASTRO: TDateField;
    q_PadraoRENAVAN: TStringField;
    q_PadraoSINISTRO: TStringField;
    q_PadraoLEILAO: TStringField;
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    Label3: TLabel;
    DBEdit3: TDBEdit;
    Label4: TLabel;
    DBEdit4: TDBEdit;
    Label5: TLabel;
    DBEdit5: TDBEdit;
    Label6: TLabel;
    DBEdit6: TDBEdit;
    Label7: TLabel;
    DBEdit7: TDBEdit;
    Label8: TLabel;
    DBEdit8: TDBEdit;
    Label9: TLabel;
    DBEdit9: TDBEdit;
    Label10: TLabel;
    DBEdit10: TDBEdit;
    Label11: TLabel;
    DBEdit11: TDBEdit;
    Label12: TLabel;
    DBEdit12: TDBEdit;
    Label13: TLabel;
    DBEdit13: TDBEdit;
    Panel3: TPanel;
    q_PadraoVALOR: TFMTBCDField;
    q_PadraoTOTAL: TFMTBCDField;
    q_gridID_CARROS: TIntegerField;
    q_gridNUMERO: TStringField;
    q_gridNOME: TStringField;
    q_gridMODELO: TStringField;
    q_gridCOR: TStringField;
    q_gridANO: TStringField;
    q_gridMOTOR: TStringField;
    q_gridCAMBIO: TStringField;
    q_gridCOMBUSTIVEL: TStringField;
    q_gridCADASTRO: TDateField;
    q_gridRENAVAN: TStringField;
    q_gridSINISTRO: TStringField;
    q_gridLEILAO: TStringField;
    q_gridVALOR: TFMTBCDField;
    q_gridTOTAL: TFMTBCDField;
    db_valor: TDBEdit;
    Label14: TLabel;
    SpeedButton1: TSpeedButton;
    DBGrid1: TDBGrid;
    procedure bt_SalvarClick(Sender: TObject);
    procedure bt_AtualizarClick(Sender: TObject);
    procedure bt_ExcluirClick(Sender: TObject);
    procedure bt_EditarClick(Sender: TObject);
    procedure bt_PesquisarClick(Sender: TObject);
    procedure DBEdit2Exit(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCarros: TfrmCarros;

implementation

{$R *.dfm}

uses U_Consulta_Carros, u_Pesq_carros;

procedure TfrmCarros.bt_AtualizarClick(Sender: TObject);
begin
  inherited;
   q_grid.Refresh;
end;

procedure TfrmCarros.bt_EditarClick(Sender: TObject);
begin
   q_grid.Refresh;
end;

procedure TfrmCarros.bt_ExcluirClick(Sender: TObject);
begin
  inherited;
   q_grid.Refresh;
end;

procedure TfrmCarros.bt_PesquisarClick(Sender: TObject);
begin
     frmConsulta_carros:=TfrmConsulta_carros.Create(self);
     frmConsulta_carros.ShowModal;

     try

     finally
        frmConsulta_carros.Free;
        frmConsulta_carros:=nil;
     end;
end;

procedure TfrmCarros.bt_SalvarClick(Sender: TObject);
begin
  inherited;
   q_grid.Refresh;
end;

procedure TfrmCarros.DBEdit2Exit(Sender: TObject);
begin
 DBEdit10.Text := DateToStr(now);
end;

procedure TfrmCarros.DBGrid1DblClick(Sender: TObject);
begin
  inherited;
       q_Padrao.open;
       q_Padrao.Edit;
end;

procedure TfrmCarros.SpeedButton1Click(Sender: TObject);
begin
     q_Padrao.open;
     q_Padrao.Edit;
     Trata_Botoes;
end;

end.

