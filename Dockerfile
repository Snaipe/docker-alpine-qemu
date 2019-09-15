ARG ARCH
ARG QEMU_ARCH
ARG VERSION

FROM scratch

ADD alpine-minirootfs-${VERSION}-${ARCH}.tar.gz /

ADD ld-qemu/ld-${QEMU_ARCH}.tar.gz /

ENTRYPOINT ["/sbin/qemu-enter"]

SHELL ["/sbin/qemu-enter", "/bin/sh", "-c"]

CMD ["/bin/sh"]
