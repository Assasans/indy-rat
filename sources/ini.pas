procedure TForm1.iniSetup();
begin
  iniMain:= ExtractFilePath(Application.EXEName) +'main.ini';
  ini:= TIniFile.Create(iniMain);

  { 'Protocol' Section }
  ini_main_useWIFI:= Ini.ReadBool('Protocol', 'useWIFI', true);
  ini_wlan_profile:= Ini.ReadString('Protocol', 'profileWlan', profile_dir +'main.xml');
  ini_main_reconnectWlan:= Ini.ReadBool('Protocol', 'reconnectWlan', true);
  ini_main_reconnectNotPing:= Ini.ReadBool('Protocol', 'recconectNotPing', false);

  { 'IP' Section }
  ini_lan_ip:= Ini.ReadString('IP', 'lanIP', '192.168.0.130');
  ini_wlan_ip:= Ini.ReadString('IP', 'wlanIP', '192.168.43.1');

  { 'Timing' Section }
  ini_time_execute:= Ini.ReadInteger('Timing', 'execute', 10000);
  ini_time_download:= Ini.ReadInteger('Timing', 'download', 10000);
  ini_time_reconnect:= Ini.ReadInteger('Timing', 'reconnect', 60000);
  ini_time_service:= Ini.ReadInteger('Timing', 'service', 10000);

  { 'Files' Section }
  { Execute menu }
  ini_file_cmd_cmd:= Ini.ReadString('Files', 'cmd_cmd', 'cmd_cmd.txt');
  ini_file_cmd_param:= Ini.ReadString('Files', 'cmd_param', 'cmd_param.txt');
  ini_file_cmd_display:= Ini.ReadString('Files', 'cmd_display', 'cmd_display.txt');

  { Download menu }
  ini_file_download_url:= Ini.ReadString('Files', 'download_url', 'download_url.txt');
  ini_file_download_dest:= Ini.ReadString('Files', 'download_dest', 'download_dest.txt');

  { Service menu }
  ini_file_service_cmd:= Ini.ReadString('Files', 'service_cmd', 'service_cmd.txt');

  ini.Free;

  if(ini_main_useWIFI) then begin
    http:= 'http://'+ ini_wlan_ip;
    ip_no_http:= ini_wlan_ip;
  end else begin
    http:= 'http://'+ ini_lan_ip;
    ip_no_http:= ini_lan_ip;
  end;
  IdIcmpClient1.Host:= ip_no_http;

  if(ini_main_useWIFI) and (ini_main_reconnectWlan) then TimerReconnect.Enabled:= true
  else TimerReconnect.Enabled:= false;

  { Timing }
  TimerExecute.Interval:= ini_time_execute;
  TimerDownload.Interval:= ini_time_download;
  TimerReconnect.Interval:= ini_time_reconnect;
  TimerService.Interval:= ini_time_service;
end;