unit u_Pesq_vendas;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.StdCtrls, Vcl.Grids,
  Vcl.DBGrids, Vcl.ExtCtrls, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, FireDAC.UI.Intf,
  FireDAC.VCLUI.Wait, FireDAC.Phys.FBDef, FireDAC.Phys, FireDAC.Phys.IBBase,
  FireDAC.Phys.FB, FireDAC.Comp.UI, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  Vcl.Buttons, frxClass, frxDBSet, Vcl.Mask, Vcl.DBCtrls;

type
  Tfrm_Pesq_Vendas = class(TForm)
    Panel2: TPanel;
    Panel3: TPanel;
    DBGrid1: TDBGrid;
    DBGrid2: TDBGrid;
    Panel1: TPanel;
    Label1: TLabel;
    ed_num: TEdit;
    ds_Carros: TDataSource;
    ds_vendas: TDataSource;
    Q_Vendas: TFDQuery;
    q_Carros: TFDQuery;
    FDGUIxWaitCursor1: TFDGUIxWaitCursor;
    FDPhysFBDriverLink1: TFDPhysFBDriverLink;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    fr_rel_vendas: TfrxReport;
    dbq_carros: TfrxDBDataset;
    dbq_vendas: TfrxDBDataset;
    q_CarrosID_CARROS: TIntegerField;
    q_CarrosNUMERO: TStringField;
    q_CarrosNOME: TStringField;
    q_CarrosMODELO: TStringField;
    q_CarrosCOR: TStringField;
    q_CarrosANO: TStringField;
    q_CarrosMOTOR: TStringField;
    q_CarrosCAMBIO: TStringField;
    q_CarrosCOMBUSTIVEL: TStringField;
    q_CarrosCADASTRO: TDateField;
    q_CarrosRENAVAN: TStringField;
    q_CarrosSINISTRO: TStringField;
    q_CarrosLEILAO: TStringField;
    q_CarrosVALOR: TFMTBCDField;
    q_CarrosTOTAL: TFMTBCDField;
    Q_VendasID_VENDAS: TIntegerField;
    Q_VendasDESCRICAO: TStringField;
    Q_VendasQTD: TFMTBCDField;
    Q_VendasV_VENDAS: TFMTBCDField;
    Q_VendasCADASTRO: TDateField;
    Q_VendasNUMERO: TStringField;
    Q_VendasTOTAL: TFMTBCDField;
    Q_VendasID_CARROS: TIntegerField;
    Q_VendasID_PECAS: TIntegerField;
    Q_VendasSUB_TOTAL: TFMTBCDField;
    Q_VendasSALDO: TFMTBCDField;
    procedure ed_numChange(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure SpeedButton1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frm_Pesq_Vendas: Tfrm_Pesq_Vendas;

implementation

{$R *.dfm}

uses U_DM;

procedure Tfrm_Pesq_Vendas.ed_numChange(Sender: TObject);
begin
     q_Carros.Close;
     q_Carros.SQL.Clear;
     q_Carros.SQL.Add('SELECT * FROM CARROS');
     q_Carros.SQL.Add('WHERE NUMERO LIKE :PNum');
     q_Carros.ParamByName('PNum').AsString := '%' + Ed_num.Text + '%';
     q_Carros.Open;
     Q_Vendas.Open;
     q_carros.Edit;
end;

procedure Tfrm_Pesq_Vendas.FormClose(Sender: TObject; var Action: TCloseAction);
begin
     q_Carros.Close;
     Q_Vendas.Close;
end;

procedure Tfrm_Pesq_Vendas.SpeedButton1Click(Sender: TObject);
var
   caminho : string;
begin

     caminho:= ExtractFilePath(Application.ExeName);
   if fr_rel_vendas.LoadFromFile (caminho + 'Rel_Vendas.fr3') then
  begin
     fr_rel_vendas.Clear;
     fr_rel_vendas.LoadFromFile(ExtractFilePath(Application.ExeName) + 'Rel_Vendas.fr3');
     fr_rel_vendas.PrepareReport(true);
     fr_rel_vendas.ShowPreparedReport;
    end
    else
    begin
    MessageDlg('Relatorio não encontrado.',mtError,[mbOK],0);
    end;
end;

procedure Tfrm_Pesq_Vendas.SpeedButton2Click(Sender: TObject);
begin
      if MessageDlg('Deseja excluir esse registro?',mtConfirmation, [mbOK,mbCancel],0)=mrOk then
       begin
         q_Vendas.Delete;
         q_Vendas.Refresh;
       end;
end;

procedure Tfrm_Pesq_Vendas.SpeedButton3Click(Sender: TObject);
begin
    close;
end;

end.
