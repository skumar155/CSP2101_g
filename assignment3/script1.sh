#!/bin/bash

#Kumar Sandesh
#10484820

#connection checking, and storing HeaderInfo in file called HeaderInfo
curl https://www.ecu.edu.au/ -I > HeaderInfo -s

#Showing the Connection status
if [[ -s HeaderInfo ]]; 
	then echo "Perfect Connection"; 
	else echo "Connection Failed. Try again later when connected."; 
fi
