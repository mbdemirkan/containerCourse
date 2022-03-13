FROM maven as build
COPY . /usr/src/app/
RUN mvn -f /usr/src/app/pom.xml clean package

FROM openjdk:11-jre-slim
COPY --from=build /usr/src/app/target/demo-0.0.1-SNAPSHOT.jar /usr/app/demo-0.0.1-SNAPSHOT.jar
EXPOSE 8080 8000
ENTRYPOINT ["java","-agentlib:jdwp=transport=dt_socket,server=y,address=*:8000,suspend=n","-jar","/usr/app/demo-0.0.1-SNAPSHOT.jar"]
