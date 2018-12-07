#!/bin/bash

[[ -f /home/lnmpsite/backup/site/lnmpsite-backup.tar.gz ]] && rm -f /home/lnmpsite/backup/site/lnmpsite-backup.tar.gz
tar zcvf /tmp/lnmpsite-backup.tar.gz /home/lnmpsite/
chown 1000:1000 lnmpsite-backup.tar.gz
mv /tmp/lnmpsite-backup.tar.gz /home/lnmpsite/backup/site/

