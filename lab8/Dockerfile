FROM openjdk:8
RUN mkdir /src
ADD HelloWorld.java /src/
RUN cd / && javac /src/HelloWorld.java
RUN ls /src -alF

FROM fabric8/java-alpine-openjdk11-jre
COPY --from=0 /src/HelloWorld.class /HelloWorld.class
CMD java -cp / HelloWorld