#!/bin/bash

DIR=.
PREFIX="Advanced options for Ubuntu>Ubuntu, with Linux"

function updatekernel() {
	KERNEL=$(head -n 1 $DIR/kernelversion)
	DEFAULT="$PREFIX $KERNEL"

	if [ ! $KERNEL ]; then
		echo > $DIR/FINISHED
		exit
	fi

	if [ $(uname -r) != $KERNEL ]; then
		sudo grub-reboot "$DEFAULT"
		sudo reboot
	else
		sed -i 1d $DIR/kernelversion
	fi
}

updatekernel
sleep 5

$DIR/test.sh

updatekernel
