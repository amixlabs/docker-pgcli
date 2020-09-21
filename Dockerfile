FROM alpine:3.12

LABEL maintainer="Edison E. Abreu <dinho.abreu@gmail.com>"

RUN apk add --no-cache \
        tini \
        python3 \
        libevent \
        libpq && \
    apk add --no-cache --virtual .build-deps \
        python3-dev \
        postgresql-dev \
        libevent-dev \
        musl-dev \
        gcc && \
    python3 -m ensurepip && \
    pip3 install --upgrade pip && \
    pip3 install pgcli && \
    apk del .build-deps

ADD entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/sbin/tini", "--", "/entrypoint.sh"]