Why?
-Ethylene: naturally emmitted gas, ripening
- composed of 2 carbons and 4 hydrogen molecules 
-combination of biology/natural science and computer filsystems
-application of graphics; seeing how graphics are created from scratch

#include "colors.inc"				<-- allowed us to include colors, shapes, and textures
#include "shapes.inc"
#include "glass.inc"
#include "stones.inc"
#include "metals.inc" 
#include "woods.inc"
#include "textures.inc"

camera {
	location <18, -23, -10>			<-- allowed us to set a viewpoint, like plaing a spotlight
	look_at <10, -6, 0>			<-- allowed us to point where the campera pointed, like adjusting a 
							spotlight 
}
#include "colors.inc"
background { color White }


light_source { <30, -15, 4> color White}	<-- allowed us to illuminate scene	


sphere { 
	<9,7,6> 2				<-- <x,y,z> radius
        texture {
                pigment { color Red }
        }		<-- using the brackets was tedious; we had to make sure that we had the correct arrangement
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
	open 			<-- takes the end faces off of the cylinder
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
