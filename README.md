cassandra
=========

Docker container with Cassandra installed

cassandra.yaml tokens to replace:

- '''__SEEDS__''' - comma-delimited list of addresses of the cassandra seeds.
- '''__LISTEN_ADDRESS__''' - the address for cassandra to listen on (used as listen_address and rpc_address

Uploading the cassandra config template to etcd:

etcdctl set /cassandra/cassandra.yaml "`cat cassandra.yaml.template`"
etcdctl set /cassandra/start.sh "`cat start.sh``"