[![Build Status](https://travis-ci.org/amixlabs/docker-pgcli.svg?branch=master)](https://travis-ci.org/amixlabs/docker-pgcli)

# About this Repo

This is the Git repo of the official Docker image for [amixlabs/pgcli](https://hub.docker.com/r/amixlabs/pgcli/).
See the Hub page for the full readme on how to use the Docker image and for
information regarding contributing and issues.

Common build usage:

```bash
docker build \
  --build-arg "http_proxy=$http_proxy" \
  --build-arg "https_proxy=$https_proxy" \
  --build-arg "no_proxy=$no_proxy" \
  -t amixlabs/pgcli:latest \
  .
```

Publish

```bash
docker login
docker push amixlabs/pgcli
```

Using `docker-compose.yml`:

```yml
version: '2'
services:
  pgcli:
    image: amixlabs/pgcli
    command: postgresql://youruser:yourpass@pg/yourdb
    stdin_open: true
    tty: true
    links:
    - pg

  pg:
    image: postgres:12
    environment:
    - POSTGRES_USER=youruser
    - POSTGRES_PASSWORD=yourpass
    - POSTGRES_DB=yourdb
```

```bash
docker-compose up -d pg
docker-compose run --rm pgcli
```

Expected output:

```txt
Starting docker-pgcli_pg_1 ... done
Server: PostgreSQL 12.4 (Debian 12.4-1.pgdg100+1)
Version: 3.0.0
Chat: https://gitter.im/dbcli/pgcli
Home: http://pgcli.com
youruser@pg:yourdb>
```
