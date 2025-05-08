#!/bin/bash

if [ $1 ]; then
	TARGET=$1
else
	TARGET=simple
fi

ROOTDIR=$(pwd)
SRCDIR=$ROOTDIR/demo/$TARGET
USER=$(whoami)

## make sudo to no password
sudo su - root -c "echo \"$USER ALL=(ALL) NOPASSWD: ALL\" > /etc/sudoers.d/autotest"

## set up auto-execute scripts at startup
mkdir -p ~/.config/autostart

echo "
[Desktop Entry]
Type=Application
Exec=$ROOTDIR/autotest.sh
Name=Autotest Script
Comment=Run after desktop
" > ~/.config/autostart/autotest.desktop

## update current directory
sed -i "s|^ROOTDIR=.*|ROOTDIR=$ROOTDIR|" $ROOTDIR/autotest.sh
sed -i "s|^ROOTDIR=.*|ROOTDIR=$ROOTDIR|" $SRCDIR/test.sh
sed -i "s|^SRCDIR=.*|SRCDIR=$SRCDIR|"    $SRCDIR/test.sh

rm -fr test.sh
ln -s $SRCDIR/test.sh .
