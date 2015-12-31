FROM lifei/baseimage
RUN apt-get update
RUN apt-get -y install git nginx-full php5-fpm curl
ADD https://s3.amazonaws.com/gitlist/gitlist-master.tar.gz /var/www/
RUN tar zxf /var/www/gitlist-master.tar.gz -C /var/www/
WORKDIR /var/www/gitlist/
RUN mkdir cache; chmod 777 cache
ADD config.ini /var/www/gitlist/
ADD nginx.conf /etc/
ADD nginx-run /etc/service/nginx/run
ADD php5-fpm-run /etc/service/php5-fpm/run
RUN chmod a+x /etc/service/php5-fpm/run /etc/service/nginx/run
RUN rm -rf /etc/service/cron /etc/service/sshd

VOLUME /repos
