from machine import UART
import iceboot
import utime
def do():
    uart=UART(2, tx=17, rx=16, timeout=10)
    uart.init(9600)
    if uart.any():
        uart.read() # flush
    print('Loading bitstream')
    iceboot.boot('altair.bin')
    print('Done')
    print(uart)
    uart.write('J000000')
    utime.sleep_ms(1000)
    uart.write('\r\n')
    utime.sleep_ms(500)
    uart.write('\r\n')
    utime.sleep_ms(100)
    uart.write('Y\r\n')
    utime.sleep_ms(100)
    while uart.any():
        print(uart.readline())
    utime.sleep_ms(50)
    uart.write('10 PRINT "HI"\r\n')
    utime.sleep_ms(50)
    uart.write('20 FOR F=1 TO 10\r\n')
    utime.sleep_ms(50)
    uart.write('30 PRINT F\r\n')
    utime.sleep_ms(50)
    uart.write('40 NEXT F\r\n')
    utime.sleep_ms(50)
    uart.write('RUN\r\n')
    utime.sleep_ms(200)
    while uart.any():
        print(uart.readline())
    while True:
        while uart.any():
            print(uart.readline())
        utime.sleep_ms(100) 


