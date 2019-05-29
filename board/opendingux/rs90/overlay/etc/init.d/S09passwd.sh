#!/bin/sh

[ -z "$1" ] || [ "x$1" = "xstart" ] || exit 0

if [ ! -f /usr/local/etc/shadow ]; then
	echo 'od:$6$.RtqZY0A$bEPkEnwOMHullNXxdmBb1dKZwiIG0Beul0K9YmTigjeuezJ3svSZYchfCi3JsvG.yKOMU0vj/zc0v0q8gHgkd.:::::::' > /usr/local/etc/shadow
	chmod 600 /usr/local/etc/shadow
fi
