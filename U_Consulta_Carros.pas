unit U_Consulta_Carros;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids,
  Vcl.StdCtrls, Vcl.Buttons, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, frxClass, frxDBSet, Vcl.Mask;

type
  TfrmConsulta_carros = class(TForm)
    GroupBox1: TGroupBox;
    ed_Nome: TEdit;
    Label1: TLabel;
    LBL_NOME: TLabel;
    bt_ok: TSpeedButton;
    bt_Imprimir: TSpeedButton;
    SpeedButton3: TSpeedButton;
    SpeedButton5: TSpeedButton;
    q_Pesquisa: TFDQuery;
    DBGrid1: TDBGrid;
    ds_Pesquisa: TDataSource;
    cb_tipo: TComboBox;
    q_PesquisaID_CARROS: TIntegerField;
    q_PesquisaNUMERO: TStringField;
    q_PesquisaNOME: TStringField;
    q_PesquisaMODELO: TStringField;
    q_PesquisaCOR: TStringField;
    q_PesquisaANO: TStringField;
    q_PesquisaMOTOR: TStringField;
    q_PesquisaCAMBIO: TStringField;
    q_PesquisaCOMBUSTIVEL: TStringField;
    q_PesquisaCADASTRO: TDateField;
    q_PesquisaRENAVAN: TStringField;
    q_PesquisaSINISTRO: TStringField;
    q_PesquisaLEILAO: TStringField;
    q_PesquisaVALOR: TFMTBCDField;
    q_PesquisaTOTAL: TFMTBCDField;
    fdx_pordatas: TfrxReport;
    fdx_por_num: TfrxReport;
    fq_carros: TfrxDBDataset;
    ED_INICIO: TMaskEdit;
    ED_FIM: TMaskEdit;
    LBL_I: TLabel;
    lbl_f: TLabel;
    procedure SpeedButton3Click(Sender: TObject);
    procedure bt_okClick(Sender: TObject);
    procedure bt_ImprimirClick(Sender: TObject);
    procedure cb_tipoChange(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure fdx_pordatasBeforePrint(Sender: TfrxReportComponent);
    procedure SpeedButton5Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmConsulta_carros: TfrmConsulta_carros;

implementation

{$R *.dfm}

uses U_DM;

procedure TfrmConsulta_carros.bt_ImprimirClick(Sender: TObject);
var
   caminho : string;
begin
  case cb_tipo.ItemIndex of
  0:begin
    caminho:= ExtractFilePath(Application.ExeName);
   if fdx_por_num.LoadFromFile (caminho + 'Rel_por_num.fr3') then
 begin
     fdx_por_num.Clear;
     fdx_por_num.LoadFromFile(ExtractFilePath(Application.ExeName) + 'Rel_por_num.fr3');
     fdx_por_num.PrepareReport(true);
     fdx_por_num.ShowPreparedReport;
    end
    else
    begin
    MessageDlg('Relatorio não encontrado.',mtError,[mbOK],0);
    end;
  end;
  1:begin
    caminho:= ExtractFilePath(Application.ExeName);
   if fdx_por_num.LoadFromFile (caminho + 'Rel_por_num.fr3') then
 begin
     fdx_por_num.Clear;
     fdx_por_num.LoadFromFile(ExtractFilePath(Application.ExeName) + 'Rel_por_num.fr3');
     fdx_por_num.PrepareReport(true);
     fdx_por_num.ShowPreparedReport;
    end
    else
    begin
    MessageDlg('Relatorio não encontrado.',mtError,[mbOK],0);
    end;
  end;
 2:begin
    caminho:= ExtractFilePath(Application.ExeName);
   if fdx_por_num.LoadFromFile (caminho + 'Rel_por_periodo.fr3') then
  begin
     fdx_por_num.Clear;
     fdx_por_num.LoadFromFile(ExtractFilePath(Application.ExeName) + 'Rel_por_periodo.fr3');
     fdx_por_num.PrepareReport(true);
     fdx_por_num.ShowPreparedReport;
    end
    else
    begin
    MessageDlg('Relatorio não encontrado.',mtError,[mbOK],0);
    end;
  end;
  end;
  end;

procedure TfrmConsulta_carros.bt_okClick(Sender: TObject);
begin
    q_Pesquisa.Close;
    q_Pesquisa.SQL.Clear;
    q_Pesquisa.SQL.Add('select * from carros');
    case cb_tipo.ItemIndex of
    0:begin
        q_Pesquisa.SQL.Add('where numero like :pnumero');
        q_Pesquisa.ParamByName('pnumero').AsString:='%'+ ed_nome.Text + '%';
        q_Pesquisa.Open;
    end;
    1:begin
        q_Pesquisa.SQL.Add('where nome like :pnome');
        q_Pesquisa.ParamByName('pnome').AsString:='%'+ ed_nome.Text + '%';
        q_Pesquisa.Open;
    end;
    2:begin
        q_Pesquisa.SQL.Add('where cadastro BETWEEN  :D_INICIO AND :D_FIM');
        q_Pesquisa.ParamByName('D_INICIO').AsDate:= StrToDate(ED_INICIO.Text);
        q_Pesquisa.ParamByName('D_FIM').AsDate:=StrToDate(ED_FIM.Text);
        q_Pesquisa.Open;
    end;
end;
end;

procedure TfrmConsulta_carros.cb_tipoChange(Sender: TObject);
begin
     case cb_tipo.ItemIndex of
     0:begin
       ed_Nome.Visible  := true;
       LBL_NOME.Visible := true;
       ED_INICIO.Visible := false;
       ED_FIM.Visible    := false;
       lbl_f.Visible     := false;
       LBL_I.Visible     := False;
     end;
     1:begin
       ED_INICIO.Visible := false;
       ED_FIM.Visible    := false;
       lbl_f.Visible     := false;
       LBL_I.Visible     := False;
       ed_Nome.Visible   := true;
       LBL_NOME.Visible  := true;
     end;
     2:begin
       ED_INICIO.Visible := true;
       ED_FIM.Visible    := true;
       lbl_f.Visible     := true;
       LBL_I.Visible     := true;
       ed_Nome.Visible   := false;
       LBL_NOME.Visible  := false;
       ED_INICIO.SetFocus;
     end;
     end;
end;

procedure TfrmConsulta_carros.fdx_pordatasBeforePrint(
  Sender: TfrxReportComponent);
begin
     fdx_pordatas.Variables['data1']:= ED_INICIO.Text + ' a ' + ED_FIM.Text;;
end;

procedure TfrmConsulta_carros.FormKeyPress(Sender: TObject; var Key: Char);
begin
    if key=#13 then
    begin
      Key := #0;
      Perform(WM_NEXTDLGCTL,0,0);
    end;
end;

procedure TfrmConsulta_carros.SpeedButton3Click(Sender: TObject);
begin
   close;
end;

procedure TfrmConsulta_carros.SpeedButton5Click(Sender: TObject);
begin
  if MessageDlg('Deseja excluir esse registro? ',mtConfirmation,[mbYes,mbCancel],0)=mrYes then
    begin
      q_Pesquisa.Delete;
      q_Pesquisa.Refresh;
    end;

end;

end.
