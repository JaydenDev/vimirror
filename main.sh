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

RAND=$RANDOM
cp -r /etc/pacman.d/mirrorlist /tmp/$RAND

if ! [ -x "$(command -v vim)" ]; then
  echo 'vim must be installed and in path!' >&2
  exit 1
fi

cp -r /etc/pacman.d/mirrorlist /tmp/mirrorlist.backup
vim /tmp/$RAND
cat /tmp/$RAND > /etc/pacman.d/mirrorlist
timeout 30 pacman -Syy || echo "Mirror is too slow, or you aren't connected to WiFi. You should pick better mirrors!"
echo "The mirrors work!"
while true; do
read -p "Do you want to write your changes? [y/n] " yn
case $yn in
    [Yy]* ) exit 0;;
    [Nn]* ) rm /etc/pacman.d/mirrorlist; mv /tmp/mirrorlist.backup /etc/pacman.d/mirrorlist; break;;
    * ) echo "Please answer yes or no.";;
esac
done
