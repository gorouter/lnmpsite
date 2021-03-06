#!/bin/bash

[[ -f /home/backup/readme.md ]] && rm -f /home/backup/readme.md
abclist=$(ls /home/backup)

Secretid
Secretkey
Cnregion
Bucketna

if [ "x${secretid}" != "x" ] && [ "x${secretid}" != "xnone" ]; then
  for file in $abclist ; do
    python /usr/bin/cosuploader.py /home/backup/$file $secretid $secretkey $cnregion $bucketna
  done
fi

Tcuserid

if [ "x${tcuserid}" != "x" ] && [ "x${tcuserid}" != "xnone" ]; then
  if [ -d /home/teradev ]; then
    cp -R /home/backup/* /home/teradev/
  fi
fi
