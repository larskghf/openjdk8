FROM debian:buster-slim as downloader

ARG DOWNLOADURL
ARG JREVERSION

RUN apt-get update \
    && apt-get upgrade -y \
    && apt-get install -y --no-install-recommends \
        apt-transport-https \
        ca-certificates \
        curl \
    && apt-get clean && apt-get autoremove && rm -Rf /var/lib/apt/lists/* && rm -Rf /var/cache/apt \
    && mkdir /tmp/${JREVERSION} \
    && curl -L --silent ${DOWNLOADURL} | tar -xz --strip-components=1 -C "/tmp/${JREVERSION}"

#-----------------------------------------------------------------------------------------------------------------------
#-----------------------------------------------------------------------------------------------------------------------
FROM debian:buster-slim

ARG JREVERSION

ENV JAVA_HOME /opt/${JREVERSION}/

COPY --from=downloader /tmp/${JREVERSION} /opt/${JREVERSION}

RUN update-alternatives --install /usr/bin/java java /opt/${JREVERSION}/bin/java 100