#!/bin/bash

# coloring text
lc="\e[96m" 	#light cyan ${lc}
lr="\e[91m" 	#light red ${lr}
lg="\e[32m" 	#light green  	${lg}
RED="\e[31m"		#	${RED}		
GREEN="\e[32m"		#	${GREEN}
CYAN="\e[36m"		#	${CYAN}
YELLOW="\e[33m"		#	${YELLOW}
ra="\e[0m"		#reset all attributes 	${ra}

echo -e "${GREEN}Logging has started..."
file_name=$2
folder_name=""

# The -z switch will test if the expansion of "$2" is a null string or not. If it is a null string then the body is executed.
# Further more if no folder name is given then the $1 param will be the file name
if [[ -z "$2" ]]; then
	folder_name="default"
	file_name=$1
else
	folder_name=$1
fi

cd /cygdrive/c/Work/iGO_FC6_RADNAV_3.0/
echo -e "${CYAN}Entering to the repository! Done..."
echo -e "${RED}make all -j8${ra}"
make all -j8 > /cygdrive/c/Work/logs/warning_ticket/${folder_name}/${file_name}.log
echo -e "${GREEN}Done..."
echo -e "${CYAN}log can be found here: ${GREEN}/cygdrive/c/Work/logs/warning_ticket/${folder_name}/${file_name}.log"