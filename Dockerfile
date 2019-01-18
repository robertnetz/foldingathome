FROM debian:stretch-slim

ENV USERNAME=Anonymous
ENV TEAM=0
ENV POWER=medium
ENV DOWNLOAD=https://download.foldingathome.org/releases/public/release/fahclient/debian-stable-64bit/v7.5/fahclient_7.5.1_amd64.deb

RUN apt-get update && apt-get -y install bzip2 wget

ADD config.xml /etc/fahclient/
RUN cp /etc/fahclient/config.xml /etc/fahclient/config_template.xml
RUN sed -i -e "s/{{USERNAME}}/Anonymous/;s/{{TEAM}}/0/;s/{{POWER}}/medium/" /etc/fahclient/config.xml
RUN cp /etc/fahclient/config.xml /etc/fahclient/config_install.xml

RUN mkdir -p /home/root/ && wget -O /home/root/fahclient.deb ${DOWNLOAD} && dpkg -i /home/root/fahclient.deb && rm /home/root/fahclient.deb

ADD entrypoint.sh /home/root/entrypoint.sh
RUN chmod 751 /home/root/entrypoint.sh && chown fahclient:root /etc/fahclient/config.xml

ENTRYPOINT [ "/home/root/entrypoint.sh" ]
