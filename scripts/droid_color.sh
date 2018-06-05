#!/bin/bash

if [[ $1 = "b" ]]; then
	#blue
	adb shell CarinfoCmd can 4 0003024000000000
fi
if [[ $1 = "s" ]]; then
	#brown S H I E T
	adb shell CarinfoCmd can 4 0005024000000000		
fi
if [[ $1 = "g" ]]; then
	#green
	adb shell CarinfoCmd can 4 0001024000000000
fi
if [[ $1 = "p" ]]; then
	#purple
	adb shell CarinfoCmd can 4 0004024000000000
fi
if [[ $1 = "r" ]]; then
	#red
	adb shell CarinfoCmd can 4 0002024000000000
fi