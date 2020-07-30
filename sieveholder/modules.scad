include <params.scad>;

module base_quadrant(edge_length, wall_thickness, height, shift)
{      
    difference()
    {
        translate([-edge_length/2,-edge_length/2,0])cube([edge_length,edge_length,height]);
        translate([-inner_length/2,-inner_length/2,shift])cube([inner_length,inner_length,height]);
    };  
    fill_corners(edge_length,wall_thickness,height);
}


module tongue(tongue_width, tongue_height, edge_length, wall_thickness)
{
    tongue_outer_width = edge_length - wall_thickness + tongue_width;
    tongue_inner_width = tongue_outer_width - tongue_width*2;
  
    difference()
    {
        translate([-tongue_outer_width/2,-tongue_outer_width/2, height])cube([tongue_outer_width,tongue_outer_width,tongue_height]);
        translate([-tongue_inner_width/2,-tongue_inner_width/2,height])cube([tongue_inner_width,tongue_inner_width,tongue_height]);

    };  
    
    
}


module groove(tongue_width, tongue_height, edge_length, wall_thickness) 
{
    tongue_outer_width = edge_length - wall_thickness + tongue_width;
    tongue_inner_width = tongue_outer_width - tongue_width*2;
    difference()
    {
        translate([-tongue_outer_width/2,-tongue_outer_width/2, 0])cube([tongue_outer_width,tongue_outer_width,tongue_height+0.1]);
        translate([-tongue_inner_width/2,-tongue_inner_width/2, 0])cube([tongue_inner_width,tongue_inner_width,tongue_height+0.1]);

    };
    
}

module intermodule_screw(edge_length,height,screw_radius)
{
    for (a=[-1,1])
            translate([0,a*(edge_length+2*screw_radius)/2, 0])cylinder(height,screw_radius*2,screw_radius*2);

    
}
module intermodule_screw_hole(edge_length,height,screw_radius)
{
    for (a=[-1,1])
            translate([0,a*(edge_length+2*screw_radius)/2, 0])cylinder(height, screw_radius, screw_radius);
}

module intermodule_nut_hole(edge_length,height,screw_radius,nut_width, nut_height, fn)
{
    for (a=[-1,1])
            translate([0,a*(edge_length+2*screw_radius)/2, 0])cylinder(nut_height, nut_width, nut_width, $fn=fn);
}




module module_screw(edge_length, height, screw_radius, head_width)
{

    for (a = [[-1,-1], [1,1], [1,-1], [-1,1]])
    {
        x = a[0]*(edge_length+head_width)/2;
        y = a[1]*(edge_length+head_width)/2;
        translate([x,y, 0])cylinder(height,head_width*1.5,head_width*1.5);
    }    
}

module module_screw_hole(edge_length, height, screw_radius, head_height, head_width, offset, fn)
{

    for (a = [[-1,-1], [1,1], [1,-1], [-1,1]])
    {
        x = a[0]*(edge_length+head_width)/2;
        y = a[1]*(edge_length+head_width)/2;

        translate([x,y, 0])cylinder(height, screw_radius, screw_radius);
        translate([x,y, offset])cylinder(head_height, head_width, head_width, $fn=fn);
        
    }    
}

module fill_corners(edge_length,wall_thickness,height)
{
    ar = edge_length/2-wall_thickness-0.1;
    for (rot=[45,135,225,315])
        rotate([0,0,rot])translate([sqrt(ar*ar + ar*ar),0,height/2])cube([wall_thickness,2*wall_thickness,height],center=true);
    
}
