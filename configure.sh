#!/bin/bash
LSB_RELEASE=lsb_release
DIR=cbird-usb-stick
LIB_D=$DIR/cbird/lib.linux64

# check if lsb_release exist
which $LSB_RELEASE &> /dev/null
if [ $? -ne 0 ]; then
	echo "!!! Installiere lsb_release zuerst"
	exit 1
fi

# check operationsystem

swt="swt.jar"
# Arch Linux
if [ "`$LSB_RELEASE -d | cut -f 2`" = "Arch Linux" ]; then
	echo "Arch Linux gefunden"
	# search for swt.jar
	pacman -Qs swt 1> /dev/null
	if [ $? -ne 0 ]; then
		echo "!!! SWT ist nicht installiert starte 'pacman -Ss swt' und wiederhole die Konfiguration"
		exit 1
	else
		swt=`readlink -f /usr/share/java/swt.jar`
	fi
fi

# copy swt.jar to cbird
if [ ! -f $swt ]; then
	echo "!!! Die SWT Bibliothek konnte nicht gefunden werden ($swt)"
	exit 1
fi
rm -rf $LIB_D/*
cp $swt $LIB_D/
if [ $? -ne 0 ]; then
	echo "!!! Ein Fehler ist während des Kopiervorganges der SWT Bibliothek auftreten, bitte melden Sie dies im GitHub Repository"
	exit 1
fi

# set execution permissions
chmod u+x $DIR/java/linux64/bin/java
chmod u+x $DIR/Start-cbird-Linux64.sh

echo "Konfiguration erfolgreich"
