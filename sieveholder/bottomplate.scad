$fn = 1000;

length = 10.5;
height = 2;


//base quadrant
difference()
{
    translate([-length/2,-length/2,height/2])cube([length,length,height]);
}
