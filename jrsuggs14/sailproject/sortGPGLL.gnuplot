set datafile separator ","


set output "GPSdata.png"
set term png

set view 60, 60, 1, 1.5

splot 'superpuredata.csv' using 4:2:11 
