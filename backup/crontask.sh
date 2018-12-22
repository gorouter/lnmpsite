#!/bin/bash

#按自定义任务创建备份文档
[[ -f /home/backup/lnmpsite-backup.tar.gz ]] && rm -f /home/backup/lnmpsite-backup.tar.gz
tar zcvf /home/backup/lnmpsite-backup.tar.gz /home/site/
chown 1000:1000 /home/backup/lnmpsite-backup.tar.gz

