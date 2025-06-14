#!/bin/sh
[ -f /etc/xprofile ] && . /etc/xprofile
[ -f /etc/xprofile ] && . ~/.xprofile

librewolf &

exec dwm
