//

use <Adapters_Mod/Adapter_External-Bare.scad>;
use <Adapters_Mod/Adapter_Internal-Cap.scad>;


// Define the common variables
corrector = 0.15;
turns = 10;
wall_thickness = 1.2;
entry_chamfer = true;
style = "Circular";

thread_type = "G1/2";

// Upper External Thread Part
// Middle Part
mid_outer_diameter = 20.00;
mid_height = 0;
// Pipe Part
lower_diameter = 12.00;
lower_length = 10;

// Pipe Cap
// Cap Diameter
cap_height = 1.0;


union(){
    Adapter_External_Bare(
        corrector, // corrector
        thread_type, turns, wall_thickness, true, // Upper External Thread Part
        style, 0, mid_height, 0, 0, // Middle Part
        0, 0, 0, lower_mid_outer_chamfer=0 // Lower Part
    );

    translate([0,0,-mid_height/2])
    rotate([0,180,0])
    Adapter_External_Bare(
        corrector, // corrector
        thread_type, turns, wall_thickness, false, // Upper External Thread Part
        style, 0, mid_height, 0, 0, // Middle Part
        0, 0, 0, lower_mid_outer_chamfer=0 // Lower Part
    );
}
/*
translate([0,0,35]) 
rotate([0,180,0])
Adapter_Internal_Cap(
    corrector, wall_thickness, // corrector, min_wall_size
    thread_type, turns, entry_chamfer, style, 0, // Upper Internal Thread Part
    cap_height // Cap Part
);
*/