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

The demo runs with Elastichsearch 5.6.3

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
```

drop and create demo db SQL snippet

```sql
DROP DATABASE `demo`;
CREATE SCHEMA `demo` DEFAULT CHARACTER SET utf8 ;
```

or the local mysql install


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

## demo-admin

```bash
java -jar target/demo-admin-1.5.8.RELEASE.jar
```

## demo-process

```bash
java -jar target/demo-process-1.5.8.RELEASE.jar
```

## demo-listener

```bash
java -jar target/demo-listener-1.5.8.RELEASE.jar
```

## Steps to prepare the demo

* Start MySQL
* Drop & create demo db
* Start Tomcat and open [idm](http://localhost:8079/flowable-idm/#/user-mgmt), [modeler](http://localhost:8079/flowable-modeler/#/processes) and [task](http://localhost:8079/flowable-task/workflow/#/tasks)
* Start RabbitMQ and open the RabbitMQ console and purge queue messages
* Start elasticsearch
* Start elasticsearch-head, open the elasticsearch-head webapp and delete existing indices
* Start Spark and open the Spark GUI
* Start the demo-admin app and open the [Spring Boot Admin console](http://localhost:8080)
* Start the rest of demo apps:
  * demo-process
  * demo-listener
  * demo-decision-analysis

## Steps to execute the demo

* Import Loan.zip
* Publish Loan App
* Start a process
  * Jose Luis
  * 5000
  * Rented
  * 23
  * Spanish
  * 25000
* The Guidande says "Young, so need further checks"
* Accept the loan request and Inform Acceptance
* Start Creating the demo data with 1000 processes. It takes more or less 5 minutes.



