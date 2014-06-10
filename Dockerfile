FROM ubuntu:14.04
MAINTAINER Luis Elizondo "lelizondo@gmail.com"

# Let's get serf
RUN apt-get update -q
RUN apt-get install -qy build-essential git supervisor unzip
ADD https://dl.bintray.com/mitchellh/serf/0.6.1_linux_amd64.zip serf.zip
RUN unzip serf.zip
RUN rm serf.zip
RUN mv serf /usr/bin/

ADD ./scripts/start-serf.sh /start-serf.sh
RUN chmod 755 /*.sh

ADD ./config/supervisord-serf.conf /etc/supervisor/conf.d/supervisord-serf.conf

EXPOSE 7946 7373

CMD ["/usr/bin/supervisord", "-n"]