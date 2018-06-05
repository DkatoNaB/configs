#!/bin/bash

lr="\e[91m" 		#light red 		${lr}
GREEN="\e[32m"		#	${GREEN}
CYAN="\e[36m"		#	${CYAN}
YELLOW="\e[33m"		#	${YELLOW}
ra="\e[0m"			# 	${ra} 				reset all attributes

#$1 color
#$2 text
#$3 ${ra} if needed
print_with_color()
{
  if [[ -z "$3" ]]; then
    echo -e "$1$2${GREEN}"
  else
    echo -e "$1$2$3"
  fi
} 

ticket_number=$1
# $1 ticket_number
file_path="/cygdrive/e/stuffs/HELP/ticket_helpers"
# ticket number is enough
folder="$file_path/$ticket_number-RADNAV3"
if [[ $3 = "c" ]]; then
  folder="$file_path/_China/$ticket_number-RADNAV"
fi

cd $folder
result=$(ls -1 | grep "(txt|\.log\d*)" -P )
#echo "the list of logs"
#echo $result


#search_param_python
spp="$2"
if [[ $2 = "ts" ]]; then
	spp="$3:\d\d\.\d\d\d"
fi
#annoyances
if [[ $2 = "fk" ]]; then
  spp="(GLMapView|OpenGL|ServerRunner:todo:|AdasFunctors|I/NMEA)"
  print_with_color "${lr}" "default regex is the following: ${CYAN} $spp"
fi

#VR realted stuffs
if [[ $2 = "vr" ]]; then
  spp="VR|ipc_control|VUICommunicator|fgt"
  print_with_color "${lr}" "VR regex is the following: ${CYAN} $spp"
fi

print_with_color "${lr}" "python script started..." "${GREEN}"

if [[ $3 = "remove" ]]; then
  china_or_not="not_china"
  remove_or_not="remove"
else
  china_or_not="not_china"
  remove_or_not="not_remove"
fi

if [[ $3 = "c" ]]; then
  china_or_not="c"
  if [[ $4 = "remove" ]]; then
    remove_or_not="remove"
  else
    remove_or_not="not_remove"
  fi
fi

#if [[ -z "$4" ]]; then
#  remove_or_not="not remove"
#else
#  remove_or_not="remove"
#fi
print_with_color "${GREEN}" "find_str.py $ticket_number \"$result\" \"$spp\" $china_or_not $remove_or_not"
python ~/scripts/find_str.py $ticket_number "$result" "$spp" $china_or_not $remove_or_not

#if [[ -z "$3" ]]; then
#  china_or_not="c" #fasz kivan refactor needed
#  if [[ -z "$2" ]]; then
#    python ~/scripts/find_str.py $ticket_number "$result"
#  else
#    python ~/scripts/find_str.py $ticket_number "$result" $spp
#  fi
#else
#  #$3 china or not ;;; $4 remove
#  
#fi

