#include "colors.inc"
#include "stones.inc"
#include "textures.inc"
#include "shapes.inc"
#include "glass.inc"
#include "metals.inc"
#include "woods.inc"
#declare Half_Tor = difference {
    torus {
      4, 1
      rotate x*-90

    }
    box { <-5, -5, -1>, <5, 0, 1> }

    }
camera {
	look_at <1,0,0>
	location <10,8,10>
}
#declare quart_tor =difference {
object { Half_Tor
scale <.2,.2,.2>
rotate <90, 90, 0>
translate 3*y}

box { <1.1, 3, .5>, <0, 2,-.5> translate z*.5 translate y*.5}}

sky_sphere {
  pigment {
    gradient y
      color_map {
        [ 0.5  color CornflowerBlue ]
        [ 1.0  color MidnightBlue ]
        }
    scale 2
    translate -1
    }
  emission rgb <0.8,0.8,1>
  }
light_source {
	<0, 10,0 >
	color White}
plane {
      	y, -1
	texture { T_Stone9 scale 0.5 }
  
}
merge{
merge{
 difference {
  difference {
   intersection {
    sphere { <0, 0, 0>, 2
     translate -1*y
    }
    sphere { <0, 0, 0>, 2
     translate 1*y
    
      texture { Rust }
      pigment { Gray05 }
      finish {
       ambient .2
       diffuse .6
       phong .75
       phong_size 25
} }}
   sphere { <0, 1., 0>, 1.5
	   pigment {Black}
} scale <2, .7, 1.3> rotate <180, 0, 0>} // the length of the curve is 8, width of 4 ish


  box { < 3,3,2.5> <-.751, 1,3> 
	pigment {Black }
	translate -2.75*z
	translate -2*y
	translate 0.4*x
} 
}
 intersection {
  difference {
   intersection {
    sphere { <0, 0, 0>, 2
     translate -1*y
    }
    sphere { <0, 0, 0>, 2
     translate 1*y
    }
    pigment {Gray10 }
    finish {
      ambient .2
      diffuse .5
      phong .15
      phong_size 25
  }}
   sphere { <0, 1., 0>, 1.5
        texture { Sapphire_Agate }
} rotate <180, 0, 0> scale <2, .7, .8> translate .8*z translate .1*y } // the length of the curve is 8, width of 4 ish

  box { < 3,3,2.5> <-.751, 1,3>
        texture { Sapphire_Agate scale 0.5 }
        translate -2.77777775*z
        translate -2*y
        translate 0.4*x
}
}
 cylinder { <0, 0, -.25> <0, 0, .25> 
	1
	translate 2*x
	pigment { Gray15 }
	texture { Glass3 }
	finish {
        ambient .2
        diffuse .6
        phong .75
        phong_size 25}}
}
difference {
 difference {
    sphere { <0, 0, 0>, 2
     translate -1*y
    }
    sphere { <0, 0, 0>, 2
     translate 1*y

      texture { Rust }
      pigment { Gray05 }
      finish {
       ambient .2
       diffuse .5
       phong .3
       phong_size 25
} }
   sphere { <0, 1., 0>, 1.5
        texture { Sapphire_Agate }}
} scale <2, .7, 1.3> texture { Rust }
      pigment { Gray05 }
      finish{
       ambient .2
       diffuse .6
       phong .75
       phong_size 25 } }translate 1*y }
union{
cylinder { < -1, 1, 0> <1, 1, 0>
	.2
	pigment {Gray20}
	translate 4*x
	translate -1*y
	 finish {
       ambient .2
       diffuse .3
       phong .5
       phong_size 15

}}
object {quart_tor  translate 4.85*x translate -3.01*y translate .79*z pigment { Gray20}finish{
       ambient .2
       diffuse .3
       phong .5
       phong_size 15 } } }

#declare generic_box = 
       box { <3, 4,1> <2, 3.5, -.5> translate <3.1, -3.8,1.25> }
object {generic_box pigment {Gray10}} 
difference {
object {generic_box scale.85*x scale .8*y  translate <.85, 0, 1> pigment{color P_Chrome5 } finish {F_MetalE ambient .2
       diffuse .3
       phong .5
       phong_size 15}}
object {generic_box scale <.25, .25, .25> translate <4.4, .2, 2.3> pigment{Gray10 } finish {F_MetalE ambient .2
       diffuse .3
       phong .5
       phong_size 15}}
object {generic_box scale <.25, .25, .25> translate <4, .2, 2.3> pigment{Gray10 } finish {F_MetalE ambient .2
       diffuse .3
       phong .5
       phong_size 15}}

}
