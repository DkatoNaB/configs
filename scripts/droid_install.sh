#!/bin/bash

### install -> adb install -r path/to/iGO.apk

#this block must be the first command probably
trap "exit 1" TERM
export TOP_PID=$$

terminate_the_fk_off()
{
   print_with_color "${lr}" "Something is not quite right! exit code: $1"
   kill -s TERM $TOP_PID
}

# font colors
lr="\e[91m"   #light red    ${lr}
GREEN="\e[32m"    # ${GREEN}
CYAN="\e[36m"   # ${CYAN}
YELLOW="\e[33m"   # ${YELLOW}
ra="\e[0m"    #reset all attributes   ${ra}

#path to project
p="/cygdrive/c/Work/iGO_FC6_RADNAV_3.0/"
#path to radnav_global
prg="${p}iGO_target/makedist/radnav_global/"
#path to data.zip
pdz="${prg}out/data.zip"
#path to ui_radnav
pur="${prg}out/ui_radnav"

#china
#path to project
c_p="/cygdrive/c/Work/china_src/iGO_FC6_RADNAV_CHINA_2.0_RC/"
#path to radnav china UI
c_prg="${c_p}iGO_target/makedist/radnav_china/"
#path to data.zip
c_pdz="${c_prg}out/data.zip"
#path to ui_radnav
c_pur="${c_prg}out/ui_radnav"
#core fro make
core_number=7

#enviroment variables
pythonW="/cygdrive/c/Python27/python.exe"

###################################################################################################
#   echo -e "${lr}TODO megcsinálni!!!"                                               
#   echo -e "${lr}copy content (as tar) from pendrive to map"                        
#   adb shell tar -x -C /map -f /mnt/vold/E2502B2D/content.tar                     
###################################################################################################

sync_files()
{
  print_with_color "${CYAN}" "adb shell sync..."
  adb shell sync
}

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

kill_navi()
{
  if [[ $1 = "f" ]]; then
    print_with_color "${lr}" "Navi force stop!"
    print_with_color "${lr}" "adb shell am force-stop com.navngo.igo.javaclient"
    adb shell am force-stop com.navngo.igo.javaclient
  else
    print_with_color "${lr}" "Navi normal stop"
    print_with_color "${lr}" "adb shell am broadcast -a com.lge.ivi.action.PREPARE_MM_OFF com.navngo.igo.javaclient"
    adb shell am broadcast -a com.lge.ivi.action.PREPARE_MM_OFF com.navngo.igo.javaclient
  fi
}


##################################################################################################################
#     TO FKING DO TODO#
# #!/bin/bash                                                                                                    
# 
# CONF_FILE_NAME="test.ini"#
# #
# while read -e#
# do#
#     LINE=$REPLY#
#     [[ $LINE =~ ^([a-zA-Z0-9_]+)=([a-zA-Z0-9_]+)$ ]]#
#     KEY=${BASH_REMATCH[1]}#
#     VALUE=${BASH_REMATCH[2]}#
# #
#     echo "${KEY} :: ${VALUE}"#
#     #
# done < $CONF_FILE_NAME#
# Meg még ez hátha hasznos:#
# #
# $ declare -A options#
# $ options=(["build"]="demo" ["target"]="android")#
# $ echo ${options[build]}#
# demo#
# $ echo ${options[target]}#
# android#
# #
# Mert akkor rögtön teheted az configokat a dict-be, és egyszerűen el is tudod érni őket később :)                
##################################################################################################################
#echo "${p}asd"

