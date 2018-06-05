#font colors
CYAN="\e[36m"   # ${CYAN}
GREEN="\e[32m"    # ${GREEN}
YELLOW="\e[33m"   # ${YELLOW}
lr="\e[91m"   #light red    ${lr}
ra="\e[0m"    #reset all attributes   ${ra}

#echo -e "${lr}TODO megcsinálni!!!"
#echo -e "${lr}copy content (as tar) from pendrive to map"
#adb shell tar -x -C /map -f /mnt/vold/E2502B2D/content.tar
#t means "this" so if we call this script from a given folder then this will search
if [[ !($1 = "t") ]]; then
  echo "Entering to content folder...->$1"
  cd $1
fi
echo "Proceed to tar-ing up tar -cvf content.tar content/ \!ContentList.txt"
#tar-ing the contents AF
tar -cvf content.tar content/ \!ContentList.txt

echo "cpy content.tar to pendrive"
cp content.tar /cygdrive/h/

asd=""
echo "Please remove pendrive and plug into kutyu... Press enter to continue"
read asd
result=$(adb shell echo /mnt/vold/*|tr -d '\r')

echo "adb shell tar -x -C /map -f ${result}/content.tar"
adb shell tar -x -C /map -f "$result/content.tar"
#adb shell tar -x -C /map -f /mnt/vold/BAFC97F3/content.tar
