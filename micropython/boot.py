# This file is executed on every boot (including wake-boot from deepsleep)
#import esp
#esp.osdebug(None)
import webrepl
webrepl.start()
import network
ap=network.WLAN(network.AP_IF)
ap.active(True)
