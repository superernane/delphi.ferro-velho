unit U_DM;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf,
  FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys,
  FireDAC.Phys.FB, FireDAC.Phys.FBDef, FireDAC.VCLUI.Wait, FireDAC.Stan.Param,
  FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, Vcl.Grids, Vcl.DBGrids, Vcl.StdCtrls,winsock, System.IniFiles;
type
  TDm = class(TDataModule)
    conexao: TFDConnection;
    T_Trans: TFDTransaction;
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
  public
  caminho : TInifile;
    { Public declarations }
  end;

var
  Dm: TDm;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

uses u_conexao, u_login;

{$R *.dfm}

procedure TDm.DataModuleCreate(Sender: TObject);
var arquivoIni : TInifile;
    caminho, ipservidor: string;
begin
    try
      arquivoIni := TIniFile.Create(ExtractFilePath(Application.ExeName)+'Conexao.ini');
      ipservidor := arquivoIni.ReadString('FB','ipservidor','');
      caminho    := arquivoIni.ReadString('FB','caminho','');
      dm.conexao.Params.Database := ipservidor + ':' + caminho;
      dm.conexao.LoginPrompt := false;
      dm.conexao.Connected:= true;
      frm_login.Q_Acesso.Open;
      //dm_test.fdb_teste.ConnectionName := ipservidor + ':' + caminho;

    Except

    MessageDlg('Conexão flahou: Banco de dados não encontrado.',mtInformation,[mbOK],0);
    frm_conexao:=Tfrm_conexao.Create(Self);
    frm_conexao.ShowModal;
    Exit;
    end;
end;

end.
