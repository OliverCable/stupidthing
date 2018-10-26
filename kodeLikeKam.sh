#!/bin/bash

echo "<html>" >> kam.html

COUNTER=0
while [ $COUNTER -lt $1 ];
do
  SPACES=$(shuf -i 1-10 -n 1)
  SPACE_STRING=""
  SPACE_COUNTER=0
  while [ $SPACE_COUNTER -lt $SPACES ];
  do
    SPACE=" "
    SPACE_COUNTER=$((SPACE_COUNTER+1))
    SPACE_STRING=$SPACE_STRING$SPACE
  done
  classname=$(date +%s | sha256sum | base64 | head -c 32 ; echo)
  echo "$SPACE_STRING<div class=\"$classname\">" >> kam.html
  echo "$SPACE_STRING</div>" >> kam.html
  sleep 1
  COUNTER=$((COUNTER+1))
done

echo "</html>" >> kam.html
