#!/bin/sh

[ -z "$1" ] || [ "x$1" = "xstart" ] || exit 0

# Defaults.
. /etc/swap.conf

# User overrides.
[ -r /usr/local/etc/swap.conf ] && . /usr/local/etc/swap.conf

# Swap to compressed RAM.
size=$(( $SWAP_ZRAM_SIZE_MB * 1024 * 1024 ))
if [ $size -ne 0 ]; then
	if [ -b $SWAP_ZRAM_FILE ]; then
		device=`/usr/bin/basename $SWAP_ZRAM_FILE`
		echo $size > /sys/devices/virtual/block/$device/disksize
		/sbin/mkswap $SWAP_ZRAM_FILE
		/sbin/swapon -p$SWAP_ZRAM_PRIORITY $SWAP_ZRAM_FILE
	fi
fi

# Swap to file.
size=$(( $SWAP_FILE_SIZE_MB * 1024 * 1024 ))
if [ $size -ne 0 ]; then
	/bin/dd if=/dev/zero of=$SWAP_FILE bs=1 count=0 seek=$size
	/sbin/mkswap $SWAP_FILE
	/sbin/swapon -p$SWAP_FILE_PRIORITY $SWAP_FILE
fi

echo $SWAPPINESS > /proc/sys/vm/swappiness
