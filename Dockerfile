ARG ARCH
ARG QEMU_ARCH

FROM scratch

ADD alpine-minirootfs-${ARCH}.tar.gz /

ADD ld-qemu/ld-${QEMU_ARCH}.tar.gz /

ENTRYPOINT ["/sbin/qemu-enter"]

SHELL ["/sbin/qemu-enter", "/bin/sh", "-c"]

CMD ["/bin/sh"]
