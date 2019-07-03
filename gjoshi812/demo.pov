#include "colors.inc"
#include "shapes.inc"
#include "glass.inc"
#include "stones.inc"
#include "metals.inc"
#include "woods.inc"
#include "textures.inc"

camera {
	location <-30, 6, 10>
	look_at <15, 10, 8>
}
#include "colors.inc"
background { color Cyan }


light_source { <25, 25, 25> color White}


sphere { 
	<9, 7, 6> 2
        texture {
                pigment { color Red }
        }
}	
sphere {
	<2, 7, 5> 2 
	texture {
		pigment {color Blue } 
	}
}
sphere {
        <-2, 12, 4>, 1
        texture {
                pigment { color Pink }
        }
}	
sphere {
        <-2, 2, 4>, 1
        texture {
                pigment { color Green }
        }
}
		
sphere {
        <12, 2, 7>, 1
        texture {
                pigment { color Gray }
        }
}	
sphere {
        <12, 12, 7>, 1
        texture {
                pigment { color Yellow }
        }
}

