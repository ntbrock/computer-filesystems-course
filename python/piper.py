#  2019Jul02

import fileinput

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
        print("%d,%d,%d" % ( index, fibb, fibb2 ))
    pass

