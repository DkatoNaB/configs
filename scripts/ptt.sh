#!/usr/bin/bash

echo "VR intent  adb shell am broadcast -a com.lge.intent.action.ARC_PTT sent"
adb shell am broadcast -a com.lge.intent.action.ARC_PTT