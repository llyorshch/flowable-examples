# Code for the Devoxx 2017 demo.

Following servers should be installed (all simply by unzipping and starting with defaults):

* RabbitMQ
* Elasticsearch
* Spark

* MySQL


The talk is available [in Youtube](https://youtu.be/i8dYR0LdpHg).


## RabbitMQ
ulimit -S -n 4096
/usr/local/sbin/rabbitmq-server 
guest:guest
http://localhost:15672


## elasticsearch
elasticsearch

### elasticsearch-head
cd ~/src/elasticsearch-head
npm run start
open http://localhost:9100/

## MySQL

jdbc:mysql://localhost/demo?useSSL=false", "flowable", "flowable"
