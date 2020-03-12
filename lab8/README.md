1. https://start.spring.io/ adresinden web'i seçerek proje oluştur.

2. Basit bir controller oluşturalım.
package com.example.demo;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
@RestController
public class SimpleController {
	@RequestMapping("/")
	private String init(String value) {
		return "hello " + value;
	}
}

3. Docker Hub'da maven ara (maven:ibmjava-alpine)

FROM maven:3.5.2-jdk-9  
COPY . /usr/src/app/
RUN mvn -f /usr/src/app/pom.xml clean package

EXPOSE 8080  
ENTRYPOINT ["java","-jar","/usr/src/app/target/demo-0.0.1-SNAPSHOT.jar"]

4. Build et
docker build . -t test

5. Çalıştır
docker run -p 8080:8080 test

6. Multi-stage build
FROM maven:3.5.2-jdk-9 AS build  
COPY . /usr/src/app/ 
RUN mvn -f /usr/src/app/pom.xml clean package

FROM openjdk:8u242-slim
COPY --from=build /usr/src/app/target/demo-0.0.1-SNAPSHOT.jar /usr/app/demo-0.0.1-SNAPSHOT.jar
EXPOSE 8080  
ENTRYPOINT ["java","-jar","/usr/app/demo-0.0.1-SNAPSHOT.jar"]
docker build . -t test2
docker run -p 8080:8080 test2

7. Java Debug Wire Protocol (JDWP)
ENTRYPOINT ["java","-jar","-Xdebug","-Xrunjdwp:server=y,transport=dt_socket,address=8000,suspend=n","/usr/app/demo-0.0.1-SNAPSHOT.jar"]
docker build . -t test3
docker run -p 8080:8080 -p 8000:8000 test3

8. pom.xml'e dependency ve build kısmında eklemeleri yap

				<dependency>
					<groupId>org.springframework.boot</groupId>
					<artifactId>spring-boot-devtools</artifactId>
					<scope>runtime</scope>
				</dependency>

				<configuration>
					<excludeDevtools>false</excludeDevtools>
				</configuration>

9. application.properties'e ekleme yap
spring.devtools.remote.secret=mysecret

10. Spring Remote
org.springframework.boot.devtools.RemoteSpringApplication
http://192.168.56.102:8080
