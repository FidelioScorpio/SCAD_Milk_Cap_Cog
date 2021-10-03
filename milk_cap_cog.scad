//color("lightblue") translate([47,10,0]) import("milk_opener.stl");
//cylinder(d=64, h=20, $fn = 90);


module milkCap()
{
    difference()
    {
        color("lightblue") translate([47,10,0]) import("milk_opener.stl");
        difference()
        {
            translate([-40, -40, -1]) cube([200, 100, 20]);
            cylinder(d=60, h=20, $fn = 90);
        }
    }
    // Hex bit
    difference()
    {
        roundedCornerPolygon(34, 10, 5, 6);
        translate([0,0,-1]) cylinder(d=60, h=20, $fn = 90);
    }
}




module roundedCornerPolygon(radius, height, roundedness, edges)
{
    new_r = radius - roundedness;
    hull()
    {
        for(i = [0 : edges])
        {
            let (theta = i * 360 / edges)
            {
                translate([new_r * sin(theta), new_r * cos(theta), 0]) cylinder(r = roundedness, h = height, $fn=90);
            }
        }
    }
}

milkCap();
difference()
{
    roundedCornerPolygon(33, 0.8, 5, 6);
    translate([0,0,-2]) cylinder(d=35, h=20, $fn = 90);
}

