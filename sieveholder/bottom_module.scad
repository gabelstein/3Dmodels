include <params.scad>;
include <modules.scad>;
height = 1;

difference()
{
    union(){
        base_quadrant(edge_length, wall_thickness, height, 0);
        intermodule_screw(edge_length,height,screw_radius);
        module_screw(edge_length, height, screw_radius, head_width);
    }
    intermodule_screw_hole(edge_length,height,screw_radius);
    module_screw_hole(edge_length, height, screw_radius, nut_height, nut_width, 0, 6);
    groove(tongue_width, tongue_height, edge_length, wall_thickness);
}
