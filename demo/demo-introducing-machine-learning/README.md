# Code for the Devoxx 2017 demo.

Following servers should be installed (all simply by unzipping and starting with defaults):

* RabbitMQ
* Elasticsearch
* Spark

* MySQL


The talk is available [in Youtube](https://youtu.be/i8dYR0LdpHg).


## RabbitMQ

```bash
ulimit -S -n 4096
/usr/local/sbin/rabbitmq-server
```

RabbitMQ management app: http://localhost:15672

Credentials for the rabbitmq-server guest:guest



## elasticsearch

```bash
elasticsearch
```

### elasticsearch-head app

```bash
npm run start
```

Elastisearch-head head app http://localhost:9100/

## MySQL

Default configuration for the JDBC URL jdbc:mysql://localhost/demo?useSSL=false

Default credentials flowable:flowable
