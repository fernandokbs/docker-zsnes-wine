FROM solarkennedy/wine-x11-novnc-docker

RUN apt update && apt install zsnes -y

COPY ./fceux.deb /root
COPY ./super.zip /root

RUN apt install /root/fceux.deb -y

ADD supervisord.conf /etc/supervisor/conf.d/supervisord.conf

CMD ["/usr/bin/supervisord"]