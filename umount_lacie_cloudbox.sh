#!/bin/csh

set USERNAME = $USER

# Username passed as a parameter
if ( $1 != "" ) set USERNAME = $1

set SERVICE = "LaCie-CloudBox"
set MOUNT_FOLDER = /private/tmp/${SERVICE}_${USERNAME}

if ( `mount | grep -c "on ${MOUNT_FOLDER}"` == 1 ) then
	umount $MOUNT_FOLDER
endif

if ( -d $MOUNT_FOLDER ) rmdir $MOUNT_FOLDER