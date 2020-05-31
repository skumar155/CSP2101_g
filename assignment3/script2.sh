#!/bin/bash

#Kumar Sandesh
#10484820

#connection checking, and storing HeaderInfo in file called HeaderInfo
curl https://www.ecu.edu.au/ -I > HeaderInfo -s

#user menu fucntion for input and validation
function user_menu {

echo "Select 1 from the given 5 option below"

echo "1: Download a specific thumbnail, ie DSC01566"

echo "2: Download ALL thumbnails"

echo "3: Download images in a range (by the last 4 digits of the file name), as an example, starting range of 1558 and ending range of 1569"

echo "4: Download a specified number of images"

echo "5: Exit program"

#reading a input

read -p "Enter your option: " option

#evaluating the below code

if [ -z "$option" ]
then
    echo "Enter a valid option."
 
elif [ $option == 1 ]
then
    echo "You Entered: Download a specific thumbnail, ie DSC01566"

elif [ $option == 2 ]
then
    echo "You Entered: Download ALL thumbnails"
 
elif [ $option == 3 ]
then
    echo "You Entered: Download images in a range"

elif [ $option == 4 ]
then
    echo "You Entered: Download a specified number of images"

elif [ $option == 5 ]
then
    exit

else
    echo "Enter a valid option."
fi

}

#Showing the Connection status
if [ -s HeaderInfo ]; 
	then echo "Perfect Connection.";
	#Get user menu	
	user_menu;
	else echo "Connection Failed. Try again later when connected."; exit
fi
