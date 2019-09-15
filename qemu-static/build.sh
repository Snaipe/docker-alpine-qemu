#!/bin/sh -e

gcc -static -o /tmp/qemu-enter -Wall -Wextra -Wno-unused-parameter /qemu-enter.c

git clone https://github.com/Snaipe/alpine-qemu-execve /src

mkdir /src/build && cd /src/build

../configure \
    --static \
    --disable-werror \
    --disable-system \
    --disable-guest-agent \
    --disable-debug-info \
    --disable-docs \
    --disable-tools \
    --enable-linux-user \
    --enable-bsd-user \
    --target-list="aarch64-linux-user arm-linux-user i386-linux-user ppc64le-linux-user riscv64-linux-user s390x-linux-user x86_64-linux-user" \
    --prefix=/usr \
    --interp-prefix=/

make -j$(nproc)

DESTDIR=/tmp/qemu make install

for interp in /tmp/qemu/usr/bin/qemu-*; do
    arch="$(echo "$interp" | cut -d- -f2-)"
    destdir=/tmp/"$arch"
    install -D "$interp" "$destdir"/lib/ld-qemu.so
    install -D /tmp/qemu-enter "$destdir"/sbin/qemu-enter
    tar czf /output/ld-"$arch".tar.gz -C "$destdir" .
done
