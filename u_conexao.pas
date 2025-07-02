unit u_conexao;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs,winsock, Inifiles, DB, Vcl.StdCtrls,
  Vcl.Buttons;

type
  Tfrm_conexao = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Bt_ip_servidor: TSpeedButton;
    bt_ip: TSpeedButton;
    bt_sair: TSpeedButton;
    ed_meuip: TEdit;
    Ed_Banco: TEdit;
    Ed_ipservidor: TEdit;
    procedure bt_ipClick(Sender: TObject);
    procedure Bt_ip_servidorClick(Sender: TObject);
    procedure bt_sairClick(Sender: TObject);
  private
    { Private declarations }
  public
     config :TInifile;
    { Public declarations }
  end;

var
  frm_conexao: Tfrm_conexao;

implementation

{$R *.dfm}

uses U_DM;

function GetIpMachine: String;
var
  wsaData : TWSAData;
begin
  WSAStartup(257, wsaData);
  Result := Trim(inet_ntoa( PInAddr( GetHostByName( nil )^.h_addr_list^ )^ ));
end;

procedure Tfrm_conexao.bt_ipClick(Sender: TObject);
begin
    ed_meuip.Text:= GetIpMachine;
    ed_banco.Text:= ExtractFilePath(Application.ExeName)+ 'DADOS.FDB';
    ed_ipservidor.Text := ed_meuip.Text;
    bt_ip.Enabled:=false;
    bt_ip_servidor.Enabled:=true;
end;

procedure Tfrm_conexao.Bt_ip_servidorClick(Sender: TObject);
begin
    config :=TIniFile.Create(ExtractFilePath(Application.ExeName)+ 'Conexao.ini');
    config.WriteString('FB','ipservidor',ed_ipservidor.Text);
    config.WriteString('FB','caminho', ed_banco.Text);
end;

procedure Tfrm_conexao.bt_sairClick(Sender: TObject);
begin
     MessageDlg('Ao sair, abra novamente.',mtInformation,[mbOK],0);
     Application.Terminate;
     dm.conexao.LoginPrompt:=False;
     dm.conexao.Connected:=false;
end;

end.
