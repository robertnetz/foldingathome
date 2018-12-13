FROM debian:stretch-slim

ENV USERNAME=Anonymous
ENV TEAM=0
ENV POWER=medium
ENV DOWNLOAD=https://download.foldingathome.org/releases/public/release/fahclient/debian-testing-64bit/v7.4/fahclient_7.4.4_amd64.deb

RUN apt-get update
RUN apt-get -y install bzip2 wget

RUN mkdir -p /home/root/

ADD config.xml /etc/fahclient/
RUN cp /etc/fahclient/config.xml /etc/fahclient/config_template.xml
RUN sed -i -e "s/{{USERNAME}}/Anonymous/;s/{{TEAM}}/0/;s/{{POWER}}/medium/" /etc/fahclient/config.xml
RUN cp /etc/fahclient/config.xml /etc/fahclient/config_install.xml

RUN wget -O /home/root/fahclient.deb ${DOWNLOAD}
RUN dpkg -i /home/root/fahclient.deb

RUN chown fahclient:root /etc/fahclient/config.xml

ADD entrypoint.sh /home/root/entrypoint.sh
RUN chmod 751 /home/root/entrypoint.sh
RUN chown fahclient:root /etc/fahclient/config.xml

ENTRYPOINT [ "/home/root/entrypoint.sh" ]