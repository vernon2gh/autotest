#!/bin/bash

ROOTDIR=.
SRCDIR=.
OUT=$ROOTDIR/out/$(uname -r)
mkdir -p $OUT

UNIXBENCH=.
rm -fr $UNIXBENCH/results

cd $UNIXBENCH
./Run $@
sleep 60
./Run $@
cd -

mv $UNIXBENCH/results/* $OUT
