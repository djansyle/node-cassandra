FROM circleci/node:8.6.0

RUN echo "deb http://www.apache.org/dist/cassandra/debian 311x main" | tee -a /etc/apt/sources.list.d/cassandra.sources.list \
    && curl https://www.apache.org/dist/cassandra/KEYS | apt-key add - \
    && apt-key adv --keyserver pool.sks-keyservers.net --recv-key A278B781FE4B2BDA \
    && echo deb http://http.debian.net/debian jessie-backports main >> /etc/apt/sources.list \
    && apt-get update \
    && apt install -t jessie-backports openjdk-8-jre-headless ca-certificates-java cassandra -y

COPY cassandra /etc/init.d
RUN chmod u+x /etc/init.d/cassandra

