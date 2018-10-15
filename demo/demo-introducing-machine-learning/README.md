# Code for the Devoxx 2017 demo.

Following servers should be installed (all simply by unzipping and starting with defaults):

* RabbitMQ
* Elasticsearch
* Spark

* MySQL


The talk is available [in Youtube](https://youtu.be/i8dYR0LdpHg).


## RabbitMQ

```bash
ulimit -S -n 4096 && /usr/local/sbin/rabbitmq-server
```

RabbitMQ management app: http://localhost:15672

Credentials for the rabbitmq-server guest:guest



## elasticsearch

```bash
elasticsearch
```

### elasticsearch-head app

To enable CORS in ES add this lines to config/elasticsearch.yml
http.cors.allow-origin: "http://localhost:9100"
http.cors.enabled: true
http.cors.allow-headers : X-Requested-With,X-Auth-Token,Content-Type,Content-Length,Authorization
http.cors.allow-credentials: true


```bash
npm run start
```

Elastisearch-head head app http://localhost:9100/

## MySQL

Default configuration for the JDBC URL jdbc:mysql://localhost/demo?useSSL=false

Default credentials flowable:flowable

Use the docker-compose.yml from flowable-mysql

```bash
MYSQL_DATABASE=demo docker-compose up
````


## Spark

```bash
sbin/start-master.sh --webui-port 4040
```

Open the Spark UI

```bash
open http://$(scutil --get LocalHostName).local:4040
```

## The IDM app

```bash
cd /Users/jorge/src/flowable-engine/modules/flowable-ui-idm/flowable-ui-idm-app

MAVEN_OPTS="$MAVEN_OPTS -noverify -Xms512m -Xmx1024m -XX:MaxPermSize=512m -Xdebug -Djava.compiler=NONE -Xrunjdwp:transport=dt_socket,address=8002,server=y,suspend=n" && mvn clean tomcat7:run -Ddatasource.url=jdbc:mysql://127.0.0.1:3306/demo?characterEncoding=UTF-8 -Pmysql

open http://localhost:8080/flowable-idm
```

## The modeler app

```bash
cd /Users/jorge/src/flowable-engine/modules/flowable-ui-modeler/flowable-ui-modeler-app

MAVEN_OPTS="$MAVEN_OPTS -noverify -Xms512m -Xmx1024m -XX:MaxPermSize=512m -Xdebug -Djava.compiler=NONE -Xrunjdwp:transport=dt_socket,address=8001,server=y,suspend=n" && mvn clean tomcat7:run -Pmysql -Ddeployment.api.url=http://localhost:9999/flowable-task/process-api -Ddatasource.url=jdbc:mysql://127.0.0.1:3306/demo?characterEncoding=UTF-8

open http://localhost:8888/flowable-modeler/#/processes
```

## Steps to reset the demo

//TODO


## Steps to execute the demo

Start MySQL

Start RabbitMQ and open the RabbitMQ console

Start Spark

Start Idm

Start modeler

Start the demo-admin app

Open the Spring Boot Admin console in http://localhost:8080

Start the demo-process app. The demo-process app appears in the Admin console
