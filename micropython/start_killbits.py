from machine import UART
import iceboot
import utime
def do():
    killbits = ["M0 ", "041", "000", "000", "026", "200", "001", "016", "000",
                "032", "032", "032", "032", "011", "322", "010", "000",
                "333", "377", "172", "017", "127", "303", "010", "000", "X",
                "J0 "]
    uart=UART(2, tx=17, rx=16, timeout=10)
    uart.init(9600)
    if uart.any():
        uart.read() # flush
    print('Loading bitstream')
    iceboot.boot('altair.bin')
    print('Done')
    print(uart)
    for oword in killbits:
        uart.write(oword)
        utime.sleep_ms(100)
        while uart.any():
            print(uart.readline())


