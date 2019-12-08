FROM larskghf/debian-baseimage:latest

ARG DOWNLOADURL
ARG JDKVERSION

# update and upgrade os
RUN \
    mkdir /opt/${JDKVERSION} && \
    curl -L --silent https://github.com/AdoptOpenJDK/openjdk8-binaries/releases/download/jdk8u232-b09/OpenJDK8U-jdk_x64_linux_hotspot_8u232b09.tar.gz | tar -xz --strip-components=1 -C "/opt/${JDKVERSION}"