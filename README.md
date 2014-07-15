spark-intro
===========

This is a sample Spark app. To run, type that on your cluster:
  
    git clone https://github.com/CeON/spark-intro.git
    cd spark-intro  
    mvn clean compile assembly:single
    ./submit.sh target/spark-intro-1.0-SNAPSHOT-jar-with-dependencies.jar -Dspark.master=local SimpleApp

