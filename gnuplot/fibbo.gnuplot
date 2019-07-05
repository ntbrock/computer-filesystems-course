#!/usr/bin/gnuplot

set datafile separator ","

set output "fibbo.png"
set term png

plot 'fibbo.csv' using 1:2

