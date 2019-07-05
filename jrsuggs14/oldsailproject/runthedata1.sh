rm GPSdata1.png
rm pureGPS1.csv
rm GPSdatapoints1.png

grep "GPGLL" allthesaildata1.txt > pureGPS1.csv


gnuplot sortGPGLL1.gnuplot
gnuplot sortGPGLLpoints1.gnuplot

