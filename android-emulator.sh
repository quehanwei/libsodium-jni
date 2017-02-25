#!/bin/bash -ev

. ./setenv.sh

ANDROID_API="${ANDROID_API:-android-10}"
ANDROID_ABI="${ANDROID_ABI:-armeabi-v7a}"

cat "$(which android-wait-for-emulator)"
echo y | sdkmanager "system-images;${ANDROID_API};default;${ANDROID_ABI}" "platforms;${ANDROID_API}"
android list targets
echo no | android create avd --force -n test -t "${ANDROID_API}" --abi "${ANDROID_ABI}"
emulator -avd test -no-window -memory 512 -wipe-data 2>&1 | tee emulator.log &
adb logcat 2>&1 | tee logcat.log &

# Workaround from https://code.google.com/p/android/issues/detail?id=10255#c31 to prevent the hanging of "adb shell"
while true; do 
#	echo "Pinging ADB server."
	adb -e shell echo ping || true
	sleep 10
done &

android-wait-for-emulator
