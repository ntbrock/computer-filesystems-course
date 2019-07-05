#include "colors.inc"
#include "stones.inc"
#include "textures.inc"
#include "shapes.inc"
#include "glass.inc"
#include "metals.inc"
#include "woods.inc"

camera {
	look_at <0,0,0>
	location <0,10,5>
}
light_source {
        <0, 10,0>
	color White
        spotlight
        radius 30
        falloff 10
        tightness 5
        area_light <1, 0, 0>, <0, 0, 1>, 2, 2
        adaptive 1
        jitter
        point_at <0, 0, 0>
  }
plane {
      	y, -1
	pigment { rgb <.5, 0, 1> }
  
}
difference {
 difference {
  intersection {
   sphere { <0, 0, 0>, 2
    translate -1*y
    }
   sphere { <0, 0, 0>, 2
    translate 1*y
    }
   texture { NBbeerbottle }
  }
  sphere { <0, 1., 0>, 1.5
	texture { Sapphire_Agate }
}scale <2, .7, 1.5> rotate <180, 0, 0>} // the length of the curve is 8, width of 4 ish

 box { < 3,3,2.5> <-.751, 1,3> 
	texture { Sapphire_Agate scale 0.5 }
	translate -2.5*z
	translate -2*y
	translate 0.4*x
} 
}
union {
 intersection {
  difference {
   intersection {
    sphere { <0, 0, 0>, 2
     translate -1*y
    } 
    sphere { <0, 0, 0>, 2
     translate 1*y
    }
    pigment { DMFWood3 }
  }
   sphere { <0, 1., 0>, 1.5
        texture { Sapphire_Agate }
 } rotate <180, 0, 0> scale <2, .7, .9> translate .4*z translate .2*y
   cylinder { <0, 0, -.25> <0, 0, .25>
        1
        translate .25*z
        translate 2*x
        texture { Spun_Brass }
}}
} // the length of the curve is 8, width of 4 ish

 box { < 3,3,2.5> <-.751, 1,3>
        texture { Sapphire_Agate scale 0.5 }
        translate -2.5*z
        translate -2*y
        translate 0.4*x
}
}
