#! /bin/csh

set SERVICE = "LaCie-CloudBox"

umount /private/tmp/${SERVICE}
if (! -d /private/tmp/${SERVICE}) rmdir /private/tmp/${SERVICE}
