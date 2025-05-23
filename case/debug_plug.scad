WALL_TH=0.8;
TOP_TH=0.4;
W=7.6;
H=10.7;
D=4;
difference() {
    cube([W, H, D]);
    translate([WALL_TH, WALL_TH, TOP_TH + 0.01]) cube([W - (WALL_TH * 2), H - (WALL_TH * 2), D-TOP_TH]);
}
    