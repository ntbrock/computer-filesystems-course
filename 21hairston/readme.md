This .pov file generates a model computer mouse in .png format using povray


#include "colors.inc"
#include "stones.inc"
#include "textures.inc"
#include "shapes.inc"
#include "glass.inc"
#include "metals.inc"
#include "woods.inc" // these add all the stock povray textures and colors. only colors.inc, textures.inc, shapes.inc and metals.inc are required for this file.
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
#declare quart_tor =difference { //this generates a quarter torus which is used to generate the curved parts of the mouse chord. More can be generated to extend the cord.
object { Half_Tor
scale <.2,.2,.2>
rotate <90, 90, 0>
translate 3*y} 

box { <1.1, 3, .5>, <0, 2,-.5> translate z*.5 translate y*.5}}

sky_sphere { // this generates the blue sky. editing the color_map can change the color of the sky. Beware, the emission rgb can sometimes mess with shadows.
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
light_source { // this is the only light source.
        <0, 10,0 >
        color White}
plane { // this is the plane that the mouse lies on. Its height can be edited by changing the -1 and the texture/color can be changed by replacing the texture {}
        y, -1
        texture { T_Stone9 scale 0.5 }

}
merge{ // This creates the main mouse body
merge{ // this creates top part of the mouse body, eg. mouse buttons, scroll wheel.
 difference {
  difference {
   intersection {
    sphere { <0, 0, 0>, 2
     translate -1*y
    }
    sphere { <0, 0, 0>, 2
     translate 1*y

      texture { Rust }
      pigment { Gray05 }finish {
      ambient .2
      diffuse .5
      phong .15
      phong_size 25
  }}
   sphere { <0, 1., 0>, 1.5
        texture { Sapphire_Agate }
} rotate <180, 0, 0> scale <2, .7, .8> translate .8*z translate .1*y }

  box { < 3,3,2.5> <-.751, 1,3>
        texture { Sapphire_Agate scale 0.5 }
        translate -2.77777775*z
        translate -2*y
        translate 0.4*x
}
}
 cylinder { <0, 0, -.25> <0, 0, .25> // this generates the scroll wheel
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
union{// this generates the cord of the mouse. It is seperate from the usb and be be transformed/ duplicated seperately.
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

#declare generic_box = // this generates the basic shapes used in the usb
       box { <3, 4,1> <2, 3.5, -.5> translate <3.1, -3.8,1.25> }
object {generic_box pigment {Gray10}} // this is the plastic part of the cord
difference { // this generates the metal part of the usb
object {generic_box scale.85*x scale .8*y  translate <.85, 0, 1> pigment{color P_Chrome5 } finish {F_MetalE ambient .2 // main metal part
       diffuse .3
       phong .5
       phong_size 15}}
object {generic_box scale <.25, .25, .25> translate <4.4, .2, 2.3> pigment{Gray10 } finish {F_MetalE ambient .2 // hole 1, furthest from mouse
       diffuse .3
       phong .5
       phong_size 15}}
object {generic_box scale <.25, .25, .25> translate <4, .2, 2.3> pigment{Gray10 } finish {F_MetalE ambient .2 hole 2, closest to mouse
       diffuse .3
       phong .5
       phong_size 15}}

}
                                                                                                                                                                                          178,0-1       Bot

                                                                                                                                                                                          88,5          69%
                                                                                                                                                                 1,1           Top

