#!/bin/bash

#Default print function with colors
#$1 color
#$2 text
#$3 ${ra} if needed
print_with_color()
{
  if [[ -z "$3" ]]; then
    echo -e "$1$2${GREEN}"
  else
    echo -e "$1$2${ra}"
  fi
} 

lr="\e[91m" 		#	${lr}	
GREEN="\e[32m"		#	${GREEN}
CYAN="\e[36m"		#	${CYAN}
YELLOW="\e[33m"		#	${YELLOW}
ra="\e[0m"			# 	${ra} 				reset all attributes



#$1 ticket number
#$2 start or end with timestamp f.e.: s_13:45, e_15:36
print_with_color "" ""
if [[ $1 = "e" ]]; then
  # /path/to/editor 
  #param -->  /path/to/work.log sublime is .exe so windows path should be used
  cd ~/
  /cygdrive/e/stuffs/Sublime_Text_3/sublime_text.exe "c:\Workplace\cygwinx64_pack\cygwin\home\bkatona\scripts\work.log"
else
  if [[ -z "$2" ]]; then
    python ~/scripts/time_log.py "$1"
  else
    python ~/scripts/time_log.py "$1" "$2" "$3"
  fi
fi
