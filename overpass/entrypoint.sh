#!/bin/bash

# Init overpass

if ! [[ -d /data/db ]]
then
    if [[ ${DATA_URL: -8} == ".osm.pbf" ]]
    then
        wget $DATA_URL -O /data/data.osm.pbf
        
        # https://osmcode.org/osmium-tool/manual.html#osm-file-formats-and-converting-between-them
        
        echo "Converting data..."
        osmium cat /data/data.osm.pbf -o /data/data.osm.bz2

        rm /data/data.osm.pbf
    elif [[ ${DATA_URL: -8} == ".osm.bz2" ]]
    then
        wget $DATA_URL -O /data/data.osm.bz2
    else
        echo "Error DATA_URL: only *.osm.pbf and *.osm.bz2 data sources are allowed."
        exit 1
    fi

    echo "Loading data..."
    bin/init_osm3s.sh /data/data.osm.bz2 /data/db .

    rm /data/data.osm.bz2
fi

# Start overpass

service apache2 start

rm /data/db/osm3s_*

nohup bin/dispatcher --osm-base --db-dir=/data/db --rate-limit=10 --allow-duplicate-queries=yes &

# Docker logs
tail -f /var/log/apache2/access.log
