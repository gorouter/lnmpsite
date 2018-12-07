FROM wisbyme/ubuntu16

MAINTAINER ljjun <wisbyme@gmail.com>

COPY 01_start_backup.sh /etc/my_init.d/01_start_backup.sh
COPY backup.sh /usr/bin/backup.sh
COPY crontask.sh /tmp/crontask.sh
COPY gett.zip /tmp/gett.zip
COPY cosuploader.py /usr/bin/cosuploader.py

#ENV GETT_TOKEN
#ENV GETT_SHARE_NAME

#ENV secret_id 
#ENV secret_key
#ENV region
#ENV bucketname
#ENV BAK_DEBUG 1

RUN apt-get update -y \
 && apt-get install -y --no-install-recommends \
    net-tools wget virt-what iputils-ping iproute2 unzip \
# && apt-get purge -y python.* \
 && apt-get install -y python2.7 python2.7-dev \
 && ln -s /usr/bin/python2.7 /usr/bin/python \
 && apt-get install -y python-pip \
 && cd /tmp \
 && unzip ./gett.zip && mv ./gett /usr/local/ \
 && ln -s /usr/local/gett/uploader.py /usr/bin/uploader.py \
 && wget https://pypi.python.org/packages/20/d7/04a0b689d3035143e2ff288f4b9ee4bf6ed80585cc121c90bfd85a1a8c2e/setuptools-39.0.1-py2.py3-none-any.whl#md5=ca299c7acd13a72e1171a3697f2b99bc \
 && pip install /tmp/setuptools-39.0.1-py2.py3-none-any.whl \
 && apt-get install -y python-pip python-setuptools \
 && pip install setuptools --upgrade \
 && pip install wheel \
 && rm -f /etc/my_init.d/._01_start_backup.sh \
 && chmod +x /etc/my_init.d/01_start_backup.sh \
 && chmod +x /usr/bin/backup.sh \
# && chmod +x /usr/bin/cosuploader.py \
 && mkdir -p /home/backup /home/crontask /home/site \
 && mv /tmp/crontask.sh /home/crontask/crontask.sh \
 && chmod +x /home/crontask/crontask.sh \
 && pip install bypy \
 && pip install -U cos-python-sdk-v5 \
 && rm -f /tmp/setuptools-39.0.1-py2.py3-none-any.whl \
 && apt-get autoremove -y \
 && apt-get autoclean -y \
 && rm -rf /var/cache/apt/* /var/lib/apt/lists/* /tmp/* /var/tmp/* \
 && /sbin/install_clean

WORKDIR /home/backup
