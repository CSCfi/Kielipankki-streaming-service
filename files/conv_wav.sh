#!/bin/bash

# expects list of wav files, one per line in stdin.
# creates 3 processes at the same time, saturating the cpu.


FFMPEG=ffmpeg

function convert() {
  FILENAME=$1
  BASE=`echo ${FILENAME%.*}`
  echo "Converting: $FILENAME"
  rm -f ${BASE}_tmp.m4a
  if [ ${BASE}.m4a -ot $BASE.wav ]; then
    $FFMPEG -n -i $BASE.wav  ${BASE}_tmp.m4a 2> /dev/null
    mv ${BASE}_tmp.m4a  ${BASE}.m4a
  fi
}

while read line; do
  convert $line &
  sleep 1
  while [ $(ps -C ffmpeg --no-heading | wc -l) -gt 2 ]; do
    sleep 1;
  done;
done;


