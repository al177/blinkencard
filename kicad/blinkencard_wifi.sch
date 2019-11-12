EESchema Schematic File Version 4
LIBS:blinkencard-cache
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 4 4
Title ""
Date ""
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L RF_Module:ESP32-WROOM-32D U2
U 1 1 5DF1D398
P 3650 3000
F 0 "U2" H 3650 4581 50  0000 C CNN
F 1 "ESP32-WROOM-32D" H 3650 4490 50  0000 C CNN
F 2 "RF_Module:ESP32-WROOM-32" H 3650 1500 50  0001 C CNN
F 3 "https://www.espressif.com/sites/default/files/documentation/esp32-wroom-32d_esp32-wroom-32u_datasheet_en.pdf" H 3350 3050 50  0001 C CNN
	1    3650 3000
	1    0    0    -1  
$EndComp
Text GLabel 4350 3000 2    50   Output ~ 0
FPGA_SCK
Text GLabel 4350 3100 2    50   Output ~ 0
FPGA_SI
Text GLabel 4350 3400 2    50   Input ~ 0
FPGA_SO
Text GLabel 4350 2300 2    50   Output ~ 0
FPGA_SS
Text GLabel 4350 3300 2    50   Input ~ 0
FPGA_INT
Wire Wire Line
	4350 2300 4250 2300
Wire Wire Line
	4350 3000 4250 3000
Wire Wire Line
	4350 3100 4250 3100
Wire Wire Line
	4350 3400 4250 3400
Wire Wire Line
	4350 3300 4250 3300
Text GLabel 4350 2800 2    50   Input ~ 0
FPGA_TXO
Text GLabel 4350 2900 2    50   Output ~ 0
FPGA_RXI
Wire Wire Line
	4350 2800 4250 2800
Wire Wire Line
	4350 2900 4250 2900
NoConn ~ 3050 3000
NoConn ~ 3050 3100
NoConn ~ 3050 3200
NoConn ~ 3050 3300
NoConn ~ 3050 3400
NoConn ~ 3050 3500
NoConn ~ 3050 2000
NoConn ~ 3050 2100
$EndSCHEMATC
