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
	swt=`readlink -f /usr/share/java/swt.jar`
	if [ ! -f $swt ]; then
		echo "!!! SWT ist nicht installiert starte 'pacman -Ss swt' und wiederhole die Konfiguration"
		exit 1
	fi
# Ubuntu/Debian
elif [ "`$LSB_RELEASE -d | cut -f 2`" = "Ubuntu 15.10" ] || [ "`$LSB_RELEASE -d | cut -f 2`" = "Debian GNU/Linux 8.4 (jessie)" ] || [ "`$LSB_RELEASE -d | cut -f 2`" = "Ubuntu 14.04.4 LTS" ]; then
	echo "Ubuntu/Debian gefunden"
	# search for swt.jar
	swt=`readlink -f /usr/share/java/swt.jar`
	if [ ! -f $swt ]; then
		echo "!!! SWT ist nicht installiert starte 'apt-get install libswt-gtk-3-java libswt-cairo-gtk-3-jni' und wiederhole die Konfiguration"
		exit 1
	fi
else
	echo "!!! Distribution nicht gefunden, bitte erstelle einen Eintrag im GitHub Repository"
	exit 1
fi

# copy swt.jar to cbird
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
