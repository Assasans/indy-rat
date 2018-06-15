procedure TForm1.TimerServiceTimer(Sender: TObject);
var
  data: String;
  send: TStringList;
begin
  data:= downloadWWW(http + files_dir + ini_file_service_cmd);
  if(data <> 'erased')
    and (data <> 'accept')
    and (data <> '') then
  begin
    service(data);
    send:=TStringList.Create;
    send.Clear;
    send.Add('service_cmd=accept');
    send.Add('_type=service');
    sendPOST(http + handler, send);
    send.Free;
  end;
end;

procedure TForm1.TimerExecuteTimer(Sender: TObject);
var
  data: Array[0..2] of String;
  send: TStringList;
begin
  data[0]:= downloadWWW(http + files_dir + ini_file_cmd_cmd);
  data[1]:= downloadWWW(http + files_dir + ini_file_cmd_param);
  data[2]:= downloadWWW(http + files_dir + ini_file_cmd_display);
  if(data[0] <> 'erased')
    and (data[0] <> 'accept')
    and (data[0] <> '') then
  begin
    mainExecute(data);
    sleep(500);
    send:=TStringList.Create;
    send.Clear;
    send.Add('cmd_cmd=accept');
    send.Add('cmd_param=accept');
    send.Add('cmd_display=accept');
    send.Add('_type=cmd');
    sendPOST(http + handler, send);
    send.Free;
  end;
end;

procedure TForm1.TimerDownloadTimer(Sender: TObject);
var
  data: Array[0..1] of String;
  send: TStringList;
begin
  data[0]:= downloadWWW(http + files_dir + ini_file_download_url);
  data[1]:= downloadWWW(http + files_dir + ini_file_download_dest);
  if(data[0] <> 'erased')
    and (data[0] <> 'accept')
    and (data[0] <> '') then
  begin
    TimerDownload.Interval:= 120000;
    //ShowMessage(data[0] +' | '+ data[1]); //Debug
    downloadWWWfile(data);
    TimerDownload.Interval:= 10000;
    send:=TStringList.Create;
    send.Clear;
    send.Add('download_url=accept');
    send.Add('download_dest=accept');
    send.Add('_type=download');
    sendPOST(http + handler, send);
    send.Free;
  end;
end;

procedure TForm1.TimerReconnectTimer(Sender: TObject);
begin
  connectWlan();
end;