FROM openjdk:8-jre-alpine

ARG MKGMAP_VERSION=r4555
ARG SPLITTER_VERSION=r597

RUN apk --update add --no-cache libarchive-tools && rm -rf /var/cache/apk/*

RUN wget -q -O - http://www.mkgmap.org.uk/download/mkgmap-$MKGMAP_VERSION.zip | bsdtar -xvf-  \
	&& mv mkgmap-$MKGMAP_VERSION /mkgmap \
    && wget -q -O - http://www.mkgmap.org.uk/download/splitter-$SPLITTER_VERSION.zip | bsdtar -xvf- \
    && mv splitter-$SPLITTER_VERSION /splitter

ADD process.sh /process.sh
VOLUME /data

CMD /process.sh