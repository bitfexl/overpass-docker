FROM ubuntu as base
WORKDIR /overpass
RUN apt update -y && apt install wget expat -y

FROM base AS build
RUN apt update -y && apt install g++ make libexpat1-dev zlib1g-dev -y
COPY buildscript.sh .
RUN chmod +x buildscript.sh
RUN ./buildscript.sh

FROM base AS overpass
RUN apt update -y && apt install bzip2 apache2 osmium-tool -y
COPY --from=build /overpass/osm-3s_v*/bin bin
COPY --from=build /overpass/osm-3s_v*/cgi-bin cgi-bin
RUN chmod +x bin/* && chmod +x cgi-bin/*
RUN a2enmod cgi
COPY apache-config.conf /etc/apache2/sites-available/000-default.conf
COPY entrypoint.sh .
ENTRYPOINT ["/overpass/entrypoint.sh"]

FROM overpass AS overpass-debug
RUN apt update -y && apt install less -y
COPY debug.sh .

FROM node AS build-ui
RUN git clone https://github.com/tyrasd/overpass-turbo.git
WORKDIR /overpass-turbo
RUN npm install
COPY overpass-turbo/patch.js .
RUN npx tsc js/configs.ts
RUN node patch.js
RUN npm run build

FROM overpass AS overpass-ui
COPY --from=build-ui /overpass-turbo/dist/ /var/www/html
