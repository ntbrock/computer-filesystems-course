set datafile separator ","


set output "GPSdata.png"
set term png

set view 60,45 
set contour base
set nosurface
set view 0,0

splot 'superpuredata.csv' using 4:2:13 smooth csplines

