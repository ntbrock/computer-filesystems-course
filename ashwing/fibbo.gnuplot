#!/usr/bin/gnuplot

set datafile separator ","

set output "gnugraph.png"
set term png

plot 'pmsm_temperature_data.csv' using 1:2

