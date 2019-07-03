set datafile separator ","


set output "GPSdata.png"
set term png

plot 'pureGPS.csv' using 4:2 smooth bezier
