#!/bin/bash
# JaydenDev, 2022, MIT License.
# vimirror, license provided in LICENSE file. Docs provided in README

if [[ $1 == '-v' ]];
then
	echo "vimirror, version 1.0.0"
fi

if [[ $1 == '-h' ]]
then
	echo "
vimirror
-------------------
-h, help
-v, version
	"
fi

if [ "$EUID" -ne 0 ];
then
	if [[ $1 == '-v' ]]
	then
		exit
	else
		if [[ $1 == '-h' ]]
		then
			exit
		fi
	fi
	echo "Please run as root!"
	exit
fi

echo "Thanks for using vimirror by JaydenDev!"
RAND=$RANDOM
cp -r /etc/pacman.d/mirrorlist /tmp/$RAND

if [ -z $EDITOR ];
then
	echo "EDITOR variable not set, falling back to default (vi)!"
    	EDITOR="vi"
fi	

$EDITOR /tmp/$RAND 2> /dev/null || echo "The selected editor is not installed or not in path!" && exit 1
cp -r /etc/pacman.d/mirrorlist /tmp/mirrorlist.backup
cat /tmp/$RAND > /etc/pacman.d/mirrorlist
pacman -Sy 2> /dev/null
if [ $? -eq 0 ];
then
    echo "The mirrors work!"
    while true; do
    read -p "Do you want to write your changes? If pacman ran too slowly, then you should pick a better mirror! [y/n]" yn
    case $yn in
        [Yy]* ) exit 0;;
        [Nn]* ) rm /etc/pacman.d/mirrorlist; mv /tmp/mirrorlist.backup /etc/pacman.d/mirrorlist; break;;
        * ) echo "Please answer yes or no.";;
    esac
	done
else
    echo "The mirrors are down or you aren't connected to WiFi."
    cat /tmp/mirrorlist.backup > /etc/pacman.d/mirrorlist
fi
