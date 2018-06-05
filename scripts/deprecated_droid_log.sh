#!/bin/bash

#font colors
RED="\e[31m"		#	${RED}		
GREEN="\e[32m"		#	${GREEN}
CYAN="\e[36m"		#	${CYAN}
YELLOW="\e[33m"		#	${YELLOW}

#folder_name=$1
folder_name="default"
file_name=$1

echo -e "${GREEN}to change the folder_name go to c:\\Workplace\\cygwinx64_pack\\cygwin\\home\\bkatona\\scripts\\droid_log.sh"

#if no param is given then we use time stamp instead
if [[ -z "$1" ]]; then
	filename=$(date +"%H_%M_%S")
	echo -e "${CYAN}Log will be found here: \nc:/Work/logs/${folder_name}/${filename}.txt"
else
	echo -e "${CYAN}Log will be found here: \nc:/Work/logs/${folder_name}/${filename}.txt"
fi
adb logcat -v time > /cygdrive/c/Work/logs/${folder_name}/${filename}.txt