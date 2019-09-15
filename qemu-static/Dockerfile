FROM alpine:3.8

RUN apk add --no-cache \
    build-base \
    curl \
    gcc \
    git \
    glib-dev \
    glib-static \
    linux-headers \
    musl-dev \
    pixman-dev \
    pixman-static \
    python \
    zlib-dev

VOLUME /output

COPY qemu-enter.c /qemu-enter.c
COPY build.sh /usr/bin/build

CMD ["/usr/bin/build"]
