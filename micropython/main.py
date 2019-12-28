import network
import utime
wlan=network.WLAN()
wlan.active(True)
wlan.connect('YOUR_SSID_HERE','YOUR_PW_HERE')
timeout=100
while (timeout > 0) and not wlan.isconnected():
    utime.sleep_ms(100)
    timeout = timeout - 1
    print('.')
print(wlan.ifconfig())
network.telnet.start()
utime.sleep_ms(500)
print('telnet started', network.telnet.status())
network.ftp.start()
utime.sleep_ms(500)
print('ftp started', network.ftp.status())
