#!/bin/bash
BUCKET=buckectname
RESTOREDDAYS="days to files availables"


for day in {01..31} ; do
    BPATH=/path$day/
    aws s3 ls s3://$BUCKET$BPATH --recursive | awk '{print $4}' | xargs -L 1 echo aws s3api restore-object --restore-request Days=$RESTOREDDAYS --bucket $BUCKET --key | sh

done
