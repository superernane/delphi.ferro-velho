unit u_Pesq_carros;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls,
  Data.DB, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  Vcl.Grids, Vcl.DBGrids;

type
  Tfrm_Pesq_Carros = class(TForm)
    Panel1: TPanel;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    cb_tipo: TComboBox;
    Label1: TLabel;
    ed_nome: TEdit;
    Label2: TLabel;
    DBGrid1: TDBGrid;
    ds_Pesq_carros: TDataSource;
    q_Pesq_carros: TFDQuery;
    q_Pesq_carrosID_CARROS: TIntegerField;
    q_Pesq_carrosNUMERO: TStringField;
    q_Pesq_carrosNOME: TStringField;
    q_Pesq_carrosMODELO: TStringField;
    q_Pesq_carrosCOR: TStringField;
    q_Pesq_carrosANO: TStringField;
    q_Pesq_carrosMOTOR: TStringField;
    q_Pesq_carrosCAMBIO: TStringField;
    q_Pesq_carrosCOMBUSTIVEL: TStringField;
    q_Pesq_carrosCADASTRO: TDateField;
    q_Pesq_carrosRENAVAN: TStringField;
    q_Pesq_carrosSINISTRO: TStringField;
    q_Pesq_carrosLEILAO: TStringField;
    q_Pesq_carrosVALOR: TFMTBCDField;
    q_Pesq_carrosTOTAL: TFMTBCDField;
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frm_Pesq_Carros: Tfrm_Pesq_Carros;

implementation

{$R *.dfm}

uses U_DM, u_Vendas;

procedure Tfrm_Pesq_Carros.SpeedButton1Click(Sender: TObject);
begin
    q_Pesq_carros.Close;
    q_Pesq_carros.SQL.Clear;
    q_Pesq_carros.SQL.Add('select * from carros');
    case cb_tipo.ItemIndex of
    0:begin
        q_Pesq_carros.SQL.Add('where numero like :pnumero');
        q_Pesq_carros.ParamByName('pnumero').AsString:='%'+ ed_nome.Text + '%';
        q_Pesq_carros.Open;
    end;
    1:begin
        q_Pesq_carros.SQL.Add('where nome like :pnome');
        q_Pesq_carros.ParamByName('pnome').AsString:='%'+ ed_nome.Text + '%';
        q_Pesq_carros.Open;
    end;
    2:begin
        q_Pesq_carros.SQL.Add('where cadastro and cadastro  =:d_Inicio, dFim');
        q_Pesq_carros.ParamByName('pnome').AsString:='%'+ ed_nome.Text + '%';
        q_Pesq_carros.Open;
    end;
    end;


end;

procedure Tfrm_Pesq_Carros.SpeedButton2Click(Sender: TObject);
begin
   close;
end;

end.


