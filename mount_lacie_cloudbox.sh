#! /bin/csh

set USERNAME = $USER

# Username passed as a parameter
if ($1 != "") set USERNAME = $1

set NAS          = "lacie-cloudbox.local"
set SERVICE      = "LaCie-CloudBox"
set PASSWORD     = `security find-generic-password -wa $USERNAME -s $SERVICE`
set MOUNT_FOLDER = ${SERVICE}_${USERNAME}

# Remove the mounting directory, if exists
if (! -d /private/tmp/${MOUNT_FOLDER}) mkdir /private/tmp/${MOUNT_FOLDER}

mount_afp -o nobrowse afp://${USERNAME}:${PASSWORD}@${NAS}/${USERNAME} /private/tmp/${MOUNT_FOLDER}
