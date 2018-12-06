FROM stilliard/pure-ftpd:hardened

MAINTAINER ljjun <wisbyme@gmail.com>

COPY ftpadd /usr/local/bin/ftpadd
COPY pure-ftpd-dhparams.pem /etc/ssl/private/pure-ftpd-dhparams.pem
COPY pure-ftpd.pem /etc/ssl/private/pure-ftpd.pem

RUN apt-get update -y \
 && apt-get install -y --no-install-recommends vim \
 && chmod +x /usr/local/bin/ftpadd \
 && chown root:root -R /etc/ssl/private/ \
 && chmod 600 /etc/ssl/private/*.pem \
 && apt-get autoremove -y \
 && apt-get autoclean -y \
 && rm -rf /var/cache/apt/* \
 && rm -rf /var/lib/apt/lists/*

CMD /run.sh -c 16 -C 32 -l puredb:/etc/pure-ftpd/pureftpd.pdb -E -j -R -P $PUBLICHOST -p 30000:30032 

EXPOSE 20 21 30000-30032
