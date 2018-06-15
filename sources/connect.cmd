@Echo off
netsh wlan add profile filename="profiles\iRAT-WIFI.xml"
netsh wlan connect name=iRAT-WIFI ssid=iRAT-WIFI
@Exit