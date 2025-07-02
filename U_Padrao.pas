unit U_Padrao;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.DBCtrls, Vcl.Buttons;

type
  TfrmPadrao = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    bt_Novo: TSpeedButton;
    bt_Salvar: TSpeedButton;
    bt_Cancelar: TSpeedButton;
    bt_Fechar: TSpeedButton;
    DBNavigator1: TDBNavigator;
    ds_padao: TDataSource;
    q_Padrao: TFDQuery;
    ds_grid: TDataSource;
    q_grid: TFDQuery;
    procedure bt_FecharClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure Trata_Botoes();
    procedure bt_NovoClick(Sender: TObject);
    procedure bt_EditarClick(Sender: TObject);
    procedure bt_SalvarClick(Sender: TObject);
    procedure bt_ExcluirClick(Sender: TObject);
    procedure bt_CancelarClick(Sender: TObject);
    procedure bt_AtualizarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPadrao: TfrmPadrao;

implementation

{$R *.dfm}

uses U_DM;

procedure TfrmPadrao.bt_NovoClick(Sender: TObject);
begin
   q_Padrao.Open;
   Trata_Botoes;
   q_Padrao.Append;

end;

procedure TfrmPadrao.bt_SalvarClick(Sender: TObject);
begin
    Trata_Botoes;
    q_Padrao.Post;
    q_Padrao.Refresh;
end;

procedure TfrmPadrao.FormKeyPress(Sender: TObject; var Key: Char);
begin
    if key=#13 then
     begin
       key:=#0;
       Perform(WM_NEXTDLGCTL,0,0);
     end;
end;

procedure TfrmPadrao.bt_AtualizarClick(Sender: TObject);
begin
     Trata_Botoes;
     q_Padrao.Refresh;
end;

procedure TfrmPadrao.bt_CancelarClick(Sender: TObject);
begin
     Trata_Botoes;
     q_Padrao.Cancel;
     q_Padrao.Refresh;
end;

procedure TfrmPadrao.bt_EditarClick(Sender: TObject);
begin
   Trata_Botoes;
   q_Padrao.edit ;
end;

procedure TfrmPadrao.bt_ExcluirClick(Sender: TObject);
begin
   Trata_Botoes;
if MessageDlg('Deseja excluir esse registro!',mtConfirmation,[mbYes,mbCancel],0)=mrYes then
   begin
   q_Padrao.Delete;
   MessageDlg('Registro excluido com sucesso!',mtInformation,[mbOK],0);
   end
   else
   q_Padrao.Cancel;
end;

procedure TfrmPadrao.bt_FecharClick(Sender: TObject);
begin
     close;

end;

procedure TfrmPadrao.Trata_Botoes;
begin
    bt_Novo.Enabled := not  bt_Novo.Enabled;
    bt_Salvar.Enabled := not bt_Salvar.Enabled;
    bt_Cancelar.Enabled := not bt_Cancelar.Enabled;
    bt_Fechar.Enabled := not bt_fechar.Enabled;
end;

end.
