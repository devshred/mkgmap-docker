FROM ubuntu AS builder

ARG MKGMAP_VERSION=r4717
ARG SPLITTER_VERSION=r602

WORKDIR /build
RUN apt-get update && apt-get install -y wget unzip \
    && wget http://www.mkgmap.org.uk/download/mkgmap-$MKGMAP_VERSION.zip \
    && unzip mkgmap-$MKGMAP_VERSION.zip \
    && mv mkgmap-$MKGMAP_VERSION mkgmap \
    && wget http://www.mkgmap.org.uk/download/splitter-$SPLITTER_VERSION.zip \
    && unzip splitter-$SPLITTER_VERSION.zip \
    && mv splitter-$SPLITTER_VERSION splitter

FROM openjdk:11-jre-slim
COPY --from=builder /build/mkgmap //mkgmap
COPY --from=builder /build/splitter /splitter

ADD process.sh /process.sh
VOLUME /data

CMD /process.sh