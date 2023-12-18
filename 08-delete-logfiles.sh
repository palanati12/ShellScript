#!/bin/bash

SOURCE_DIR="/tmp/shellscript.logs/"

if [! SOURCE_DIR ]
then
    echo -e " $R source directory: $SOURCE_DIR does not exists $N"
fi

FILES_TO_DEL=$(find $SOURCE_DIR -type f -mtime +14 -name "*.log")

while IFS = read -r line 
do 
  echo "deleting file:$line"
done  <<< $FILES_TO_DEL
