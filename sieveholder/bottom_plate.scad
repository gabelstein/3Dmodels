
$fn = 100;

edge_length = 10;
height = 2;
wall_thickness = 1.5;

tongue_width = 0.4;
tongue_height = 0.3;

screw_radius = 0.4; //M4
screw_head_radius = 0.8;
screw_head_height = 0.7;
nut_width = 0.7;
nut_height = 0.5;
inner_length = edge_length-wall_thickness;



//base quadrant
difference()
{
    translate([-edge_length/2,-edge_length/2,0])cube([edge_length,edge_length,height]);
    translate([-inner_length/2,-inner_length/2,0.5])cube([inner_length,inner_length,height]);
};



//tongue
tongue_outer_width = edge_length - wall_thickness/2 + tongue_width/2;
tongue_inner_width = tongue_outer_width - tongue_width;
difference()
{
    translate([-tongue_outer_width/2,-tongue_outer_width/2, height])cube([tongue_outer_width,tongue_outer_width,tongue_height]);
    translate([-tongue_inner_width/2,-tongue_inner_width/2,height])cube([tongue_inner_width,tongue_inner_width,tongue_height]);

};
//across modules screw holders


difference()
    {
        translate([0,-(edge_length+screw_head_radius)/2, 0])cylinder(height,screw_radius*2,screw_radius*2);
        translate([0,-(edge_length+screw_head_radius)/2, 0])cylinder(height, screw_radius, screw_radius);
    }
    
difference()
    {
        translate([0,(edge_length+screw_head_radius)/2, 0])cylinder(height,screw_radius*2,screw_radius*2);
        translate([0,(edge_length+screw_head_radius)/2, 0])cylinder(height, screw_radius, screw_radius);
    }