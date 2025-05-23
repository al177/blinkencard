PERIMETER_THICKNESS = 1.24;
BOTTOM_WALL_THICKNESS = 1.6;
PCB_MARGIN = 0.1; // gap between case and PCB


CAVITY_DEPTH = 8; // depth in case behind the PCB
BEZEL_LIP_DEPTH = 1.4; // height of the bezel over the PCB

PCB_THICKNESS = 1.6;
PCB_WIDTH = 88.88;
PCB_LENGTH = 50.75;

CAVITY_WIDTH = PCB_WIDTH + (PCB_MARGIN * 2);
CAVITY_LENGTH = PCB_LENGTH + (PCB_MARGIN * 2);
BOTTOM_ROUNDING_DIA = 3.2;

CASE_WIDTH = CAVITY_WIDTH + (PERIMETER_THICKNESS * 2);
CASE_LENGTH = CAVITY_LENGTH + (PERIMETER_THICKNESS * 2);
CASE_DEPTH = PCB_THICKNESS + BEZEL_LIP_DEPTH + CAVITY_DEPTH + BOTTOM_WALL_THICKNESS;

STANDOFF_WIDTH = 4;
STANDOFF_LENGTH = 4;

HANDLE_WIDTH = 6;
HANDLE_LENGTH = 6;
HANDLE_HEIGHT = 5;
HANDLE_HOLE_DIA = 2.0;
HANDLE_SPACING = 25;

SWITCH_DIM = [5.0, 5.0, 2.4];
SWITCH_LOC = [CASE_WIDTH - PERIMETER_THICKNESS - (PCB_MARGIN * 2), PERIMETER_THICKNESS + PCB_MARGIN + 13.6, CAVITY_DEPTH + BOTTOM_WALL_THICKNESS - 3.8];

USB_DIM = [8.4, 5.0, 3.6];
USB_LOC = [PERIMETER_THICKNESS + PCB_MARGIN + 40.2, CASE_LENGTH - PERIMETER_THICKNESS - (PCB_MARGIN * 2), CAVITY_DEPTH + BOTTOM_WALL_THICKNESS - 3.1];

LED_DIM = [0.8, 4.0, 0.8];
LED_LOC = [PERIMETER_THICKNESS + PCB_MARGIN + 55.5,
        CASE_LENGTH - PERIMETER_THICKNESS - (PCB_MARGIN * 2), CAVITY_DEPTH + BOTTOM_WALL_THICKNESS - 1.0];

PROBE_DIM = [7.5, 11, 10];
PROBE_LOC = [(CASE_WIDTH - PERIMETER_THICKNESS) + PCB_MARGIN - 8.4,
PERIMETER_THICKNESS , -0.01];

module fil_handle(width, length, height, fillet_dia, hole_dia) {
    fillet_rad = fillet_dia / 2;
    translate([-(width + fillet_dia) / 2, 0, 0]) difference() {
        hull() {
            cube([width + fillet_dia, 0.01, height * 1.5]);
            translate([0, length - height / 2, height / 2]) rotate([0, 90, 0]) cylinder(d=height, h=width + fillet_dia, $fn=64);
        }
        translate([0,fillet_rad,-0.01]) cylinder(r=fillet_rad, h=height + fillet_rad + 0.02, $fn=64);
    
        translate([-0.01, fillet_rad, -0.01]) cube([fillet_rad + 0.02, length, height + fillet_rad + 0.02]);
        translate([width + fillet_dia, fillet_rad,-0.01]) cylinder(r=fillet_rad, h=height + fillet_rad + 0.02, $fn=64);
        translate([width + fillet_rad, fillet_rad, -0.01]) cube([fillet_rad + 0.02, length, height + fillet_rad + 0.02]);
    
    translate([- 0.01, length - height / 2, height / 2]) rotate([0, 90, 0]) cylinder(d=hole_dia, h=width + fillet_dia + 0.02, $fn=64);
    }
}

