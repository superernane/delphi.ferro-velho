unit U_Principal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Buttons, Vcl.ExtCtrls, Vcl.ComCtrls,
  Vcl.Menus, Vcl.Imaging.pngimage, Vcl.StdCtrls, frxClass, frxDBSet;

type
  Tfrm_Principal = class(TForm)
    Panel1: TPanel;
    StatusBar2: TStatusBar;
    Timer1: TTimer;
    SpeedButton6: TSpeedButton;
    SpeedButton8: TSpeedButton;
    SpeedButton9: TSpeedButton;
    SpeedButton10: TSpeedButton;
    MainMenu1: TMainMenu;
    Cadatro1: TMenuItem;
    Carros1: TMenuItem;
    Usurio1: TMenuItem;
    N1: TMenuItem;
    Sair1: TMenuItem;
    Relatrios1: TMenuItem;
    Carros2: TMenuItem;
    Vendas1: TMenuItem;
    SpeedButton1: TSpeedButton;
    procedure Timer1Timer(Sender: TObject);
    procedure SpeedButton5Click(Sender: TObject);
    procedure Abre_Tela_Usuario();
    procedure SpeedButton1Click(Sender: TObject);
    procedure Abre_Tela_Carros();
    procedure SpeedButton2Click(Sender: TObject);
    procedure Abre_Tela_Pecas();
    procedure SpeedButton3Click(Sender: TObject);
    procedure SpeedButton10Click(Sender: TObject);
    procedure SpeedButton6Click(Sender: TObject);
    procedure SpeedButton7Click(Sender: TObject);
    procedure Abre_pesquisa();
    procedure SpeedButton8Click(Sender: TObject);
    procedure abre_vendas();
    procedure SpeedButton9Click(Sender: TObject);
    procedure Vendas1Click(Sender: TObject);
    procedure Carros2Click(Sender: TObject);
    procedure Sair1Click(Sender: TObject);
    procedure Carros1Click(Sender: TObject);
    procedure Usurio1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frm_Principal: Tfrm_Principal;

implementation

{$R *.dfm}

uses U_Usuarios, U_carros, U_Pecas, U_Consulta_Carros, u_Vendas, u_Pesq_vendas,
  u_Pesq_carros, u_pesq_pecas, u_backup;

procedure Tfrm_Principal.Abre_pesquisa;
begin
      frmConsulta_carros:=tfrmConsulta_carros.Create(self);
      frmConsulta_carros.ShowModal;

      try

      finally
        frmConsulta_carros.Free;
        frmConsulta_carros:=nil;
      end;

end;

procedure Tfrm_Principal.Abre_Tela_Carros;
begin
    frmCarros:=TfrmCarros.Create(self);
    frmCarros.ShowModal;

    try

    finally
      frmCarros.Free;
      frmCarros:=nil;
    end;
end;

procedure Tfrm_Principal.Abre_Tela_Pecas;
var
  MyClass: TComponent;
begin
     frmPecas:=TfrmPecas.Create(self);
     frmPecas.ShowModal;
     MyClass := TComponent.Create(Self);
     try
       
     finally
       frmPecas.Free;
       frmPecas:=nil;
     end;
end;

procedure Tfrm_Principal.Abre_Tela_Usuario;
begin
     frmUsuarios:=TfrmUsuarios.Create(Self);
     frmUsuarios.ShowModal;

     try

     finally
      frmUsuarios.Free;
      frmUsuarios:=nil;
     end;
end;

procedure Tfrm_Principal.abre_vendas;
begin
     frm_vendas:=Tfrm_vendas.Create(self);
     frm_vendas.ShowModal;

     try

     finally
      frm_vendas.Free;
      frm_vendas:=nil;
     end;
end;

procedure Tfrm_Principal.Carros1Click(Sender: TObject);
begin
     Abre_Tela_Carros;
end;

procedure Tfrm_Principal.Carros2Click(Sender: TObject);
begin
   Abre_pesquisa;
end;

procedure Tfrm_Principal.Sair1Click(Sender: TObject);
begin
      if MessageDlg('Deseja sai do sistema?',mtConfirmation,[mbYes,mbCancel],0)=mrYes then
     begin
       Application.Terminate;
     end;
end;

procedure Tfrm_Principal.SpeedButton10Click(Sender: TObject);
begin
     if MessageDlg('Deseja sai do sistema?',mtConfirmation,[mbYes,mbCancel],0)=mrYes then
     begin
       Application.Terminate;
     end;
end;

procedure Tfrm_Principal.SpeedButton1Click(Sender: TObject);
begin
    frm_backup:=Tfrm_backup.Create(self);
    frm_backup.ShowModal;
end;

procedure Tfrm_Principal.SpeedButton2Click(Sender: TObject);
begin
    Abre_Tela_Carros;
end;

procedure Tfrm_Principal.SpeedButton3Click(Sender: TObject);
begin
   Abre_Tela_Pecas;
end;

procedure Tfrm_Principal.SpeedButton5Click(Sender: TObject);
begin
   Application.Terminate;

end;

procedure Tfrm_Principal.SpeedButton6Click(Sender: TObject);
begin
   Abre_Tela_Carros;
end;

procedure Tfrm_Principal.SpeedButton7Click(Sender: TObject);
begin
  frm_Pesq_Vendas:=Tfrm_Pesq_Vendas.Create(self);
  frm_Pesq_Vendas.ShowModal;
end;

procedure Tfrm_Principal.SpeedButton8Click(Sender: TObject);
begin
    Abre_pesquisa;
end;

procedure Tfrm_Principal.SpeedButton9Click(Sender: TObject);
begin
     abre_vendas;
end;

procedure Tfrm_Principal.Timer1Timer(Sender: TObject);
begin
     StatusBar2.Panels[0].Text := 'Data.: ' + DateToStr(now);
     StatusBar2.Panels[1].Text := 'Horas.: ' + TimeToStr(now);
     StatusBar2.Panels[2].Text := 'Sejam Bem Vindos ao Sitema';
end;

procedure Tfrm_Principal.Usurio1Click(Sender: TObject);
begin
  Abre_Tela_Usuario;
end;

procedure Tfrm_Principal.Vendas1Click(Sender: TObject);
begin
     frm_Pesq_Vendas:=Tfrm_Pesq_Vendas.Create(self);
     frm_Pesq_Vendas.ShowModal;
end;

end.
