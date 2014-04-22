#!/bin/sh

IP=`hostname --ip-address`
sed -i -e "s/__LISTEN_ADDRESS__/$IP/" /var/lib/cassandra/cassandra.yaml 
cp /var/lib/cassandra/cassandra.yaml /etc/cassandra
/usr/sbin/cassandra -f
