#!/bin/bash -ev

. ./setenv.sh

sdkmanager --list

echo y | sdkmanager "platform-tools"
echo y | sdkmanager "tools"


echo y | sdkmanager "extras;android;m2repository"
echo y | sdkmanager "extras;google;m2repository"

echo y | sdkmanager "build-tools;23.0.2"
echo y | sdkmanager "build-tools;23.0.3" 
echo y | sdkmanager "build-tools;25.0.2" 
echo y | sdkmanager "build-tools:26.0.0"

echo y | sdkmanager "platforms;android-16" 
echo y | sdkmanager "platforms;android-21" 
echo y | sdkmanager "platforms;android-23" 
echo y | sdkmanager "platforms;android-24" 
echo y | sdkmanager "platforms;android-25" 
echo y | sdkmanager "platforms;android-26"

sdkmanager --update
