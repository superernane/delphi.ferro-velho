unit u_backup;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls,
  Vcl.Imaging.pngimage, Vcl.ComCtrls,Vcl.FileCtrl;

type
  Tfrm_backup = class(TForm)
    pc_backup: TPageControl;
    p_bakup: TTabSheet;
    Image1: TImage;
    Panel1: TPanel;
    SpeedButton3: TSpeedButton;
    SpeedButton4: TSpeedButton;
    Panel2: TPanel;
    Label1: TLabel;
    SpeedButton1: TSpeedButton;
    ed_nome: TEdit;
    Panel3: TPanel;
    restaure: TTabSheet;
    Image2: TImage;
    Panel4: TPanel;
    Panel5: TPanel;
    Label2: TLabel;
    SpeedButton2: TSpeedButton;
    ed_rNome: TEdit;
    Panel6: TPanel;
    SpeedButton5: TSpeedButton;
    SpeedButton6: TSpeedButton;
    OpenDialog1: TOpenDialog;
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton6Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure SpeedButton5Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frm_backup: Tfrm_backup;

implementation

{$R *.dfm}

uses U_DM;

procedure Tfrm_backup.FormShow(Sender: TObject);
begin
    pc_backup.TabIndex := 0;
end;

procedure Tfrm_backup.SpeedButton1Click(Sender: TObject);
var
   S : String;
begin
    SelectDirectory('Selecione a pasta.','',S);
    ed_nome.Text := s + '\cap.fdb';
end;

procedure Tfrm_backup.SpeedButton2Click(Sender: TObject);
begin
       if OpenDialog1.Execute = True then
       ed_rNome.Text := ExtractFilePath(OpenDialog1.FileName)+
       ExtractFileName(OpenDialog1.FileName);
end;

procedure Tfrm_backup.SpeedButton3Click(Sender: TObject);
begin
   close;
end;

procedure Tfrm_backup.SpeedButton4Click(Sender: TObject);
var
   Destino, Origem : string;
begin
     DM.conexao.Connected := false;
     if pc_backup.TabIndex = 0 then
     begin
       if ed_nome.Text = '' then
         begin
           ShowMessage('Escolha o destino do arquivo.');
           exit;
         end;
         if FileExists(ed_nome.Text) then
         begin
           if Application.MessageBox('Ja existe uma copia nesse local.'+#13+ 'Deseja substituir?','Confirmação.', MB_YESNO + MB_ICONQUESTION)= ID_NO then
           Abort

         end;
         DeleteFile(ed_nome.Text);

         Origem  := 'C:\CAP\Dados\CAP.FDB';
         Destino := ed_nome.Text;

         if not CopyFile(Pchar(Origem), Pchar(Destino), true) then
            begin
              ShowMessage('Ocorreu um erro no processo de backup.');

            end
            else
               ShowMessage('Backup realizado com sucesso.');
               DM.conexao.Connected := true;

     end;
end;

procedure Tfrm_backup.SpeedButton5Click(Sender: TObject);
begin
   close;
end;

procedure Tfrm_backup.SpeedButton6Click(Sender: TObject);
var
   Origem, Destino : String;
begin
      dm.conexao.Connected:=false;
      if pc_backup.TabIndex =1 then
      begin
       if ed_rnome.Text = '' then
         begin
           ShowMessage('Escolha o destino do arquivo.');
           exit;
         end;
         if FileExists('C:\CAP\Dados\CAP.FDB') then
         begin
         DeleteFile('C:\CAP\Dados\CAP.FDB');
         end;

         Origem  := ed_rnome.Text ;
         Destino := 'C:\CAP\Dados\CAP.FDB';

         if not CopyFile(Pchar(Origem), Pchar(Destino), true) then
            begin
              ShowMessage('Ocorreu um erro no processo de backup.');

            end
            else
               ShowMessage('Restauração realizado com sucesso.');
               dm.conexao.Connected := true;

      end;
end;

end.

