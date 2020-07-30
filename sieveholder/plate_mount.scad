include <params.scad>;
include <modules.scad>;
height = 1;

difference()
{
    union(){
        base_quadrant(edge_length, wall_thickness, height, 0.5);
        intermodule_screw(edge_length,height,screw_radius+0.02);
        tongue(tongue_width, tongue_height, edge_length, wall_thickness);
        
    }
    intermodule_screw_hole(edge_length,height,screw_radius);
    bottom_screw_holes();
    intermodule_nut_hole(edge_length,height,screw_radius,nut_width, nut_height, fn=6);
}

    
 //bottom screw holes
 module bottom_screw_holes()
 {
     translate([bottom_screw_distance/2, 0, 0])cylinder(height, r=screw_radius);    
     translate([-bottom_screw_distance/2, 0, 0])cylinder(height, r=screw_radius);    
     
 }
