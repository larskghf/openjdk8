FROM larskghf/debian-baseimage:latest

ARG DOWNLOADURL
ARG JREVERSION

ENV JAVA_HOME /opt/${JREVERSION}/

# update and upgrade os
RUN mkdir /opt/${JREVERSION} \
    && curl -L --silent ${DOWNLOADURL} | tar -xz --strip-components=1 -C "/opt/${JREVERSION}" \
    && update-alternatives --install /usr/bin/java java /opt/${JREVERSION}/bin/java 100