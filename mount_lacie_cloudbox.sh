#!/bin/csh

set USERNAME = $USER

if ( $1 != "" ) set USERNAME = $1

set NAS          = "lacie-cloudbox.local"
set SERVICE      = "LaCie-CloudBox"
set PASSWORD     = `security find-generic-password -wa $USERNAME -s $SERVICE`
set MOUNT_FOLDER = /private/tmp/${SERVICE}_$USERNAME
set AFP_URL      = afp://${USERNAME}:$PASSWORD@$NAS/$USERNAME

# Remove the mounting directory, if exists
if ( ! -d $MOUNT_FOLDER ) mkdir $MOUNT_FOLDER

if ( ! { ( mount | grep -q "on $MOUNT_FOLDER" ) } ) then
	if ( ! { mount_afp -o nobrowse $AFP_URL $MOUNT_FOLDER } ) exit ( $? )
endif
