include <params.scad>;
include <modules.scad>;
height = 1;

difference()
{
    union(){
        base_quadrant(edge_length, wall_thickness, height, -0.5);
        intermodule_screw(edge_length,height,screw_radius);
    }
    intermodule_screw_hole(edge_length,height,screw_radius);
    groove(tongue_width, tongue_height, edge_length, wall_thickness);
}
