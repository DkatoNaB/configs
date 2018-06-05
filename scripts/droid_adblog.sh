#!/bin/bash

#font colors
RED="\e[31m"		#	${RED}		
GREEN="\e[32m"		#	${GREEN}
CYAN="\e[36m"		#	${CYAN}
YELLOW="\e[33m"		#	${YELLOW}
lr="\e[91m" 	#light red 		${lr}
ra="\e[0m"		#reset all attributes 	${ra}

#############################################################
# TODO adb logcat -v time | sed -bu "s/\r//" > adb6.log 	#
#############################################################

grep_param=$1
#log_file=$2
#folder="gender"
#here="/cygdrive/c/Work/logs/ticket_logs/${folder}/${log_file}"

if [[ ${grep_param} = "vr" ]]; then
	#########################################################
	#	This branch is for sending VR intent; and log it 	#
	#########################################################
	#echo -e "${RED}sending VR intent..."
	adb shell am broadcast -a com.lge.intent.action.ARC_PTT
	#grep_param="/navngo.*((vr)|(ipc_control)|(VUICommunicator)|(fgt))" 
  grep_param="(VR|ipc_control|VUICommunicator|fgt)" 
  #grep_param="VUICommunicator"
fi

if [[ ${grep_param} = "tts" ]]; then
	grep_param="(TextToSpeech|external_regional_config|regional)"
fi

#adb logcat -v time | sed -bu "s/\r//" > adb.log 

if [[ $1 = "fvr" ]]; then
	echo -e "$CYAN" "adb logcat -c && adb logcat -v time & log it to file"
	echo -e "$CYAN" "adb shell am broadcast -a com.lge.intent.action.ARC_PTT"
	adb shell am broadcast -a com.lge.intent.action.ARC_PTT
	adb logcat -c && adb logcat -v time | sed -bu "s/\r//" > adb_log.txt
fi

if [[ $1 = "f" ]]; then
	echo -e "$CYAN" "adb logcat -c && adb logcat -v time || also log to file"
	adb logcat -c && adb logcat -v time | sed -bu "s/\r//" > adb_log.txt
fi

if [[ -z "$1" ]]; then
	echo -e "${CYAN}adb logcat -c && adb logcat -v time${GREEN}"
	adb logcat -c && adb logcat -v time
elif [[ -z "$2" ]]; then
	echo -e "${CYAN}adb logcat -c && adb logcat -v time | grep \"${grep_param}\" -P ${GREEN}"
	adb logcat -c && adb logcat -v time | grep "${grep_param}" -P
fi

