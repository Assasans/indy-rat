object Form1: TForm1
  Left = 203
  Top = 141
  Width = 288
  Height = 153
  Caption = 'IndyRAT'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Visible = True
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Memo1: TMemo
    Left = 80
    Top = 8
    Width = 185
    Height = 97
    TabOrder = 0
  end
  object Button1: TButton
    Left = 8
    Top = 88
    Width = 65
    Height = 25
    Caption = 'Button1'
    TabOrder = 1
    OnClick = Button1Click
  end
  object IdHTTP1: TIdHTTP
    MaxLineAction = maException
    ReadTimeout = 0
    AllowCookies = True
    ProxyParams.BasicAuthentication = False
    ProxyParams.ProxyPort = 0
    Request.ContentLength = -1
    Request.ContentRangeEnd = 0
    Request.ContentRangeStart = 0
    Request.ContentType = 'text/html'
    Request.Accept = 'text/html, */*'
    Request.BasicAuthentication = False
    Request.UserAgent = 'Mozilla/3.0 (compatible; Indy Library)'
    HTTPOptions = [hoForceEncodeParams]
    Left = 8
    Top = 8
  end
  object TimerExecute: TTimer
    Interval = 10000
    OnTimer = TimerExecuteTimer
    Left = 8
    Top = 48
  end
  object TimerDownload: TTimer
    Interval = 10000
    OnTimer = TimerDownloadTimer
    Left = 8
    Top = 80
  end
  object TimerReconnect: TTimer
    Enabled = False
    Interval = 60000
    OnTimer = TimerReconnectTimer
    Left = 40
    Top = 48
  end
  object IdAntiFreeze1: TIdAntiFreeze
    Left = 40
    Top = 8
  end
  object TimerService: TTimer
    Interval = 10000
    OnTimer = TimerServiceTimer
    Left = 40
    Top = 80
  end
  object IdIcmpClient1: TIdIcmpClient
    Port = 80
    ReceiveTimeout = 1000
    OnReply = IdIcmpClient1Reply
    Left = 240
    Top = 8
  end
end
