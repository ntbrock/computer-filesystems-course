set datafile separator ","


set output "GPSdata1.png"
set term png

set view 60, 60, 1, 1.5

plot 'pureGPS1.csv' using 4:2 smooth bezier 
