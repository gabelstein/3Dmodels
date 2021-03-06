include <params.scad>;
include <modules.scad>;
height = 2;

difference()
{
    union(){
        base_quadrant(edge_length, wall_thickness, height, 0);
        tongue(tongue_width, tongue_height, edge_length, wall_thickness);
        intermodule_screw(edge_length,height,screw_radius);
        module_screw(edge_length, height, screw_radius, head_width);
    }
    intermodule_screw_hole(edge_length,height,screw_radius);
    module_screw_hole(edge_length, height, screw_radius, 1, head_width, height/2, 100);
}
