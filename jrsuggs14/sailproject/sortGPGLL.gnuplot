set datafile separator ","


set output "GPSdata.png"
set term png

set view 60,45 

splot 'superpuredata.csv' using 4:2:11 
