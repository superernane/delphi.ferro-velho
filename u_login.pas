unit u_login;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, Vcl.Imaging.pngimage, Vcl.ExtCtrls;

type
  Tfrm_login = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    bt_Login: TSpeedButton;
    SpeedButton1: TSpeedButton;
    ed_nome: TEdit;
    ed_senha: TEdit;
    q_acesso: TFDQuery;
    ds_acesso: TDataSource;
    q_acessoID_USUARIO: TIntegerField;
    q_acessoNOME: TStringField;
    q_acessoLOGIN: TStringField;
    q_acessoSENHA: TStringField;
    q_acessoTIPO: TStringField;
    q_acessoCADASTRO: TDateField;
    Panel2: TPanel;
    Panel1: TPanel;
    Image1: TImage;
    Label3: TLabel;
    procedure bt_LoginClick(Sender: TObject);
    procedure ed_nomeExit(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure SpeedButton1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frm_login: Tfrm_login;

implementation

{$R *.dfm}

uses U_DM, U_Principal;

procedure Tfrm_login.bt_LoginClick(Sender: TObject);
begin
    q_acesso.Open;
    if ed_nome.Text = '' then
    begin
    ShowMessage('Campo usuario deve ser preenchido.');
    ed_nome.SetFocus;

     end
    else //if (ed_nome.Text = q_acessoLOGIN.text)then
    begin
    q_Acesso.Close;
    q_Acesso.SQL.Clear;
    q_Acesso.Sql.Add('Select * FROM Usuarios WHERE ');
    q_Acesso.Sql.Add(' LOGIN = :ALOGIN AND SENHA = :ASENHA');
    q_Acesso.ParamByName('ALOGIN').AsString := ed_nome.Text;
    q_Acesso.ParamByName('ASENHA').AsString := Ed_Senha.Text;
    Q_Acesso.Active;
    q_Acesso.Open;

    // chamada do formulario principal
    frm_Login.Hide;
    frm_Principal:=Tfrm_Principal.Create(self);
    frm_Principal.ShowModal;
    end
    //else
       //ShowMessage(q_acessoLOGIN.Text + q_acessoSENHA.Text);
       //ShowMessage('Usuário ou senha ivalido.');
end;

procedure Tfrm_login.ed_nomeExit(Sender: TObject);
begin
   if (ed_nome.Text = '') then
    begin
      ShowMessage('Campo login deve ser preechido.');
      ed_nome.SetFocus;
    end;
end;

procedure Tfrm_login.FormKeyPress(Sender: TObject; var Key: Char);
begin
    if key=#13 then
    begin
      key:=#0;
      Perform(WM_NEXTDLGCTL,0,0);
    end;
end;

procedure Tfrm_login.FormShow(Sender: TObject);
begin
     ed_nome.SetFocus;
end;

procedure Tfrm_login.SpeedButton1Click(Sender: TObject);
begin
   Application.Terminate;
end;

end.
