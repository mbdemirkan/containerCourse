FROM openjdk:8
RUN mkdir /src
ADD HelloWorld.java /src/
RUN cd / && javac /src/HelloWorld.java
WORKDIR /src
ENTRYPOINT ["java", "HelloWorld"]
