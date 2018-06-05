#!/bin/bash

#font colors
RED="\e[31m"		#	${RED}		
GREEN="\e[32m"		#	${lg}
CYAN="\e[36m"		#	${CYAN}
YELLOW="\e[33m"		#	${YELLOW}
ra="\e[0m"			# 	${ra} 				reset all attributes
lr="\e[91m" 	#light red 		${lr}
lc="\e[96m" 	#light Cyan 	${lc}
ly="\e[93m" 	#light yellow 	${ly}
lg="\e[92m" 	#light green 	${lg}

#tabs
t="\t"
tt="${t}\t"
ttt="${tt}\t"
tttt="${ttt}\t"
ttttt="${tttt}\t"
tttttt="${ttttt}\t"

#$1 script name
#$2 script description
#$3 script color
#$4 script description color
print_it()
{
	if [[ -z "$3" ]]; then
		echo -e "${t}${lc}$1 ${lg}$2${ra}"
	else
		echo -e "${t}$3$1 $4$2${ra}"
	fi
}

todo()
{
	if [[ $1 > 0 ]]; then
		#TODO script descriptor updates
		echo -e "${lr}TODO update the scripts helper!\n"
		echo -e "${ly}${ra}"
		echo -e "${lg}scripts are the followings...${lc}\n"
	else
		echo -e "\n${lg}helper is up to date!\n${ra}"
	fi
}
endl()
{
	#echo "" # endl function
	if [[ -z $1 ]]; then
		print_it "${t}---" "${ttt}${ttt}---"
	else
		print_it "${t}${lr}-= $1 =-" "${tt}${ttt}---"
	fi
}

todo 1

#try to maintain an alfanumeric order
if [[ $1 = "h" ]]; then
	#=======------- C -------=======#
	endl "C"
	print_it "colors_bas_h.sh" "${tttt}printing out all the colors"
	#=======------- D -------=======#
	endl "D"
	print_it "developer_mode.sh " "${tttt}Developer mode intent"
	print_it "droid_adblog.sh ${ly}grep_param" "${ttt}${ly}grep_param${lg} is the grep string"
	print_it "droid_adblog.sh ${ly}vr" "${tttt}${ly}vr related logs"
	print_it "droid_adblog.sh ${ly}tts" "${tttt}${ly}TTS related logs"
	print_it "droid_adblog.sh ${ly}f" "${tttt}save everything to file"
	print_it "droid_adblog.sh ${ly}fvr" "${tttt}save ${ly}vr related logs${lg} to file"
	endl
	print_it "droid_color.sh"  "${ttttt}list all colors"
	print_it "droid_install.sh" "${tttt}fastest way to build & install iGO"
	print_it "droid_install.sh ${ly}ou" "${tttt}only install UI"
	print_it "droid_install.sh ${ly}a"  "${tttt}build & install & ui"
	print_it "droid_install.sh ${ly}w"  "${tttt}config-warning & build & install; useful for warning checks"
	print_it "droid_install.sh ${ly}p/d"  "${tttt}config-radnav & build & install; Radnav ${lr}production/demo${lg} build"
	print_it "droid_install.sh ${ly}r"  "${tttt}remove save folder"
	print_it "droid_install.sh ${ly}c ou" "${tttt}China-project  only install UI"
	print_it "droid_install.sh ${ly}c a"  "${tttt}China-project  build & install & ui"
	print_it "droid_install.sh ${ly}c w"  "${tttt}China-project  config-warning & build & install; useful for warning checks"
	print_it "droid_install.sh ${ly}c p/d"  "${tttt}China-project  config-radnav & build & install; Radnav ${lr}production/demo${lg} build"
	endl
	print_it "droid_log.sh ${ly}file_name" "${tttt}log on droid with time param1 could be the file name (default is time)"
	#=======------- F -------=======#
	endl "F"
	print_it "force_stop_navi.sh" 	"${tttt}Stops navi without restart"
  #=======------- G -------=======#
  endl "G"
  print_it "gubber.sh" "${ttttt}connects kutyu to gubber for UI debugging"
	#=======------- L -------=======#
	endl "L"
	print_it "lss.sh"  "${tttttt}list all script"
	print_it "logminer.sh " "${ttttt}search through logs, if no param is given then the target is ${ly}navngo"
	print_it "logminer.sh ${ly} ticket_number ts hh:mm" "${tt}search through logs, _ts_ means time stamp f.e. ${ly}logminer.sh 69 ts 16:20"
	print_it "logminer.sh ${ly} ticket_number regex" "${tt}search through logs for the given regex"
	print_it "logminer.sh ${ly} ticket_number regex remove" "${t}removes whole line where given regex can be found"
	print_it "logminer.sh ${ly} ticket_number regex c remove" "${t}removes whole line where given regex can be found in china project"
	print_it "logminer.sh ${ly} ticket_number fk/vr n_c||c n_remove||remove" "${t}removes or keeps whole line where given \"${lr}fk/vr${lg}\" can be found in global/china project"
	#=======------- P -------=======#
	endl "P"
	print_it "ptt.sh"  "${tttttt}VR intent"
	#=======------- T -------=======#
	endl "T"
	print_it "tar_cpy.sh"  "${ttttt}should copy a content.tar to kutyu in ${lr}TODO ${lg}phase"
	#=======------- W -------=======#
	endl "W"
	print_it "warnings_log.sh ${ly}folder_name  ${ly}file_name" "${tt}compiler warnings param1 is folder name param2 is file name"
  print_it "wl.sh" "${tttttt}work log script refresh date"
  print_it "wl.sh ${ly}ticket_number s_o_e" "${ttt}${ly}ticket_number ${lg}is trivial ${ly}s_o_e ${lg}means start or end"
  print_it "wl.sh ${ly}cal" "${ttttt}calcualtes all work log by ticket"
  print_it "wl.sh ${ly}h" "${ttttt}reads every uncalcualted log"
else
	echo -e "${lc}"
	cd ~/scripts
	ls -a | grep .sh
	echo -e "${lg}\nFor details run the script again with ${ly}h${lg} parameter!"
fi