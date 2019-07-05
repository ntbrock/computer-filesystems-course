rm GPSdata.png
rm pureGPS.csv
rm purewind.csv
rm superpuredata.csv

grep "GPGLL" *.nmea > pureGPS.csv
grep "IIVWT" *.nmea > purewind.csv

paste pureGPS.csv purewind.csv > superpuredata.csv

gnuplot sortGPGLL.gnuplot


