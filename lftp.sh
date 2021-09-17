#!/bin/bash
####
#Author: Luca Santirocchi
#Version: 1

###
This script use Ftp over http connection for downloading file of the day before, on remote Ftp server that allow only ftp protocol

DATE=$(date +"%Y%m%d")
YESTERDAY=$(date --date="yesterday" +"%Y%m%d")
PROTOCOL="ftp"
URL="XXXXXXX"
LOCALDIR="XXXXXXXX"
REMOTEDIR="XXXXXXXXX"
USER="XXXXXX"
PASS="XXXXXXXX"
FILE="$YESTERDAY"MGPLiquidita.xml
LOG="/tmp/lftp.log"

cd $LOCALDIR

###remove old file
#rm -rf /tmp/$FILE

lftp $URL <<EOF
    user $USER "$PASS"
    cd $REMOTEDIR
    get $FILE

EOF

#set ftp over http
#    set ftp:proxy http://user:password@proxy:port
