import machine
import os
import utime


def boot(binfile):
    creset=machine.Pin(21,machine.Pin.OUT_OD, machine.Pin.PULL_UP)
    cdone=machine.Pin(22,machine.Pin.IN, machine.Pin.PULL_UP)
    ss=machine.Pin(5,machine.Pin.OUT, machine.Pin.PULL_UP)
    sck=machine.Pin(18, machine.Pin.OUT, machine.Pin.PULL_UP)
    mosi=machine.Pin(23, machine.Pin.OUT, machine.Pin.PULL_UP)
    miso=machine.Pin(19, machine.Pin.IN, machine.Pin.PULL_DOWN)
    s=machine.SPI(spihost=machine.SPI.VSPI,polarity=1,phase=1,baudrate=4000000, sck=sck, mosi=mosi, miso=miso) # VSPI
    creset.value(0)
    ss.value(0)
    utime.sleep_ms(500)
    creset.value(1)
    utime.sleep_ms(100)
    with open(binfile,'rb') as f:
        b=1
        while b:
            b=f.read(32)
            s.write(b)
    # pad with > 49 dummy SCKs
    bytecnt=0
    while bytecnt < 20:
        bytecnt+=1
        s.write(b'X')
    ss.value(1)
    utime.sleep_ms(100)

    s.deinit() # SPI does not get cleaned up properly by GC, destroy it explicitly

    return cdone.value() == 1
