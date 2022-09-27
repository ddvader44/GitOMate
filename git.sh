#!/usr/bin/env bash

#go to the folder you wanna work on 
cd ~/Documents/GitOMate

git add .

DATE_BIN=$(command -v date)
DATE=`${DATE_BIN} +%y-%m-%d--%H:%M:%S`

git commit -m "changes made on $DATE"

git push

#show desktop notification according to your OS
UNAME=$(uname)

if [ "$UNAME" == "Linux" ] ; then
	notify-send "pushed to remote!"
elif [ "$UNAME" == "Darwin" ] ; then
	osascript -e 'display notification "pushed to remote" with title "Success"'
elif [[ "$UNAME" == CYGWIN* || "$UNAME" == MINGW* ]] ; then
	echo "pushed to remote!"
fi
