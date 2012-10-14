#!/bin/bash

DATABASE=crowdblog
TIMESTAMP=`date +"%Y%m%d-%H%M%S"`
FILENAME=$TIMESTAMP.sql

echo "Capture the database"
bundle exec heroku pgbackups:capture

echo "Download the backup"
wget -O $FILENAME `bundle exec heroku pgbackups:url`

echo "Restore the database"
pg_restore --verbose --clean --no-acl --no-owner -h localhost -d $DATABASE $FILENAME

echo "Done"
