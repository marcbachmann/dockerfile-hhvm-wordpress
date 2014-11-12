FROM jolicode/hhvm
MAINTAINER Marc Bachmann <marc.brookman@gmail.com>

RUN apt-get update -q && \
    apt-get install -y software-properties-common python-software-properties python-setuptools drush curl mysql-client unzip

RUN \
  add-apt-repository -y ppa:nginx/stable && \
  apt-get update && \
  apt-get install -y nginx && \
  rm -rf /var/lib/apt/lists/* && \
  chown -R www-data:www-data /var/lib/nginx

RUN /usr/bin/easy_install supervisor
RUN /usr/bin/easy_install supervisor-stdout

ADD ./nginx.conf /etc/nginx/nginx.conf
ADD ./config.hdf /etc/hhvm/config.hdf
ADD ./supervisord.conf /etc/supervisord.conf
ADD ./start.sh /start.sh

EXPOSE 80

RUN chmod +x /start.sh && \
    apt-get autoremove && \
    apt-get autoclean && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
