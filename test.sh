#!/bin/bash

DIR=.
OUT=$DIR/out
mkdir -p $OUT

## This is a demo for auto test
date     >> $OUT/tmp.txt
uname -r >> $OUT/tmp.txt
