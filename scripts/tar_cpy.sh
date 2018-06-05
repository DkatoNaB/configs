#!/bin/bash

#font colors
CYAN="\e[36m"		#	${CYAN}
GREEN="\e[32m"		#	${GREEN}
YELLOW="\e[33m"		#	${YELLOW}
lr="\e[91m" 	#light red 		${lr}
ra="\e[0m"		#reset all attributes 	${ra}

echo -e "${lr}TODO megcsinálni!!!"
echo -e "${lr}copy content (as tar) from pendrive to map"
adb shell tar -x -C /map -f /mnt/vold/E2502B2D/content.tar
