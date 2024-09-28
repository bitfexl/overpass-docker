#!/bin/bash
wget https://dev.overpass-api.de/releases/osm-3s_latest.tar.gz
tar -xf osm-3s_latest.tar.gz
cd osm-3s_v*
./configure --prefix="`pwd`"
make