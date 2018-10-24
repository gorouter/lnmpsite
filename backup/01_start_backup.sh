#!/bin/bash

rm -f /etc/service/sshd/down
/etc/my_init.d/00_regen_ssh_host_keys.sh
touch /etc/service/sshd/down
  
# Setup SSH key
if [ "x$SSH_AUTHORIZED_KEYS" != "x" ]; then

  # Default 22
  if [ "x$SSH_PORT" != "x" ]; then
    sed -i "/^Port/c\Port=$SSH_PORT" /etc/ssh/sshd_config
  fi

  mkdir ~/.ssh
  echo "$SSH_AUTHORIZED_KEYS" | sed 's/\\n/\n/g' > ~/.ssh/authorized_keys
  chmod 400 ~/.ssh/authorized_keys
fi

#更新信息
if [ "x$secret_id" != "x" ]; then
  sed -i "/^Secretid/c\secretid=$secret_id" /usr/bin/backup.sh
fi
if [ "x$secret_key" != "x" ]; then
  sed -i "/^Secretkey/c\secretkey=$secret_key" /usr/bin/backup.sh
fi
if [ "x$region" != "x" ]; then
  sed -i "/^Cnregion/c\cnregion=$region" /usr/bin/backup.sh
fi
if [ "x$bucketname" != "x" ]; then
  sed -i "/^Bucketna/c\bucketna=$bucketname" /usr/bin/backup.sh
fi

#每隔5分钟执行 (用于调试)
if [ "x$BAK_DEBUG" != "x" ]; then
  echo "*/5 *   * * *   root    nohup /usr/bin/backup.sh > /tmp/backup.log 2>&1 &" >> /etc/crontab
fi

#每小时过15分钟执行:
#1  0    * * *   root    /home/ubuntu/lnmpbak/task/crontask.sh > /var/log/crontask.log 2>&1 &
if [ "x$BAK_DEBUG" = "x" ]; then
  echo "15 *    * * *   root    nohup /usr/bin/backup.sh > /tmp/backup.log 2>&1 &" >> /etc/crontab
fi
service cron restart

# Start ssh service
exec /usr/sbin/sshd -D -e -u 0

