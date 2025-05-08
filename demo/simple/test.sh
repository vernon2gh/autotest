#!/bin/bash

ROOTDIR=.
SRCDIR=.
OUT=$ROOTDIR/out/$(uname -r)
mkdir -p $OUT

## This is a demo for auto test
echo > $OUT/$(date "+%Y-%m-%d-%H-%M-%S").txt
