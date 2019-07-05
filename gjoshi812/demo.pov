#include "colors.inc"
#include "shapes.inc"
#include "glass.inc"
#include "stones.inc"
#include "metals.inc"
#include "woods.inc"
#include "textures.inc"

camera {
	location <18, -23, -10>
	look_at <10, -6, 0>
}
#include "colors.inc"
background { color White }


light_source { <30, -15, 4> color White}


sphere { 
	<9,7,6> 2
        texture {
                pigment { color Red }
        }
}	
sphere {
	<2, 7, 5> 2 
	texture {
		pigment {color Red } 
	}
}
sphere {
        <-2, 12, 4>, 1
        texture {
                pigment { color Cyan }
        }
}	
sphere {
        <-2, 2, 4>, 1
        texture {
                pigment { color Cyan }
        }
}
		
sphere {
        <12, 2, 7>, 1
        texture {
                pigment { color Cyan }
        }
}	
sphere {
        <12, 12, 7>, 1
        texture {
                pigment { color Cyan }
        }
}
cylinder { 
	<9, 7, 6> 
	<12, 12, 7> 
	0.25 
	open 
}
cylinder {
	<9, 7, 6> 
	<12, 2, 7> 
	0.25 
	open
} 
cylinder { 
	<2, 7, 5> 
	<-2, 12, 4>  
	0.25 
	open 
} 
cylinder { 
	<2, 7, 5> 
	<-2, 2, 4> 
	0.25 
	open 
} 
cylinder { 
	<9, 7, 5.5> 
	<2, 7, 4.5> 
	0.25 
	open
} 
cylinder { 
	<9, 7, 6.5> 
	<2, 7, 5.5> 
	0.25 
	open 
} 

