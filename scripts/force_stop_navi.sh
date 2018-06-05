lr="\e[91m" 	#light red 		${lr}
lg="\e[92m" 	#light green 	${lg}

build_folder="Radnav-prod"
path="/cygdrive/c/Work/iGO_FC6_RADNAV_3.0/maketools/build/${build_folder}/targets/iGO.apk"

if [[ $1 = "f" ]]; then
	echo -e "${lr}Navi force stop!"
	echo -e "adb shell am force-stop com.navngo.igo.javaclient"
	adb shell am force-stop com.navngo.igo.javaclient
elif [[ $1 = "i" ]]; then
	echo -e "${lr}" "NAVI stop with -install- method"
	echo -e "adb install -r ${path}maketools/build/${build_folder}/targets/iGO.apk"
	adb install -r ${path}
else
	echo -e "${lr}" "Navi normal stop"
	echo -e	"${lr}" "adb shell am broadcast -a com.lge.ivi.action.PREPARE_MM_OFF com.navngo.igo.javaclient"	
	adb shell am broadcast -a com.lge.ivi.action.PREPARE_MM_OFF com.navngo.igo.javaclient
fi
# close as intented
#adb shell am broadcast -a com.lge.ivi.action.PREPARE_MM_OFF com.navngo.igo.javaclient
echo -e "${lg}Click to start navi!"