difference() {
    union() {
        hull() {
        translate([0, 0, BOTTOM_ROUNDING_DIA / 2]) cube([CASE_WIDTH, CASE_LENGTH, CASE_DEPTH -      BOTTOM_ROUNDING_DIA/2]);
            translate([BOTTOM_ROUNDING_DIA/4,      BOTTOM_ROUNDING_DIA/4, 0]) cube([CASE_WIDTH-BOTTOM_ROUNDING_DIA/2, CASE_LENGTH-BOTTOM_ROUNDING_DIA/2, 1]);
        }
 
        //handle 2
        translate([(CASE_WIDTH + HANDLE_SPACING) / 2, CASE_LENGTH - BOTTOM_ROUNDING_DIA / 4, 0]) fil_handle(HANDLE_WIDTH, HANDLE_LENGTH, HANDLE_HEIGHT, HANDLE_HEIGHT * 2, HANDLE_HOLE_DIA);
    
        translate([(CASE_WIDTH - HANDLE_SPACING) / 2, CASE_LENGTH - BOTTOM_ROUNDING_DIA / 4, 0]) fil_handle(HANDLE_WIDTH, HANDLE_LENGTH, HANDLE_HEIGHT, HANDLE_HEIGHT * 2, HANDLE_HOLE_DIA+0.2);
    }
    translate([(CASE_WIDTH - CAVITY_WIDTH) / 2, (CASE_LENGTH - CAVITY_LENGTH) / 2, BOTTOM_WALL_THICKNESS + 0.01])
        union() {
            translate([BOTTOM_ROUNDING_DIA / 2, BOTTOM_ROUNDING_DIA / 2, BOTTOM_ROUNDING_DIA / 2])
            minkowski() {
                cube([CAVITY_WIDTH - BOTTOM_ROUNDING_DIA, CAVITY_LENGTH - BOTTOM_ROUNDING_DIA, 0.01]);
                sphere(d = BOTTOM_ROUNDING_DIA, $fn=32);
            }
            translate([0, 0, (BOTTOM_ROUNDING_DIA / 2) - 0.01])
                cube([CAVITY_WIDTH, CAVITY_LENGTH, CAVITY_DEPTH * 2 + PCB_THICKNESS - BOTTOM_ROUNDING_DIA + 0.01]);
        }
    translate(SWITCH_LOC) cube(SWITCH_DIM);
    translate(USB_LOC) cube(USB_DIM);
    translate(LED_LOC) cube(LED_DIM);
    translate(PROBE_LOC) cube(PROBE_DIM);
}

STANDOFF_LOCATIONS = [
    [PERIMETER_THICKNESS, PERIMETER_THICKNESS, BOTTOM_WALL_THICKNESS],
    [CASE_WIDTH - PERIMETER_THICKNESS - STANDOFF_WIDTH, CASE_LENGTH - PERIMETER_THICKNESS - STANDOFF_LENGTH, BOTTOM_WALL_THICKNESS],
    [CASE_WIDTH - PERIMETER_THICKNESS - STANDOFF_WIDTH - 11.0, PERIMETER_THICKNESS, BOTTOM_WALL_THICKNESS],
    [PERIMETER_THICKNESS, CASE_LENGTH - PERIMETER_THICKNESS - STANDOFF_LENGTH, BOTTOM_WALL_THICKNESS],
    [PERIMETER_THICKNESS + 49.7, PERIMETER_THICKNESS, BOTTOM_WALL_THICKNESS],

];

for(LOC=STANDOFF_LOCATIONS) {
    translate(LOC) cube([STANDOFF_WIDTH, STANDOFF_LENGTH, CAVITY_DEPTH]);
}
//translate([PERIMETER_THICKNESS, PERIMETER_THICKNESS, BOTTOM_WALL_THICKNESS]) cube([30, 14, CAVITY_DEPTH]);
/* For debug...
%translate([PERIMETER_THICKNESS + PCB_MARGIN, PERIMETER_THICKNESS + PCB_MARGIN, BOTTOM_WALL_THICKNESS + CAVITY_DEPTH]) cube([PCB_WIDTH, PCB_LENGTH, PCB_THICKNESS]);
*/