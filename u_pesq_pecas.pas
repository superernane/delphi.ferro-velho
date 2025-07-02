unit u_pesq_pecas;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Buttons, Vcl.StdCtrls, Vcl.ExtCtrls,
  Data.DB, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  Vcl.Grids, Vcl.DBGrids;

type
  Tfrm_pesq_pecas = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    ed_nome: TEdit;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    DBGrid1: TDBGrid;
    q_pesq_pecas: TFDQuery;
    ds_pesq_pecas: TDataSource;
    q_pesq_pecasID_PECAS: TIntegerField;
    q_pesq_pecasDESCRICAO: TStringField;
    q_pesq_pecasQUANTIDADE: TFMTBCDField;
    q_pesq_pecasV_VENDAS: TFMTBCDField;
    q_pesq_pecasCADASTRO: TDateField;
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure ed_nomeChange(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frm_pesq_pecas: Tfrm_pesq_pecas;

implementation

{$R *.dfm}

uses U_Pecas, U_DM, u_Vendas;

procedure Tfrm_pesq_pecas.DBGrid1DblClick(Sender: TObject);
begin
       frm_vendas.db_Codigo.Text    := q_pesq_PecasID_PECAS.Text;
       frm_vendas.db_desc.Text      := q_pesq_pecasDESCRICAO.Text;
       frm_vendas.db_qtd.SetFocus;
       close;
end;

procedure Tfrm_pesq_pecas.ed_nomeChange(Sender: TObject);
begin
       q_pesq_Pecas.Close;
       q_pesq_Pecas.SQL.Clear;
       q_pesq_Pecas.SQL.Add('select * from pecas');
       q_pesq_Pecas.SQL.Add('where descricao like =:pDesc');
       q_pesq_Pecas.ParamByName('pDesc').AsString :='%'+ ed_nome.Text + '%';
       q_pesq_Pecas.Open;
end;

procedure Tfrm_pesq_pecas.SpeedButton1Click(Sender: TObject);
begin
       q_pesq_Pecas.Close;
       q_pesq_Pecas.SQL.Clear;
       q_pesq_Pecas.SQL.Add('select * from pecas');
       q_pesq_Pecas.SQL.Add('where descricao like =:pDesc');
       q_pesq_Pecas.ParamByName('pDesc').AsString :='%'+ ed_nome.Text + '%';
       q_pesq_Pecas.Open;
end;

procedure Tfrm_pesq_pecas.SpeedButton2Click(Sender: TObject);
begin
   close;
end;

procedure Tfrm_pesq_pecas.SpeedButton3Click(Sender: TObject);
begin
    frmPecas:=TfrmPecas.Create(self);
    frmPecas.ShowModal;
end;

end.
