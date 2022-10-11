FROM amazoncorretto:17-alpine

ENV KAFKA_VERSION=3.3.1
ENV SCALA_VERSION=2.12
ENV ZOOKEEPER_HOST=zookeeper
ENV ZOOKEEPER_PORT=2181

WORKDIR /app
RUN apk update
RUN apk upgrade
RUN apk add wget bash
RUN wget https://downloads.apache.org/kafka/${KAFKA_VERSION}/kafka_${SCALA_VERSION}-${KAFKA_VERSION}.tgz
RUN tar xzf kafka_${SCALA_VERSION}-${KAFKA_VERSION}.tgz
RUN rm -f kafka_${SCALA_VERSION}-${KAFKA_VERSION}.tgz
RUN ln -sf kafka_${SCALA_VERSION}-${KAFKA_VERSION} kafka
RUN cp kafka/config/server.properties kafka/config/server.properties.orig
COPY entrypoint.sh /app/

WORKDIR /app/kafka
ENTRYPOINT [ "/bin/bash", "/app/entrypoint.sh" ]