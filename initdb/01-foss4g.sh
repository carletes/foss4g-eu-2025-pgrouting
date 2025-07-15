#!/usr/bin/env bash

set -eux

password=$(scram-sha-256 foss4g)
psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" <<- EOT
  CREATE USER foss4g;
  ALTER USER foss4g WITH PASSWORD '${password}';

  ALTER ROLE foss4g WITH CREATEDB SUPERUSER;

  CREATE DATABASE foss4g;
  GRANT ALL PRIVILEGES ON DATABASE foss4g TO foss4g;

  CREATE EXTENSION pgrouting CASCADE;
EOT

psql -v ON_ERROR_STOP=1 --username foss4g --dbname foss4g <<- EOT
  CREATE EXTENSION postgis;
  CREATE EXTENSION pgrouting CASCADE;
EOT
