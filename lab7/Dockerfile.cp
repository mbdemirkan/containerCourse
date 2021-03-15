FROM openjdk:8
RUN mkdir /src
ADD HelloWorld.java /src/
RUN cd / && javac /src/HelloWorld.java
CMD java -cp /src HelloWorld
