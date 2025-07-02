unit u_Vendas;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.UI.Intf, FireDAC.VCLUI.Wait,
  FireDAC.Phys.FBDef, FireDAC.Phys, FireDAC.Phys.IBBase, FireDAC.Phys.FB,
  FireDAC.Comp.UI, Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  Vcl.Grids, Vcl.DBGrids, Vcl.Mask, Vcl.DBCtrls, Vcl.ExtCtrls;

type
  Tfrm_vendas = class(TForm)
    Panel1: TPanel;
    bt_ok_c: TSpeedButton;
    DBGrid1: TDBGrid;
    FDGUIxWaitCursor1: TFDGUIxWaitCursor;
    FDPhysFBDriverLink1: TFDPhysFBDriverLink;
    Panel2: TPanel;
    SpeedButton5: TSpeedButton;
    Panel3: TPanel;
    bt_excluir: TSpeedButton;
    Label6: TLabel;
    Label11: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    lb_total: TLabel;
    db_data: TDBEdit;
    db_valor: TDBEdit;
    db_qtd: TDBEdit;
    db_desc: TDBEdit;
    db_codigo: TDBEdit;
    bt_ok_p: TSpeedButton;
    Label7: TLabel;
    db_num: TDBEdit;
    Ed_num: TEdit;
    Label12: TLabel;
    DBGrid2: TDBGrid;
    ds_carros: TDataSource;
    q_carros: TFDQuery;
    q_carrosID_CARROS: TIntegerField;
    q_carrosNUMERO: TStringField;
    q_carrosNOME: TStringField;
    q_carrosMODELO: TStringField;
    q_carrosCOR: TStringField;
    q_carrosANO: TStringField;
    q_carrosMOTOR: TStringField;
    q_carrosCAMBIO: TStringField;
    q_carrosCOMBUSTIVEL: TStringField;
    q_pecas: TFDQuery;
    ds_vendas: TDataSource;
    q_vendas: TFDQuery;
    q_vendasID_VENDAS: TIntegerField;
    q_vendasID_CARROS: TIntegerField;
    q_vendasDESCRICAO: TStringField;
    q_vendasQTD: TFMTBCDField;
    q_vendasV_VENDAS: TFMTBCDField;
    q_vendasCADASTRO: TDateField;
    q_vendasNUMERO: TStringField;
    q_vendasSUB_TOTAL: TFMTBCDField;
    q_vendasTOTAL: TFMTBCDField;
    db_total: TDBEdit;
    bt_item: TButton;
    SpeedButton1: TSpeedButton;
    procedure SpeedButton5Click(Sender: TObject);
    procedure bt_ok_cClick(Sender: TObject);
    procedure ed_quantKeyPress(Sender: TObject; var Key: Char);
    procedure bt_ok_pClick(Sender: TObject);
    procedure bt_excluirClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure bt_novoClick(Sender: TObject);
    procedure ligar ();
    procedure bt_itemClick(Sender: TObject);
    procedure liga_item();
    procedure db_codigoExit(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure db_valorExit(Sender: TObject);
    procedure db_dataExit(Sender: TObject);
    procedure bt_lancarClick(Sender: TObject);
    procedure Ed_numChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure SomaTotal();
    procedure DBGrid1CellClick(Column: TColumn);
    procedure DBGrid2CellClick(Column: TColumn);
    procedure SpeedButton1Click(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frm_vendas: Tfrm_vendas;

implementation

{$R *.dfm}

uses U_DM, u_Pesq_carros, u_pesq_pecas;

procedure Tfrm_vendas.bt_itemClick(Sender: TObject);
var
   prox : integer;
begin
        liga_item;
        q_Vendas.Open;
        q_Vendas.Last;
        q_Vendas.Append;
        prox := q_VendasID_VENDAS.AsInteger +1;
        q_VendasID_VENDAS.AsInteger := prox;
        db_desc.SetFocus;

end;

procedure Tfrm_vendas.bt_lancarClick(Sender: TObject);
begin
    q_Vendas.Open;
    q_Vendas.Edit;
    q_Vendas.Post;

end;

procedure Tfrm_vendas.bt_novoClick(Sender: TObject);
begin
     q_Vendas.Open;
     q_Vendas.Append;
     ligar;

end;

procedure Tfrm_vendas.ed_quantKeyPress(Sender: TObject; var Key: Char);
begin
      if key=#13 then
      begin
        key:=#0;

      end;
end;

procedure Tfrm_vendas.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   q_Vendas.Close;
   q_carros.Close;
end;

procedure Tfrm_vendas.FormKeyPress(Sender: TObject; var Key: Char);
begin
      if key=#13 then
      begin
        key:=#0;
        Perform(WM_NEXTDLGCTL,0,0);
      end;
end;

procedure Tfrm_vendas.FormShow(Sender: TObject);
begin
    Ed_num.SetFocus;
end;

procedure Tfrm_vendas.ligar;
begin
    bt_ok_c.Enabled   := true;
    ed_num.Enabled    := true;


end;

procedure Tfrm_vendas.liga_item;
begin
      bt_ok_p.Enabled   := true;
      bt_excluir.Enabled:= true;
      db_codigo.Enabled := true;
      db_qtd.Enabled    := true;
      db_valor.Enabled  := true;
      db_data.Enabled   := true;
      db_total.Enabled  := true;
      db_desc.Enabled   := true;
      bt_item.Enabled   := TRUE;
      db_codigo.SetFocus;
end;

procedure Tfrm_vendas.bt_ok_cClick(Sender: TObject);
begin
   frm_Pesq_Carros:= tfrm_Pesq_Carros.Create(self);
   frm_Pesq_Carros.ShowModal;
end;

procedure Tfrm_vendas.bt_ok_pClick(Sender: TObject);
begin
   frm_pesq_pecas:=Tfrm_pesq_pecas.Create(self);
   frm_pesq_pecas.ShowModal;
end;


procedure Tfrm_vendas.DBGrid1CellClick(Column: TColumn);
begin
        q_vendas.Open();
        q_vendas.Edit;
end;

procedure Tfrm_vendas.DBGrid2CellClick(Column: TColumn);
begin
     q_carros.Open();
     q_vendas.Open();
     q_carros.Edit;
end;

procedure Tfrm_vendas.db_codigoExit(Sender: TObject);

begin
       //if q_vendasID_VENDAS.AsInteger  > 0 then
          BEGIN

           db_data.Text := DateToStr(now);
           q_VendasQTD.AsFloat:=1;

           // PEGA O VALOR DE PRODUTO
           q_VendasV_VENDAS.AsFloat :=
           q_Vendas.FieldByName('v_vendas').AsFloat;

           // SOMA O VALOR
           q_VendasTOTAL.AsFloat := (q_VendasQTD.AsFloat) *
           (q_VendasV_VENDAS.AsFloat);
           db_num.Text := q_carrosNUMERO.Text;
           q_vendas.Edit;


       end ;


end;

procedure Tfrm_vendas.db_dataExit(Sender: TObject);
var
   prox : Integer;
begin
     
end;

procedure Tfrm_vendas.db_valorExit(Sender: TObject);
var
     prox : Integer;

begin
     q_vendasSUB_TOTAL.AsFloat := (q_VendasQTD.AsFloat) * (q_VendasV_VENDAS.AsFloat);
     q_vendasTOTAL.AsFloat := q_vendasSUB_TOTAL.AsFloat;
     bt_item.SetFocus;
     q_vendas.Edit;
     q_vendas.Post;
end;

procedure Tfrm_vendas.Ed_numChange(Sender: TObject);
begin

     q_Carros.Close;
     q_Carros.SQL.Clear;
     q_Carros.SQL.Add('SELECT * FROM CARROS');
     q_Carros.SQL.Add('WHERE NUMERO LIKE :PNum');
     q_Carros.ParamByName('PNum').AsString := '%' + Ed_num.Text + '%';
     q_Carros.Open;
     q_carros.Edit;
end;

procedure Tfrm_vendas.bt_excluirClick(Sender: TObject);
begin
    if MessageDlg('Deseja excluir esse registro?',mtConfirmation, [mbOK,mbCancel],0)=mrOk then
       begin
         q_Vendas.Delete;
         q_Vendas.Refresh;
       end;
end;

procedure Tfrm_vendas.SomaTotal;
begin
     q_vendas.Close;
     q_vendas.SQL.Add('select sum(sub_total) as total from vendas');
     q_vendas.Open;
end;

procedure Tfrm_vendas.SpeedButton1Click(Sender: TObject);
begin
     liga_item;
     q_vendas.Open;
     q_vendas.Edit;
end;

procedure Tfrm_vendas.SpeedButton5Click(Sender: TObject);
begin
   close;
end;

end.
