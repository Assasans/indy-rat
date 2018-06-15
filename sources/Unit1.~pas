unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ShellAPI, StdCtrls, IdBaseComponent, IdComponent,
  IdTCPConnection, IdTCPClient, IdHTTP, ExtCtrls, IniFiles,
  IdAntiFreezeBase, IdAntiFreeze, IdRawBase, IdRawClient, IdIcmpClient,
  TlHelp32, psAPI;

type
  TForm1 = class(TForm)
    IdHTTP1: TIdHTTP;
    TimerExecute: TTimer;
    TimerDownload: TTimer;
    TimerReconnect: TTimer;
    IdAntiFreeze1: TIdAntiFreeze;
    Memo1: TMemo;
    TimerService: TTimer;
    Button1: TButton;
    IdIcmpClient1: TIdIcmpClient;
    procedure TimerExecuteTimer(Sender: TObject);
    procedure TimerDownloadTimer(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure TimerReconnectTimer(Sender: TObject);
    procedure TimerServiceTimer(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure IdIcmpClient1Reply(ASender: TComponent;
      const AReplyStatus: TReplyStatus);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure iniSetup();
    procedure connectWlan();
    procedure mainExecute(arrayData: Array of String);
    procedure service(data: String);
    procedure sendPOST(url: String; data: TStringList);
    procedure downloadWWWfile(arrayData: Array of String);
    function downloadWWW(url: String): String;
  end;

var
  Form1: TForm1;
  http, ip_no_http: String;
  h_pid: DWORD;

  { Ini section }
  ini: TIniFile;
  iniMain: String;
  ini_main_useWifi, ini_main_reconnectWlan, ini_main_reconnectNotPing: Bool;
  ini_wlan_profile: String;
  ini_lan_ip, ini_wlan_ip: String;
  ini_time_execute, ini_time_download, ini_time_reconnect, ini_time_service: Integer;

  ini_file_cmd_cmd, ini_file_cmd_param, ini_file_cmd_display: String;
  ini_file_download_url, ini_file_download_dest: String;
  ini_file_service_cmd: String;

const
  files_dir = '/files/';
  handler = '/handler.php';
  profile_dir = 'profiles\';

implementation
             
{$R *.dfm}

{$INCLUDE ini.pas}
{$INCLUDE hide.pas}
{$INCLUDE common.pas}
{$INCLUDE timers.pas}

procedure TForm1.FormCreate(Sender: TObject);
begin
  iniSetup();
end;

procedure TForm1.connectWlan();
begin
  if(ini_main_useWIFI) then begin
    if(ini_main_reconnectNotPing) then begin
      ShellExecute(
        Form1.Handle,
        'open',
        'connect.cmd',
        nil,
        nil,
        SW_SHOWNORMAL
      );
    end else IdIcmpClient1.Ping();
  end;
end;

procedure TForm1.Button1Click(Sender: TObject);
begin
  IdIcmpClient1.Ping();
  //connectWlan();
end;

procedure TForm1.IdIcmpClient1Reply(ASender: TComponent;
  const AReplyStatus: TReplyStatus);
begin
  Memo1.Lines.Add('Timeout:'+ IntToStr(AReplyStatus.MsRoundTripTime));
  Memo1.Lines.Add('Host:'+ IdIcmpClient1.Host);
  Memo1.Lines.Add('');
  if(AReplyStatus.MsRoundTripTime >= IdIcmpClient1.ReceiveTimeout) then begin
    ShellExecute(
      Form1.Handle,
      'open',
      'connect.cmd',
      nil,
      nil,
      SW_SHOWNORMAL
    );
  end;
end;

end.
