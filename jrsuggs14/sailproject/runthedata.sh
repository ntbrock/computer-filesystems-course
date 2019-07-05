rm GPSdata.png
rm pureGPS.csv
rm purewind.csv

grep "GPGLL" allthesaildata.txt > pureGPS.csv
grep "IIVWT" allthesaildata.txt > purewind.csv

paste pureGPS.csv purewind.csv > superpuredata.csv

gnuplot sortGPGLL.gnuplot


