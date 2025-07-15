FROM eccr.ecmwf.int/webdev/postgresql17:2025-01-22-002

RUN \
  set -ex \
  && apt update \
  && apt install --no-install-suggests --no-install-recommends --yes \
       osm2pgrouting \
       postgresql-postgis-scripts \
       postgresql-pgrouting

