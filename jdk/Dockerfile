FROM debian:buster-slim as downloader

ARG DOWNLOADURL
ARG JDKVERSION

RUN apt-get update \
    && apt-get install -y --no-install-recommends \
        apt-transport-https \
        ca-certificates \
        curl \
    && apt-get clean && apt-get autoremove && rm -Rf /var/lib/apt/lists/* && rm -Rf /var/cache/apt \
    && mkdir /tmp/${JDKVERSION} \
    && curl -L --silent ${DOWNLOADURL} | tar -xz --strip-components=1 -C "/tmp/${JDKVERSION}" \
    && rm -rf /tmp/${JDKVERSION}/sample/ /tmp/${JDKVERSION}/src.zip

#-----------------------------------------------------------------------------------------------------------------------
#-----------------------------------------------------------------------------------------------------------------------
FROM debian:buster-slim

ARG JDKVERSION

ENV JAVA_HOME /opt/${JDKVERSION}/

COPY --from=downloader /tmp/${JDKVERSION} /opt/${JDKVERSION}

RUN update-alternatives --install /usr/bin/java java /opt/${JDKVERSION}/bin/java 100 \
    && update-alternatives --install /usr/bin/javac javac /opt/${JDKVERSION}/bin/javac 100