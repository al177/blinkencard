WALL_TH=0.8;
TOP_TH=1.0; // current
//TOP_TH=0.6; // old case
W=7.6;
L=10.7;
D=4; // new style

NOTCH_W=WALL_TH * 2;
NOTCH_L=WALL_TH * 2;
NOTCH_POS=[ [(W - NOTCH_W) / 2, -0.01, -0.01],
            [(W  - NOTCH_W) / 2, L - NOTCH_L + 0.01, -0.01]];
difference() {
    cube([W, L, D]);
    translate([WALL_TH, WALL_TH, TOP_TH + 0.01]) cube([W - (WALL_TH * 2), L - (WALL_TH * 2), D-TOP_TH]);
    for(pos=NOTCH_POS) {
        translate(pos) cube([NOTCH_W, NOTCH_L + 0.01, D - WALL_TH]);
    }
}

