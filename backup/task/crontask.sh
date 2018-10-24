#!/bin/bash

cd /home/ubuntu

rm -f /home/ubuntu/lnmpbak/site/lnmpsite-backup.tar.gz
tar zcvf lnmpsite-backup.tar.gz ./lnmpsite/
chown ubuntu:ubuntu lnmpsite-backup.tar.gz
mv lnmpsite-backup.tar.gz /home/ubuntu/lnmpbak/site/
