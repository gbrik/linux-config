#!/bin/sh

while true
do
    sleep 5m
    LIGHT=$(xbacklight -get)
    xbacklight -set 0
    sleep 15
    xbacklight -set $LIGHT
done
