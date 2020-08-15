#!/bin/sh

if [ $1 != snap ]; then i3-msg move $@; exit 0; fi
shift

tree_info=$(i3-msg -t get_tree | jq '.. | select(.focused? == true) | (.floating | contains("on")), .rect.x, .rect.y, .rect.width, .rect.height')
floating=$(echo $tree_info | awk '{print $1}')

if ! $floating; then i3-msg move $@; exit 0; fi

ws_info=$(i3-msg -t get_workspaces | jq '.[] | select(.focused == true) | .rect.width, .rect.height')

screen_width=$(echo $ws_info | awk '{print $1}')
screen_height=$(echo $ws_info | awk '{print $2}')

x=$(echo $tree_info | awk '{print $2}')
y=$(echo $tree_info | awk '{print $3}')
window_width=$(echo $tree_info | awk '{print $4}')
window_height=$(echo $tree_info | awk '{print $5}')

case $1 in
    left)
        x=0
        ;;
    right)
        x=$(($screen_width - $window_width))
        ;;
    up)
        y=0
        ;;
    down)
        y=$(($screen_height - $window_height))
        ;;
    *)
        exit 1
esac

i3-msg move position $x px $y px

exit 0
