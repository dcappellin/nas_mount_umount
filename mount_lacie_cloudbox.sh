#! /bin/csh

set NAS       = "lacie-cloudbox.local"
set SERVICE   = "LaCie-CloudBox"
set PASSWORD  = `security find-generic-password -wa $USER -s $SERVICE`

if (! -d /private/tmp/${SERVICE}) mkdir /private/tmp/${SERVICE}
mount_afp -o nobrowse afp://${USER}:${PASSWORD}@${NAS}/denis /private/tmp/${SERVICE}
