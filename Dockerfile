FROM circleci/node:8.6.0

RUN echo "deb http://www.apache.org/dist/cassandra/debian 311x main" | sudo tee -a /etc/apt/sources.list.d/cassandra.sources.list \
    && echo "deb http://http.debian.net/debian jessie-backports main" | sudo tee -a /etc/apt/sources.list \
    && sudo curl https://www.apache.org/dist/cassandra/KEYS | sudo apt-key add - \
    && sudo apt-key adv --keyserver pool.sks-keyservers.net --recv-key A278B781FE4B2BDA \
    && sudo apt-get update \
    && sudo apt install -t jessie-backports openjdk-8-jre-headless ca-certificates-java cassandra -y

COPY cassandra /etc/init.d
COPY entrypoint.sh /usr/local/bin
RUN sudo chmod u+x /etc/init.d/cassandra /usr/local/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]
