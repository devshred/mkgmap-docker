# Create maps for Garmin devices.

This Docker image uses [mkgmap](https://www.mkgmap.org.uk/) to create maps from OpenStreetMap data for Garmin devices.

- download OSM XML (e.g. via https://extract.bbbike.org)
- run ```docker run --rm -it -v $(pwd):/data -e DESCRIPTION="name of this map" devshred/mkgmap```