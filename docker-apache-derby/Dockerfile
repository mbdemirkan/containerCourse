# Pull base image.
FROM ibmjava:8-jre AS derbydb

ENV DERBY_INSTALL=/db-derby-10.14.2.0-bin
ENV DERBY_HOME=/db-derby-10.14.2.0-bin
ENV CLASSPATH=/$DERBY_INSTALL/lib/derby.jar:$DERBY_INSTALL/lib/derbytools.jar:.

RUN \
	wget https://kozyatagi.mirror.guzel.net.tr/apache//db/derby/db-derby-10.14.2.0/db-derby-10.14.2.0-bin.tar.gz &&\
	tar xzf db-derby-10.14.2.0-bin.tar.gz &&\
	rm -Rf /db-derby-10.14.2.0-bin.tar.gz

CMD $DERBY_HOME/bin/startNetworkServer
