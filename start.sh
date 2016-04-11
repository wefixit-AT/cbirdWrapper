#!/bin/bash
FULLSCREEN=true
FULLSCREEN_TIMEOUT=15
BASE=/opt/cbirdWrapper.git

$BASE/cbird-usb-stick/Start-cbird-Linux64.sh

if [ $FULLSCREEN = true ]; then
	sleep $FULLSCREEN_TIMEOUT
	wmid=`wmctrl -l | grep '.*cbird.*Kassa.*' | cut -f 1 -d " "`
	wmctrl -ir $wmid -b add,maximized_vert,maximized_horz
fi
