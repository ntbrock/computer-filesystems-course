#include "colors.inc"    
#include "stones.inc"   
#include "textures.inc"   
#include "shapes.inc"
#include "glass.inc"
#include "metals.inc"
#include "woods.inc"
camera {
    location <0, 1, -10>
    look_at 0
    angle 36
  }
  light_source { <500, 500, -1000> rgb <0.3, 0.3, 0.7> }
  plane { y, -1.5
    pigment { checker rgb <0.7, 0, 0.7> White }
  }
    intersection {
      sphere { <0, 0, 0>, 1
        translate -0.5*x
      }
      sphere { <0, 0, 0>, 1
        translate 0.5*x
      }
      pigment { Red }
      rotate 90*y
    }
  }
