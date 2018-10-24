#!/bin/bash

cd /usr/bin
abclist=$(ls /tmp/backup)

Secretid
Secretkey
Cnregion
Bucketna

for file in $abclist ; do

  python cosuploader.py /tmp/backup/$file $secretid $secretkey $cnregion $bucketna

done