#$1 w  build for warning stuffs; makes all warning error
#$1 r  radnav prod build
# this function based on defaulting the prod build;
build_it ()
{
  if [[ $1 = "c" ]]; then
    default_conf="c"
    build_folder="RadnavChina-prod"
    print_with_color "${CYAN}" "cd ${c_p} ..."  
    cd ${c_p}

    if   [[ $2 = "d" ]]; then
      print_with_color "${lr}" "make config-RadnavChina &&  make all -sj${core_number} core ${GREEN}"
      make config-RadnavChina && make all -sj${core_number}
      build_folder="RadnavChina"
    elif [[ $2 = "p" ]]; then
      print_with_color "${lr}" "make config-RadnavChina-prod &&  make all -sj${core_number} core ${GREEN}"
      make config-RadnavChina-prod && make all -sj${core_number}
      build_folder="RadnavChina-prod"
    else
      print_with_color "${lr}" "make all -sj${core_number}"
      make all -sj${core_number}
    fi

  else
    default_conf="g"
    build_folder="Radnav"
    print_with_color "${CYAN}" "cd $p ..."  
    cd $p 

    if   [[ $1 = "w" ]]; then
      print_with_color "${lr}" "make config-Radnav-assert && make depend -sj${core_number} && make all -sj${core_number}...${GREEN}"
      make config-Radnav-assert && make depend -sj${core_number}
      make all -sj${core_number}
      build_folder="Radnav-assert"
    elif [[ $1 = "d" ]]; then
      print_with_color "${lr}" "make config-Radnav &&  make all -sj${core_number} core ${GREEN}"
      make config-Radnav && make depend -sj${core_number}
      make all -sj${core_number}
      build_folder="Radnav"
    elif [[ $1 = "p" ]]; then
      print_with_color "${lr}" "make config-Radnav-prod &&  make all -sj${core_number} core ${GREEN}"
      make config-Radnav-prod && make depend -sj${core_number}
      make all -sj${core_number}
    elif [[ $1 = "cda" ]]; then
      print_with_color "${lr}" "CLEAN -> CONFIG -> DEPEND -> ALL${GREEN}"
      make clean && make config-Radnav-prod && make depend -sj${core_number}
      make all -sj${core_number}
      build_folder="Radnav-prod"
      if [[ $? = 0 ]]; then
        print_with_color "${lr}" "make depend && make all -sj${core_number}${GREEN}"
        make depend && make all -sj${core_number}
      fi
    else
      print_with_color "${lr}" "make all -sj${core_number}"
      make all -sj${core_number}
    fi
  fi

  result=$?
  if [[ $result = 0 ]]; then
    print_with_color "${GREEN}" "MAKE status is OK..."
    kill_navi
    remove_fking_save_folder
    print_with_color "${CYAN}" "adb install -r maketools/build/${build_folder}/targets/iGO.apk${GREEN}"
    adb install -r maketools/build/${build_folder}/targets/iGO.apk
    sync_files
  else
    print_with_color "${lr}" "MAKE status NOK... "
    print_with_color "${lr}" "script terminates..."
    terminate_the_fk_off $result
  fi 
}

