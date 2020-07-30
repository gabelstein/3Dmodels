module main(){
difference()
{   
    cube([250,130,30]);
    //translate([15,5,5])cube([220,120,25]);
    //top_hole();
    bottom_slits();


}

}


module bottom_slits()
{
    difference()
    {
        translate([5,0,0])cube([240,110,15]);
        translate([9,0,0])cube([230,110,15]);
    }
}

module top_hole()
{
    
    points = [
    [10,5,30],
    [240,5,30],
    [240,125,30],
    [10,125,30],
    [30,5,5],
    [240,5,5],
    [240,125,5],
    [30,125,5]
    ];
    faces=[
    [0,1,2,3],
    [4,5,6,7],
    [0,1,5,4],
    [2,3,7,6],
    [0,3,7,4],
    [1,2,6,5]
    ];
    polyhedron(points,faces,10);
    
    
}

main();