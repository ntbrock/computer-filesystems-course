#include "colors.inc"    // The include files contain
#include "stones.inc"    // pre-defined scene elements
#include "textures.inc"    // pre-defined scene elements
#include "shapes.inc"
#include "glass.inc"
#include "metals.inc"
#include "woods.inc"

 camera {
	 location <0, 0, -20>
	 look_at  <0, 1, 4>
  }
 #declare Half_Torus = difference {
    torus {
      4, 1
      rotate -90*x  // so we can see it from the top
    }
    box { <-5, -5, -1>, <5, 0, 1> }
    pigment { Green }
  }
 #declare Flip_It_Over = 180*x;
 #declare Torus_Translate = 8;  // twice the major radius
 background { color Gray50 }
 difference {union {
    object { Half_Torus }
    object { Half_Torus
      rotate Flip_It_Overunion {
    object { Half_Torus }
    object { Half_Torus
      rotate Flip_It_Over
      translate x*Torus_Translate
    }
    object { Half_Torus
      translate x*Torus_Translate*2
    }
    object { Half_Torus
      rotate Flip_It_Over
      translate x*Torus_Translate*3
    }
    object { Half_Torus
      rotate Flip_It_Over
      translate -x*Torus_Translate
    }
    object { Half_Torus
      translate -x*Torus_Translate*2
    }
    object { Half_Torus
      rotate Flip_It_Over
      translate -x*Torus_Translate*3
    }
    object { Half_Torus
      translate -x*Torus_Translate*4
    }
    rotate y*45
    translate z*20
  }
      translate Torus_Translate*x
    }
  }
    torus {
      4, 1
      rotate x*-90  // so we can see it from the top
    }
    box { <-5, -5, -1>, <5, 0, 1> }
    pigment { Green }
  }
// torus {
//	 2, 0.5
//	 rotate-90*x
//	 texture {
//	 T_Stone25
//	 scale 1
//} }
  sphere { 
 	 <0,0,0,> 1
	 texture { pigment {Yellow}}
  }
  light_source { <2, 4, -3> color White}
