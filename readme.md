Our project is to analyze the data behind the correlation of the average amount of 3 point shots taken and the amount of shots scored for the past 40 years in the NBA.


We graphed wrote these graphs in the function gnu plot. Simple commands such as plot were used in the code in order to plot data in a csv we created form the raw data file off of the NBA.

///

set datafile separator ","

set output 3point...png"
set term png

set title "3 Points ..."

set xlabel "Years..."

set gridlines 

plot '3point....csv' using 1:2 , "linear function for line of best fit"


///

This was the standard code whcih we used for each graph while substituting out the function and csv file.

Afterwards we were able to link the project files to our public_html directory. This allowed us to take the picture link and use it in our html

///

computer-filesystems-course ln -s public_html


///

At the end we published this to our html website. In order to link the pictures we used to code 

///

image src = "link of the png"  


///





