set datafile separator ","
  

set output "GPSdatapoints1.png"
set term png


plot 'pureGPS1.csv' using 4:2
