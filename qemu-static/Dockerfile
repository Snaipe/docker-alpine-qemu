FROM alpine:3.10

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
COPY qemu-sh.c /qemu-sh.c
COPY build.sh /usr/bin/build

CMD ["/usr/bin/build"]
