#/bin/bash
sed -e s"/^zookeeper.connect=.*\$/zookeeper.connect=${ZOOKEEPER_HOST}:${ZOOKEEPER_PORT}/" \
    config/server.properties.orig > config/server.properties
echo 'advertised.listeners=EXTERNAL://localhost:29092,INTERNAL://kafka:9092' >> config/server.properties
echo 'listener.security.protocol.map=EXTERNAL:PLAINTEXT,INTERNAL:PLAINTEXT,PLAINTEXT:PLAINTEXT' >> config/server.properties
echo 'inter.broker.listener.name=INTERNAL' >> config/server.properties
bin/kafka-server-start.sh config/server.properties