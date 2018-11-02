#!/bin/bash

java -DsparkHome=$HOME/Applications/spark-2.3.2-bin-hadoop2.7 -DappResource=$HOME/src/flowable-examples/demo/demo-introducing-machine-learning/demo-spark/target/demo-spark-0.0.1-SNAPSHOT-jar-with-dependencies.jar  -jar target/demo-decision-analysis-1.5.8.RELEASE.jar
