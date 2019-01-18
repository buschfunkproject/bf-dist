#!/bin/sh

touch pi-gen/stage3/SKIP pi-gen/stage4/SKIP pi-gen/stage5/SKIP
touch pi-gen/stage4/SKIP_IMAGES pi-gen/stage5/SKIP_IMAGES

#git submodule update --remote

cp config pi-gen
cp -r 04-buschfunk pi-gen/stage2
cd pi-gen
PRESERVE_CONTAINER=1 CONTINUE=1 time ./build-docker.sh
cd ..

