set datafile separator ","


set output "GPSdata.png"
set term png

set view 15,30 

splot 'superpuredata.csv' using 4:2:13 

