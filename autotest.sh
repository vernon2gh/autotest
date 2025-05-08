#!/bin/bash

ROOTDIR=.
PREFIX="Advanced options for Ubuntu>Ubuntu, with Linux"

function updatekernel() {
	KERNEL=$(head -n 1 $ROOTDIR/kernelversion)
	DEFAULT="$PREFIX $KERNEL"

	if [ ! $KERNEL ]; then
		echo > $ROOTDIR/FINISHED
		exit
	fi

	if [ $(uname -r) != $KERNEL ]; then
		sudo grub-reboot "$DEFAULT"
		sudo reboot
	else
		sed -i 1d $ROOTDIR/kernelversion
	fi
}

updatekernel
sleep 5

$ROOTDIR/test.sh

updatekernel
