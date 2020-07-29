
$fn = 100;

edge_length = 10;
height = 1;
wall_thickness = 1.5;

tongue_width = 0.4;
tongue_height = 0.3;

screw_radius = 0.4; //M4
screw_head_radius = 0.8;
screw_head_height = 0.7;
nut_width = 0.8;
nut_height = 0.5;

inner_length = edge_length-wall_thickness;


//base quadrant
difference()
{
    translate([-edge_length/2,-edge_length/2,0])cube([edge_length,edge_length,height]);
    translate([-inner_length/2,-inner_length/2,0])cube([inner_length,inner_length,height]);
    for (a = [[-1,-1], [1,1], [1,-1], [-1,1]])
    {
        x = a[0]*(edge_length+screw_head_radius)/2;
        y = a[1]*(edge_length+screw_head_radius)/2;
    
        translate([x,y, 0])cylinder(nut_height, nut_width, nut_width);
    }
    groove();
};



//groove
tongue_outer_width = edge_length - wall_thickness/2 + tongue_width/2;
tongue_inner_width = tongue_outer_width - tongue_width;
module groove() {
    
    difference()
    {
        translate([-tongue_outer_width/2,-tongue_outer_width/2, 0])cube([tongue_outer_width,tongue_outer_width,tongue_height]);
        translate([-tongue_inner_width/2,-tongue_inner_width/2, 0])cube([tongue_inner_width,tongue_inner_width,tongue_height]);

    };
    
}


//single module screw holders


for (a = [[-1,-1], [1,1], [1,-1], [-1,1]])
{
    x = a[0]*(edge_length+screw_head_radius)/2;
    y = a[1]*(edge_length+screw_head_radius)/2;
    difference()
    {
        translate([x,y, 0])cylinder(height,nut_width*1.5,nut_width*1.5);
        translate([x,y, 0])cylinder(height, screw_radius, screw_radius);
        translate([x,y, 0])cylinder(nut_height, nut_width, nut_width, $fn=6);
        groove();


    }
    
}    

//across modules screw holders

difference()
    {
        translate([0,-(edge_length+screw_head_radius)/2, 0])cylinder(height,screw_radius*2,screw_radius*2);
        translate([0,-(edge_length+screw_head_radius)/2, 0])cylinder(height, screw_radius, screw_radius);
        groove();
    }
    
difference()
    {
        translate([0,(edge_length+screw_head_radius)/2, 0])cylinder(height,screw_radius*2,screw_radius*2);
        translate([0,(edge_length+screw_head_radius)/2, 0])cylinder(height, screw_radius, screw_radius);
        groove();
    }