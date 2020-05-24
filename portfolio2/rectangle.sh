#! /bin/bash

#Sandesh kumar
#10484820

cat rectangle.txt | sed 's/^/Name:  /; 	#This line of code is reading the file and sending to sed command to 'Name' at the begining
	 s/,/  Hieght:  /; 		#This line of code replaces the 1st comma with Hieght:   
	 s/,/  Width:  /; 
	 s/,/  Area:  /;		
	 s/,/  Colour:  /;		
	 1d;					#removing first row of input file
	 s///g' | column -t -s ' ' > rectangle_f.txt 

#Now the above last statement formate the text allignment into new rectangle_f.txt file
#To get the output in this rectangle.sh script, just need to write cat rectangle_f.txt in the end of the code
