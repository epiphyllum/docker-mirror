FROM ubuntu:14.04
MAINTAINER hary <94093146@qq.com>

# 安装nginx, apt-mirror
# RUN echo "192.168.16.136  mirror.tfs.com" >> /etc/hosts  && apt-get install -y nginx apt-mirror
RUN apt-get update \
 && apt-get install -y apache2 apt-mirror

# 配置文件
ADD assets/mirror.list /etc/apt/mirror.list
ADD assets/000-default.conf /etc/apache2/sites-available/
ADD assets/setup  /setup
ADD assets/start  /start

RUN crontab /setup/crontab \
 && mkdir -p /var/lock/apache2 

# 挂载
VOLUME [ "/var/www/html" ]
VOLUME [ "/var/log/apache2" ]

EXPOSE 80

CMD [ "/start" ]

