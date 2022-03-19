FROM ubuntu

ENV JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64

RUN apt-get update
RUN apt-get install -y openjdk-8-jdk 
RUN apt-get install -y maven
RUN apt-get install -f libpng16-16
RUN apt-get install -f libjasper1
RUN apt-get install -f libdc1394-22

WORKDIR /tpapp

RUN   mvn install:install-file -Dfile=./lib/opencv-3410.jar \
     -DgroupId=org.opencv  -DartifactId=opencv -Dversion=3.4.10 -Dpackaging=jar

RUN mvn package

EXPOSE 8080

CMD java -Djava.library.path=lib/ubuntuupperthan18/ -jar target/fatjar-0.0.1-SNAPSHOT.jar
