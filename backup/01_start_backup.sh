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
if [ "x$secret_id" != "x" && "x$secret_id" != "xnone" ]; then
  sed -i "/^Secretid/c\secretid=$secret_id" /usr/bin/backup.sh
else
  sed -i "/^Secretid/c\secretid=none" /usr/bin/backup.sh
fi
if [ "x$secret_key" != "x" && "x$secret_key" != "xnone" ]; then
  sed -i "/^Secretkey/c\secretkey=$secret_key" /usr/bin/backup.sh
else
  sed -i "/^Secretkey/c\secretkey=none" /usr/bin/backup.sh
fi
if [ "x$region" != "x" && "x$region" != "xnone" ]; then
  sed -i "/^Cnregion/c\cnregion=$region" /usr/bin/backup.sh
else
  sed -i "/^Cnregion/c\cnregion=none" /usr/bin/backup.sh
fi
if [ "x$bucketname" != "x" && "x$bucketname" != "xnone" ]; then
  sed -i "/^Bucketna/c\bucketna=$bucketname" /usr/bin/backup.sh
else
  sed -i "/^Bucketna/c\bucketna=none" /usr/bin/backup.sh
fi

#每隔9分钟执行整站压缩成包, 每隔15分钟尝试执行上传备份: (用于调试)
if [ "x$BAK_DEBUG" != "x" ]; then
  echo "*/9  *   * * *   root    nohup /home/crontask/crontask.sh > /var/log/crontask.log 2>&1 &" >> /etc/crontab
  echo "*/15 *   * * *   root    nohup /usr/bin/backup.sh > /var/log/backup.log 2>&1 &" >> /etc/crontab
fi

#每天0点过1分钟执行整站压缩成包, 每小时过15分钟尝试执行上传备份:
if [ "x$BAK_DEBUG" = "x" ]; then
  echo "1  0    * * *   root    nohup /home/crontask/crontask.sh > /var/log/crontask.log 2>&1 &" >> /etc/crontab
  echo "15 *    * * *   root    nohup /usr/bin/backup.sh > /var/log/backup.log 2>&1 &" >> /etc/crontab
fi
service cron restart

# Start ssh service
exec /usr/sbin/sshd -D -e -u 0

