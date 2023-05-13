#!/bin/bash

echo "* Download updates and install additional packages ..."
apt-get update
apt-get install openjdk-17-jre -y
apt-get install telnet -y
apt-get install python -y
apt-get install python3-pip -y
pip install python-daemon
pip install kafka-python


echo "* Kafka installation ..."
wget https://archive.apache.org/dist/kafka/3.3.1/kafka_2.13-3.3.1.tgz
tar xzvf kafka_2.13-3.3.1.tgz
mv kafka_2.13-3.3.1 kafka

echo "* Zookeeper config and start ..."
cat /vagrant/kafka/zookeeper.properties > kafka/config/zookeeper.properties
mkdir /tmp/zookeeper
echo "1" > /tmp/zookeeper/myid
kafka/bin/zookeeper-server-start.sh -daemon kafka/config/zookeeper.properties

echo "* Kafka config and start ..."
cat /vagrant/kafka/server.properties > kafka/config/server.properties
kafka/bin/kafka-server-start.sh -daemon kafka/config/server.properties

echo "* Create topic ..."
kafka/bin/kafka-topics.sh --create --bootstrap-server localhost:9092 --replication-factor 1 --partitions 3 --topic homework

echo "* Start producer ..."
cp /vagrant/kafka/app/producer.py .
python3 producer.py

echo "* Start consumer ..."
cp /vagrant/kafka/app/consumer.py .
python3 consumer.py
