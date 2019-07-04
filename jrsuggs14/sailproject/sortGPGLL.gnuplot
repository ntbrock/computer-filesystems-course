set datafile separator ","


set output "GPSdata.png"
set term png

set view 60, 120, 2, 4

splot 'superpuredata.csv' using 4:2:13 
