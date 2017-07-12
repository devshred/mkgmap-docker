FROM openjdk:8-jre-alpine

ARG MKGMAP_VERSION=r3973
ARG SPLITTER_VERSION=r583

RUN apk add --no-cache wget libarchive-tools

RUN wget -q -O - http://www.mkgmap.org.uk/download/mkgmap-$MKGMAP_VERSION.zip | bsdtar -xvf-  \
	&& mv mkgmap-$MKGMAP_VERSION /mkgmap \
    && wget -q -O - http://www.mkgmap.org.uk/download/splitter-$SPLITTER_VERSION.zip | bsdtar -xvf- \
    && mv splitter-$SPLITTER_VERSION /splitter

ADD process.sh /process.sh
VOLUME /data

CMD /process.sh