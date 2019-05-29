#!/bin/sh

case "$1" in
	start|stop|reload|status)
		/usr/sbin/usb $1
		;;
	*)
		echo "Usage: S15configfs.sh [start|stop|status]"
		;;
esac
