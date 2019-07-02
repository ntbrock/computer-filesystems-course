#  2019Jul02

import fileinput

zoomLevel = -300

## print lightsource and camera
print("#include \"colors.inc\"")
print("camera {\nlocation <0, 0, %d>\nlook_at  <0, 0,0> }\n" % zoomLevel )
print("light_source { <2, 4, -3> color White}")
print("background { color Cyan }")

for line in fileinput.input():
    # Parse
    arr = line.rstrip().split(",")
   
    if len(arr) < 2:
        pass
    else:
        # do the stuff

        index = int(arr[0])
        fibb = int(arr[1])
        fibb2 = fibb * 2
        rad = index * 0.1
        print("// %d,%d,%d" % ( index, fibb, fibb2 ))
        print("sphere{ <%d,%d,0>, %f color Blue }" % ( fibb, fibb, rad ) )
    pass

