FROM --platform=linux/amd64 ubuntu:24.04

RUN dpkg --add-architecture i386 && \
    apt-get update && \
    apt-get install -y \
        nasm \
        gcc \
        gcc-multilib \
        libc6-dev-i386 && \
    apt-get clean

WORKDIR /work