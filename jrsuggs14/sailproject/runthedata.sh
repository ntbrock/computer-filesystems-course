rm GPSdata.png
rm pureGPS.csv
grep "GPGLL" allthesaildata.txt >  pureGPS.csv
gnuplot sortGPGLL.gnuplot


