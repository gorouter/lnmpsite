#!/bin/bash

[[ -f /home/site/backup/site/lnmpsite-backup.tar.gz ]] && rm -f /home/site/backup/site/lnmpsite-backup.tar.gz
tar zcvf /home/site/backup/site/lnmpsite-backup.tar.gz /home/site/
chown 1000:1000 /home/site/backup/site/lnmpsite-backup.tar.gz

