rm GPSdata1.png
rm pureGPS1.csv


grep "GPGLL" allthesaildata1.txt > pureGPS1.csv


gnuplot sortGPGLL1.gnuplot


