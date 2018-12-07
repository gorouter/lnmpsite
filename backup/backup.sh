#!/bin/bash

[[ -f /home/backup/readme.md ]] && rm -f /home/backup/readme.md
abclist=$(ls /home/backup)

Secretid
Secretkey
Cnregion
Bucketna

if [ "x${secretid}" != "x" || "x${secretid}" != "x" ]; then
  for file in $abclist ; do
    python /usr/bin/cosuploader.py /home/backup/$file $secretid $secretkey $cnregion $bucketna
  done
fi