remove_fking_save_folder()
{
  print_with_color "${lr}" "Removing SAVE folder..."
  print_with_color "${lr}" "adb shell rm -R /iGO/save/*"
  adb shell rm -R /iGO/save/*
  print_with_color "${lr}" "adb shell rm -R /iGO/save/"
  adb shell rm -R /iGO/save/
}

without_ui()
{
  print_with_color "${CYAN}" "kutyu install w/o UI pack..."
  build_it "$1"
}

with_ui()
{
  print_with_color "${CYAN}" "kutyu install w/ UI pack..."
  if [[ !($1 = "ou") && !($1 = "cou") ]]; then
    #print_with_color "${CYAN}" "faszért lépsz ide be ->>>>$1"
    build_it "$1"
  fi  
  kill_navi # if only UI is copy, nothing will stop navi so we must kill this fker
  remove_fking_save_folder
  print_with_color "${CYAN}" "Running the python script to generate UI${GREEN}"

  if [[ $1 = "ca" || $1 = "cou" ]]; then
    print_with_color "${lr}" "cd ${c_prg}"
    cd ${c_prg}
  else
    cd ${prg}
  fi

  $pythonW radnav_pack.py
  
  result=$?
  if [[ !($result = 0) ]]; then
    terminate_the_fk_off $result
  fi
  cd out
  print_with_color "${CYAN}" "adb push data.zip /iGO${GREEN}"
  adb push data.zip /iGO
  
  if [[ $1 = "cou" || $1 = "c" || $1 = "ca" ]]; then
    print_with_color "${CYAN}" "adb push ui_radnav_china /iGO/${GREEN}"
    adb push ui_radnav_china /iGO
  else
    print_with_color "${CYAN}" "adb push ui_radnav /iGO/${GREEN}"
    adb push ui_radnav /iGO
  fi

  if [[ $1 = "ca" || $1 = "c" || $1 = "cou" ]]; then
    ch_own_china
  else
    print_with_color "${CYAN}" "adb shell chown app_49.app_49 iGO/data.zip"
    adb shell chown app_49.app_49 iGO/data.zip
    print_with_color "${CYAN}" "adb shell chown app_49.app_49 iGO/ui_radnav/*"
    adb shell chown app_49.app_49 iGO/ui_radnav/*
    print_with_color "${CYAN}" "adb shell chown app_49.app_49 iGO/ui_radnav"
    adb shell chown app_49.app_49 iGO/ui_radnav
  fi

  sync_files
}

ch_own_china()
{
  print_with_color "${CYAN}" "adb shell chown app_42.app_42 /iGO/ui_radnav_china/*"
  adb shell chown app_42.app_42 /iGO/ui_radnav_china/*
  print_with_color "${CYAN}" "adb shell chown app_42.app_42 /iGO/ui_radnav_china"
  adb shell chown app_42.app_42 /iGO/ui_radnav_china
  print_with_color "${CYAN}" "adb shell chown app_42.app_42 /iGO/data.zip"
  adb shell chown app_42.app_42 /iGO/data.zip
}

with_everything()
{
  with_ui "$1"
}

#everything that relates to radnav global
radnav_global()
{
  if [[ $1 = "a" ]]; then
    print_with_color "${CYAN}" "build & install -> generate UI & copy..."
    with_everything 
  elif [[ $1 = "ou" ]]; then
    print_with_color "${CYAN}" "generate UI & copy..."
    with_ui "ou" #without build & install; only UI
  elif [[ $1 = "d" ]]; then
    print_with_color "${lr}" "DEMO config"
    without_ui $1  # demo build
  elif [[ $1 = "p" ]]; then
  print_with_color "${lr}" "PROD config"
    without_ui $1  # prod build
  elif [[ $1 = "w" ]]; then
  print_with_color "${lr}" "WARNING config"
    without_ui $1  # set warnings as errors 
  else
   print_with_color "${lr}" "USING LAST config"
   without_ui
  fi
}

#everything that relates to radnav china
radnav_china()
{
  print_with_color "${lr}" "TO FKING DO <><><><><><><><><><><<>><"
  if [[ $1 = "cou" ]]; then
  #china UI
    print_with_color "${lr}" "!!! TODO not completed  !!!"
    print_with_color "${CYAN}" "giving permissions to ui files & sync & reboot..."
    with_ui "cou"
  elif [[ $1 = "ca" ]]; then
    with_everything $1
  elif [[ $1 = "c" ]]; then
    print_with_color "${CYAN}" "build and install script started..."
    without_ui "$1"
  elif [[ $1 = "cp" ]]; then
    print_with_color "${CYAN}" "build and install script started..."
    without_ui "$1"
  elif [[ $1 = "cda" ]]; then 
    print_with_color "${CYAN}" "clean depend & install script started..."
    without_ui "$1"
  else
    print_with_color "${CYAN}" "build and install script started..."
    build_it "asd" #build & install
  fi
}

#main function
# droid_install.sh c d  -> china demo
# droid_install.sh d    -> global demo
main()
{
  if   [[ $1 = "r" ]]; then
    kill_navi
    remove_fking_save_folder
  elif [[ $1 = "c" ]]; then
    radnav_china $2
  else
    radnav_global $1
  fi 
}

main $1 $2

final_result=$?
if [[ $final_result = 0 ]]; then
  print_with_color "${GREEN}" "script finished..."
else
  print_with_color "${lr}" "something went wrong...exit code: ${final_result}"
fi