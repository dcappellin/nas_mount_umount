#! /bin/csh

set USERNAME = $USER

# Username passed as a parameter
if ($1 != "") set USERNAME = $1

set SERVICE = "LaCie-CloudBox"
set MOUNT_FOLDER = ${SERVICE}_${USERNAME}

umount /private/tmp/${MOUNT_FOLDER}
if (! -d /private/tmp/${MOUNT_FOLDER}) rmdir /private/tmp/${MOUNT_FOLDER}
