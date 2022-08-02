FROM openjdk:11
COPY target/demo-0.0.1-SNAPSHOT.jar /data/demo-0.0.1-SNAPSHOT.jar
WORKDIR /data
CMD ["java", "-jar", "demo-0.0.1-SNAPSHOT.jar"]