#!/bin/csh

set USERNAME = $USER

if ( $1 != "" ) set USERNAME = $1

set SERVICE = LaCie-CloudBox
set MOUNT_FOLDER = /private/tmp/${SERVICE}_${USERNAME}

if ( { ( mount | grep -q "on $MOUNT_FOLDER" ) } ) then
	if ( { diskutil unmount $MOUNT_FOLDER } ) then
		if ( -d $MOUNT_FOLDER ) rmdir $MOUNT_FOLDER
	else
		exit ( $? )
	endif
endif
