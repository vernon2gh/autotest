#!/bin/bash

DIR=$(pwd)
USER=$(whoami)

## make sudo to no password
sudo su - root -c "echo \"$USER ALL=(ALL) NOPASSWD: ALL\" > /etc/sudoers.d/autotest"

## set up auto-execute scripts at startup
mkdir -p ~/.config/autostart

echo "
[Desktop Entry]
Type=Application
Exec=$DIR/autotest.sh
Name=Autotest Script
Comment=Run after desktop
" > ~/.config/autostart/autotest.desktop

## update current directory
sed -i "s|^DIR=.*|DIR=$DIR|" $DIR/autotest.sh
sed -i "s|^DIR=.*|DIR=$DIR|" $DIR/test.sh
