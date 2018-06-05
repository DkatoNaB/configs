#!/bin/bash

# font colors
lr="\e[91m"   #light red    ${lr}
GREEN="\e[32m"    # ${GREEN}
CYAN="\e[36m"   # ${CYAN}
YELLOW="\e[33m"   # ${YELLOW}
ra="\e[0m"    #reset all attributes   ${ra}

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

print_with_color "${CYAN}" "Gubber browser"
print_with_color "${CYAN}" "http://localhost:8080/debug-file/android_linked_root/debugger/index.html"
print_with_color "${CYAN}" "adb forward tcp:8080 tcp:8080"
adb forward tcp:8080 tcp:8080
