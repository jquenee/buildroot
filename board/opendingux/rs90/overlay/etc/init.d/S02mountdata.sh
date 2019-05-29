#!/bin/sh

[ -z "$1" ] || [ "x$1" = "xstart" ] || exit 0

mkdir -p /media/data
mount --bind /boot /media/data
