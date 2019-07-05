#!/bin/sh

DIR=`uuidgen |cut -f 2 -d '-'`
mkdir -p $DIR

UUID=`uuidgen`

dd if=/dev/urandom of=$DIR/$UUID.rando bs=1M count=10 2> /dev/null


