
//EXAMPLE OF INTERSECTION OF CONE WITH PLANE
//A CONIC SECTION THAT IS AN ELLIPSE

//Files with predefined colors and textures
#include "colors.inc"
#include "glass.inc"
#include "golds.inc"
#include "metals.inc"
#include "stones.inc"
#include "woods.inc"

//Place the camera
camera {
  sky <0,0,1>          //Don't change this
  direction <-1,0,0>   //Don't change this  
  right <-4/3,0,0>     //Don't change this
  location  <10,5,2>  //Camera location
  look_at   <0,0,0>    //Where camera is pointing
  angle 40      //Angle of the view--increase to see more, decrease to see less
}

//Ambient light to "brighten up" darker pictures
global_settings { ambient_light White }

//Place a light--you can have more than one!
light_source {
  <10,10,10>    //Change this if you want to put the light at a different point
  color White*2        //Multiplying by 2 doubles the brightness
}

//Set a background color
background { color White }

intersection{
cone { <0, 0, -2>, 2, <0, 0, 2>, 0 texture {T_Stone1}}
plane {<0,1,1>, .7 pigment {color Red}}
}
