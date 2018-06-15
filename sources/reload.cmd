@Echo off
taskkill /f /im system16.exe
ping 127.0.0.1 -n 6 > NUL
start system16.exe
@Exit