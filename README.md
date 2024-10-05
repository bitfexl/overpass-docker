# overpass-docker

A docker overpass and overpass turbo setup.

## Used projects and documentation

**Overpass API**

https://overpass-api.de/
https://github.com/drolbr/Overpass-API
https://overpass-api.de/full_installation.html
https://dev.overpass-api.de/releases/

**Overpass turbo**

https://overpass-turbo.eu/
https://github.com/tyrasd/overpass-turbo

**Osmium**

https://osmcode.org/
https://osmcode.org/osmium-tool/manual.html#osm-file-formats-and-converting-between-them

## Data

https://planet.openstreetmap.org/

https://download.geofabrik.de/

## HOW TO USE

**Build**

```sh
docker build -t overpass-docker .
```

**Run**

```sh
docker run --name overpass-api -p 80:80 -v /mnt/DATA_VOLUME:/data -e DATA_URL=https://planet.openstreetmap.org/pbf/planet-latest.osm.pbf -it overpass-docker
```

todo: test bz2 import
