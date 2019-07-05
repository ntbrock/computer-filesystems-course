This project is about compiling large amounts of boat telemetry and using it to map out the path of the boat.
The new version of the project is a 3D graph that also shows the relative wind velocity as height.
The only work I have to do for each system to work is to remove the previous "allthesaildata.txt" file, curl in the new data, and run the file, "runthedata.sh" 

In the system, I grep the data I need using the NMEA tags in order to compile the data that I actually need in another file. I then use ththose file in gnuplot


Next time, I would use python with their mapping functions in order to do map overlays. I would also try to mabye use contor controls to show where the windspeed was greatest if I use gnuplot again.
