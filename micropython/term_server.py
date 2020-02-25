
from machine import UART
import sys
import select
import socket
import iceboot
import gc

def go():
    """
    Stupid telnet to serial terminal for Blinkencard
    """

    uart=UART(2, rx=16, tx=17, timeout=1)
    uart.init(9600)
    s = socket.socket()
    s.bind(socket.getaddrinfo('0.0.0.0', 5000)[0][-1])
    s.listen(1)
    s.setsockopt(socket.SOL_SOCKET, socket.SO_REUSEADDR, 1)
    running = True
    while running:
        print('Waiting for conection')
        cl, addr = s.accept()
        print('Connected to ' + str(addr))
        connected = True
        cmd_mode = False
        
        cl.setblocking(True)
        p = select.poll()
        p.register(cl, select.POLLIN)

        # Tell telnet client to not echo and not wait for newline to send
        # IAC DO LINEMODE
        cl.write(b'\xFF\xFD\x22')
        # IAC SB LINEMODE MODE 0
        cl.write(b'\xFF\xFA\x22\x01\x00')
        # IAC SE
        cl.write(b'\xFF\xF0')
        # IAC WILL ECHO
        cl.write(b'\xFF\xFB\x01')

        # flush out response for echo
        cl.settimeout(100)
        cl.recv(100)

        while connected:
            if uart.any():
                recv_char=uart.read(100)
                cl.write(recv_char)
                
            events = p.poll(10)

            if events:
                for event_s, event in events:
                    
                    if event & select.POLLIN:
                        # receive and filter
                        to_send = b''
                        control_chars = 0
                        recvd = event_s.recv(100)
                        # usocket doesn't do POLLERR or POLLHUP, it just returns empty on recv
                        if not len(recvd):
                            print('Disconnected')
                            p.unregister(event_s)
                            event_s.close()
                            connected = False
                            break
                        for test_char in recvd:
                            if control_chars:
                                control_chars -= control_chars
                                continue
                            if test_char == 0xFF:
                                control_chars = 2
                                continue
                            if test_char == 0x00:
                                continue
                            if not cmd_mode and test_char == 0x01: # ctrl-a
                                cmd_mode = True
                                
                                continue
                            if cmd_mode:
                                cmd_mode = False
                                # Quit on 'k'
                                if (test_char == 0x6B or test_char == 0x4B):
                                    p.unregister(event_s)
                                    event_s.close()
                                    connected = False
                                    running = False
                                    break 
                                if (test_char == 0x72 or test_char == 0x52):
                                    cl.write(b'Reloading config')
                                    iceboot.boot('altair.bin')
                                    continue
                                    
                            to_send += bytes([test_char])
                        uart.write(to_send)
    s.close()
    gc.collect()
