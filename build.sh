#!/bin/bash

CURRENT_TAG=1.10

docker build -t devshred/mkgmap .
docker tag devshred/mkgmap devshred/mkgmap:$CURRENT_TAG

docker push devshred/mkgmap
docker push devshred/mkgmap:$CURRENT_TAG