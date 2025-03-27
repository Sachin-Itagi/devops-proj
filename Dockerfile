# write your Docker file code here
FROM maven:3.9.9-eclipse-temurin-17 as builder

WORKDIR /app

COPY ./pom.xml /app/
COPY ./src /app/src/

RUN mvn clean install 

FROM  openjdk:17-slim

WORKDIR /app

COPY --from=builder /app/target/ToDo-Application-0.0.1-SNAPSHOT.jar /app/ToDo-Application-0.0.1-SNAPSHOT.jar

EXPOSE 8081

ENTRYPOINT ["java", "-jar", "ToDo-Application-0.0.1-SNAPSHOT.jar"]