FROM larskghf/debian-baseimage:latest

ARG DOWNLOADURL
ARG JDKVERSION

# update and upgrade os
RUN \
    mkdir /opt/${JDKVERSION} && \
    curl -L --silent ${DOWNLOADURL} | tar -xz --strip-components=1 -C "/opt/${JDKVERSION}" && \
    update-alternatives --install /usr/bin/java java /opt/${JDKVERSION}/bin/java 100 && \
    update-alternatives --install /usr/bin/javac javac /opt/${JDKVERSION}/bin/javac 100