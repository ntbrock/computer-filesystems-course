rm GPSdata1.png
rm pureGPS1.csv
rm GPSdatapoints1.png

grep "GPGLL" *.nmea  > pureGPS1.csv


gnuplot sortGPGLL1.gnuplot
gnuplot sortGPGLLpoints1.gnuplot

