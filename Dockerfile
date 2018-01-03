FROM        quay.io/spivegin/openjdk
MAINTAINER  SpivEgin spivegin@trhhosting.com
ENV         SERVER_VERSION 1.3.11
ENV         URL https://searchcode.com/static/searchcode-server-community.tar.gz
RUN         apt-get update && apt-get install -y wget && \
                wget -O /tmp/searchcode-server-community.tar.gz ${URL} && \
                cd /tmp && tar zxvf /tmp/searchcode-server-community.tar.gz && \
                rm -rf /srv && mv searchcode-server-community/release /srv && \
                rm -f /tmp/searchcode-server-community.tar.gz
WORKDIR     /srv
CMD         ["sh", "searchcode-server.sh"]
EXPOSE      8080/tcp
