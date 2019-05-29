#!/bin/sh

do_umount()
{
	MOUNTPOINT="`grep -m1 $MDEV /proc/mounts |cut -d' ' -f 2`"

	if [ "$MOUNTPOINT" ] ; then
		mount -o remount,rw /media

		umount -f $MOUNTPOINT
		rmdir $MOUNTPOINT

		mount -o remount,ro /media
	fi
}

do_mount()
{
	MOUNT_NAME="`/usr/sbin/blkid_label $MDEV`"
	[ -z "$MOUNT_NAME" ] && MOUNT_NAME="`basename $MDEV`"

	MOUNT_OPTS=defaults
	MOUNT_FS="`/usr/sbin/blkid_fs $MDEV`"
	[ "$MOUNT_FS" = "vfat" ] && MOUNT_OPTS="${MOUNT_OPTS},flush"

	mount -o remount,rw /media

	mkdir /media/$MOUNT_NAME
	mount $MDEV -t $MOUNT_FS -o $MOUNT_OPTS /media/$MOUNT_NAME

	mount -o remount,ro /media
}

do_remove()
{
	if [ "`grep root=$MDEV /proc/cmdline`" ] ; then
		echo "Mounted at /boot ; skipping"
		exit 1
	fi

	echo "Removing device $MDEV"
	do_umount
}

do_add()
{
	if [ "`grep $MDEV /proc/mounts`" ] ; then
		echo "Partition already mounted ; skipping"
		exit 1
	fi

	do_remove
	echo "Adding device $MDEV"
	do_mount
}

case $ACTION in
	remove)
		do_remove >> /var/log/automounter.log 2>&1
		;;
	add)
		do_add >> /var/log/automounter.log 2>&1
		;;
	*)
		echo "Unrecognized command $ACTION"
		;;
esac
