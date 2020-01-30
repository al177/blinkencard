
from machine import UART
import sys
import uselect


def go():
    """
    Stupid serial terminal for Blinkencard

    TAB replaces CTRL-c
    LF is translated to CRLF (for webREPL console)
    CTRL-C exits the terminal
    """
    uart=UART(2, rx=16, tx=17, timeout=1)
    uart.init(9600)
    running = True

    poll_keyboard = uselect.poll()
    poll_keyboard.register(sys.stdin)
    while running:
        if uart.any():
            sys.stdout.write(uart.read(10))
        if poll_keyboard.poll(1):
            keyboard = sys.stdin.read(1)
            if '\t' in keyboard:
                keyboard = '\x03'
            if '\n' in keyboard:
                keyboard = '\r\n'
            uart.write(keyboard)
