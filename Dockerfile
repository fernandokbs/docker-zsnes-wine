FROM solarkennedy/wine-x11-novnc-docker

RUN apt update && apt install zsnes -y

COPY download_gecko_and_mono.sh /root/download_gecko_and_mono.sh
RUN chmod +x /root/download_gecko_and_mono.sh \
    && /root/download_gecko_and_mono.sh "$(wine --version | sed -E 's/^wine-//')"

COPY ./mario.zip /root

ADD supervisord.conf /etc/supervisor/conf.d/supervisord.conf

CMD ["/usr/bin/supervisord"]