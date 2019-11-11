EESchema Schematic File Version 4
LIBS:blinkencard-cache
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 4
Title ""
Date ""
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Sheet
S 7650 1550 3350 2700
U 5DBFB872
F0 "frontpanel" 50
F1 "blinkencard_frontpanel.sch" 50
$EndSheet
$Sheet
S 3650 1550 3300 2750
U 5DF07365
F0 "fpga" 50
F1 "blinkencard_fpga.sch" 50
$EndSheet
$Sheet
S 2350 5450 2650 2100
U 5DF1D240
F0 "wifi" 50
F1 "blinkencard_wifi.sch" 50
$EndSheet
$Comp
L Mechanical:MountingHole_Pad H4
U 1 1 5DF7001B
P 8600 5700
F 0 "H4" H 8700 5749 50  0000 L CNN
F 1 "MountingHole_Pad" H 8700 5658 50  0000 L CNN
F 2 "MountingHole:MountingHole_2.2mm_M2_Pad_Via" H 8600 5700 50  0001 C CNN
F 3 "~" H 8600 5700 50  0001 C CNN
	1    8600 5700
	1    0    0    -1  
$EndComp
$Comp
L Mechanical:MountingHole_Pad H3
U 1 1 5DF703E7
P 8400 5700
F 0 "H3" H 8500 5749 50  0000 L CNN
F 1 "MountingHole_Pad" H 8500 5658 50  0000 L CNN
F 2 "MountingHole:MountingHole_2.2mm_M2_Pad_Via" H 8400 5700 50  0001 C CNN
F 3 "~" H 8400 5700 50  0001 C CNN
	1    8400 5700
	1    0    0    -1  
$EndComp
$Comp
L Mechanical:MountingHole_Pad H2
U 1 1 5DF7062A
P 8200 5700
F 0 "H2" H 8300 5749 50  0000 L CNN
F 1 "MountingHole_Pad" H 8300 5658 50  0000 L CNN
F 2 "MountingHole:MountingHole_2.2mm_M2_Pad_Via" H 8200 5700 50  0001 C CNN
F 3 "~" H 8200 5700 50  0001 C CNN
	1    8200 5700
	1    0    0    -1  
$EndComp
$Comp
L Mechanical:MountingHole_Pad H1
U 1 1 5DF70808
P 8000 5700
F 0 "H1" H 8100 5749 50  0000 L CNN
F 1 "MountingHole_Pad" H 8100 5658 50  0000 L CNN
F 2 "MountingHole:MountingHole_2.2mm_M2_Pad_Via" H 8000 5700 50  0001 C CNN
F 3 "~" H 8000 5700 50  0001 C CNN
	1    8000 5700
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0101
U 1 1 5DF70ADF
P 8200 5900
F 0 "#PWR0101" H 8200 5650 50  0001 C CNN
F 1 "GND" H 8205 5727 50  0000 C CNN
F 2 "" H 8200 5900 50  0001 C CNN
F 3 "" H 8200 5900 50  0001 C CNN
	1    8200 5900
	1    0    0    -1  
$EndComp
Wire Wire Line
	8000 5800 8200 5800
Wire Wire Line
	8400 5800 8200 5800
Connection ~ 8200 5800
Wire Wire Line
	8600 5800 8400 5800
Connection ~ 8400 5800
Wire Wire Line
	8200 5800 8200 5900
$EndSCHEMATC
