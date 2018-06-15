function GetPIDByHWnd(const hWnd: THandle): THandle;
var
   PID: DWORD;
begin
   if hWnd <> 0 then
   begin
      GetWindowThreadProcessID(hWnd, @PID);
      Result := PID;
   end
   else
      Result := 0;
end;

function GetPIDByProgramName(const APName: string): THandle;
var
   isFound: boolean;
   AHandle, AhProcess: THandle;
   ProcessEntry32: TProcessEntry32;
   APath: array[0..MAX_PATH] of char;
begin
   Result := 0;
   AHandle := CreateToolhelp32Snapshot(TH32CS_SNAPPROCESS, 0);
   try
      ProcessEntry32.dwSize := Sizeof(ProcessEntry32);
      isFound := Process32First(AHandle, ProcessEntry32);
      while isFound do
      begin
         AhProcess := OpenProcess(PROCESS_QUERY_INFORMATION or PROCESS_VM_READ,
            false, ProcessEntry32.th32ProcessID);
         GetModuleFileNameEx(AhProcess, 0, @APath[0], sizeof(APath));
         if (UpperCase(StrPas(APath)) = UpperCase(APName)) or
            (UpperCase(StrPas(ProcessEntry32.szExeFile)) = UpperCase(APName)) then
         begin
            Result := ProcessEntry32.th32ProcessID;
            break;
         end;
         isFound := Process32Next(AHandle, ProcessEntry32);
         CloseHandle(AhProcess);
      end;
   finally
      CloseHandle(AHandle);
   end;
end;

function GetHWND(h_hwnd : hwnd; param: LPARAM) : BOOL; stdcall;
var
  captionNow: String;
  captionNowRAW: PAnsiChar;
begin
  if(h_hwnd <> Form1.Handle) then
    if(IsWindowVisible(h_hwnd)) then begin
      GetWindowText(h_hwnd, captionNowRAW, 255);
      captionNow:= String(captionNowRAW);
      //ShowMessage('PID:'+ IntToStr(GetPIDByHWnd(h_hwnd)) + #13#10 +'Title: '+ captionNow);
      if(GetPIDByHWnd(h_hwnd) = h_pid) then begin
        //ShowMessage(IntToStr(h_pid));
        ShowWindow(h_hwnd, SW_HIDE);
      end;
    end;
  Result:= true;
end;