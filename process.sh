#!/bin/sh

[ -z "$MAX_HEAP_SIZE" ] && MAX_HEAP_SIZE="4G"
[ -z "$DESCRIPTION" ] && DESCRIPTION="OSM Map"

mkdir -p /work

java -Xmx${MAX_HEAP_SIZE} -jar /splitter/splitter.jar --output-dir=/work /data/*.osm

cd /work

java -Xmx${MAX_HEAP_SIZE} -jar /mkgmap/mkgmap.jar --mapname=63240901 --description=${DESCRIPTION} --gmapsupp --route --remove-short-arcs --add-pois-to-areas *.osm.pbf

mv gmapsupp.img /data/gmapbmap.img

cd /
rm -rf /work