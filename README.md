# overpass-docker

A docker overpass and overpass turbo setup.

## Usage

**Use image built by GitHub Actions**

The image is built once a week. Only the latest tag is supported. DATA_URL can be .pbf or .bz2.

```sh
docker run --name overpass-api -p 80:80 -v /mnt/DATA_VOLUME:/data -e DATA_URL=https://planet.openstreetmap.org/pbf/planet-latest.osm.pbf -d ghcr.io/bitfexl/overpass-docker:latest
```

Isle of man (small extract) for testing:

```sh
docker run --name overpass-api -p 80:80 -v ./data:/data -e DATA_URL=https://download.geofabrik.de/europe/isle-of-man-latest.osm.pbf -d ghcr.io/bitfexl/overpass-docker:latest
```

**Build**

```sh
docker build -t overpass-docker .
```

**Run**

```sh
docker run --name overpass-api -p 80:80 -v /mnt/DATA_VOLUME:/data -e DATA_URL=https://planet.openstreetmap.org/pbf/planet-latest.osm.pbf -d overpass-docker
```

## Data

https://planet.openstreetmap.org/

Regional extracts available at:

https://download.geofabrik.de/

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
