program SCA;

uses
  Vcl.Forms,
  U_Principal in '..\Forms\U_Principal.pas' {frm_Principal},
  U_Padrao in '..\Forms\U_Padrao.pas' {frmPadrao},
  U_DM in '..\Forms\U_DM.pas' {Dm: TDataModule},
  U_Usuarios in '..\Forms\U_Usuarios.pas' {frmUsuarios},
  U_carros in '..\Forms\U_carros.pas' {frmCarros},
  U_Pecas in '..\Forms\U_Pecas.pas' {frmPecas},
  U_Consulta_Carros in '..\Forms\U_Consulta_Carros.pas' {frmConsulta_carros},
  u_Pesq_carros in '..\Forms\u_Pesq_carros.pas' {frm_Pesq_Carros},
  u_Vendas in '..\Forms\u_Vendas.pas' {frm_vendas},
  u_pesq_pecas in '..\Forms\u_pesq_pecas.pas' {frm_pesq_pecas},
  u_Pesq_vendas in '..\Forms\u_Pesq_vendas.pas' {frm_Pesq_Vendas},
  u_backup in '..\Forms\u_backup.pas' {frm_backup},
  u_login in '..\Forms\u_login.pas' {frm_login},
  u_conexao in '..\Forms\u_conexao.pas' {frm_conexao};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(Tfrm_login, frm_login);
  Application.CreateForm(TDm, Dm);
  Application.Run;
end.
