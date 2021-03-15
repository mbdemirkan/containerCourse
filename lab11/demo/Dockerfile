FROM maven:3.5.2-jdk-8 AS build  
COPY . /usr/src/app/ 
RUN mvn -f /usr/src/app/pom.xml clean package
FROM openjdk:8u242-slim
COPY --from=build /usr/src/app/target/demo-0.0.1-SNAPSHOT.jar /usr/app/demo-0.0.1-SNAPSHOT.jar
EXPOSE 8080  
ENTRYPOINT ["java","-jar","/usr/app/demo-0.0.1-SNAPSHOT.jar"]
ENTRYPOINT ["java","-jar","-Xdebug","-Xrunjdwp:server=y,transport=dt_socket,address=8000,suspend=n","/usr/app/demo-0.0.1-SNAPSHOT.jar"]