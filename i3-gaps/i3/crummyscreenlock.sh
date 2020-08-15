#!/bin/sh

SCRIPTPATH=$(dirname $(readlink -f "$0"))
SCRIPTNAME=verylongscriptname.sh

LIGHT=$(xbacklight -get)
$SCRIPTPATH/$SCRIPTNAME &
sleep 15
pkill -f $SCRIPTNAME
xbacklight -set $LIGHT
