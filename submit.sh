#!/bin/bash

# Example usage:
# ./submit.sh target/spark-intro-1.0-SNAPSHOT-jar-with-dependencies.jar -Dspark.master=local SimpleApp

JAR_FILE=$1
REMINDER=${@:2}

source /etc/spark/conf/spark-env.sh

SPARK_HOME=/usr/lib/spark; export SPARK_HOME
HADOOP_HOME=/usr/lib/hadoop; export HADOOP_HOME

# system jars:
CLASSPATH=/etc/hadoop/conf
CLASSPATH=$CLASSPATH:$HADOOP_HOME/*:$HADOOP_HOME/lib/*
CLASSPATH=$CLASSPATH:$HADOOP_HOME/../hadoop-mapreduce/*:$HADOOP_HOME/../hadoop-mapreduce/lib/*
CLASSPATH=$CLASSPATH:$HADOOP_HOME/../hadoop-yarn/*:$HADOOP_HOME/../hadoop-yarn/lib/*
CLASSPATH=$CLASSPATH:$HADOOP_HOME/../hadoop-hdfs/*:$HADOOP_HOME/../hadoop-hdfs/lib/*
CLASSPATH=$CLASSPATH:$SPARK_HOME/assembly/lib/*

# app jar:
CLASSPATH=$CLASSPATH:"$JAR_FILE"
CONFIG_OPTS="-Dspark.jars=$JAR_FILE"
java -cp $CLASSPATH $CONFIG_OPTS $REMINDER
