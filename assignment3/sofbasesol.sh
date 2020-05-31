#!/bin/bash

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
    echo "You Choosed: Download a specific thumbnail, ie DSC01566"
	OneFile;

elif [ $option == 2 ]
then
    echo "You Choosed: Download ALL thumbnails"
	allfiles; 
elif [ $option == 3 ]
then
    echo "You Choosed: Download images in a range"
	DifferentRange;
elif [ $option == 4 ]
then
    echo "You Choosed: Download a specified number of images" 
    RandomSelFiles
elif [ $option == 5 ]
then
    exit

else
    echo "Enter a valid option."
fi

}




function OneFile {

read -p "Please Enter file name i.e., DSC01543: " fileNum

echo "You entered: $fileNum";

curl https://secure.ecu.edu.au/service-centres/MACSC/gallery/152/$fileNum.jpg -s --output /root/Desktop/downloadthefiles/$fileNum.jpg

echo "Downloading $fileNum, with the file name $fileNum.jpg ... File Download Successfully"

user_menu
}

function allfiles {

echo "All thumbnails are now being dowloaded..";

for i in {01549..02042}
do
	curl https://secure.ecu.edu.au/service-centres/MACSC/gallery/152/DSC$i.jpg -s --output /root/Desktop/downloadthefiles/DSC$i.jpg
echo "Downloading DSC$i, with the file name DSC$i.jpg ... File Download Successfully"
done

user_menu

}


function DifferentRange {

read -p "Enter the  start range i.e., 1540: " StartRange
read -p "Enter the  end range i.e., 1550: " EndRange

echo "All thumbnails within range are now being dowloaded.";

for (( c=$StartRange; c<=$EndRange; c++ ))
do
	curl https://secure.ecu.edu.au/service-centres/MACSC/gallery/152/DSC0$c.jpg -s --output /root/Desktop/downloadthefiles/DSC0$c.jpg
echo "Downloading DSC0$c, with the file name DSC0$c.jpg ... File Download Successfully"
done

user_menu

}

function RandomSelFiles {

read -p "Enter the number of thumbnails for download i.e., 7: " NumOfFiles

read -p "Enter the start range i.e., 1547: " StartRange

read -p "Enter the end range i.e., 1550: " EndRange

nos=$(shuf -i $StartRange-$EndRange -n $NumOfFiles)


for i in $nos
do
	curl https://secure.ecu.edu.au/service-centres/MACSC/gallery/152/DSC0$i.jpg -s --output /root/Desktop/downloadthefiles/DSC0$i.jpg
echo "Downloading DSC0$i, with the file name DSC0$i.jpg ... File Download Successfully"

done

user_menu

}


#Displaying the Connection status
if [ -s HeaderInfo ]; 
	then echo "Perfect Connection";
	#prompting for user menu	
	user_menu;
	else echo "Connection Failed. Try again later when connected."; exit
fi

