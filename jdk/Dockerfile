FROM debian:buster-slim as downloader

ARG DOWNLOADJDK
ARG JAVAVERSION

RUN apt-get update \
    && apt-get install -y --no-install-recommends \
        apt-transport-https \
        ca-certificates \
        curl \
    && apt-get clean && apt-get autoremove && rm -Rf /var/lib/apt/lists/* && rm -Rf /var/cache/apt \
    && mkdir /tmp/jdk${JAVAVERSION} \
    && curl -L --silent ${DOWNLOADJDK} | tar -xz --strip-components=1 -C "/tmp/jdk${JAVAVERSION}" \
    && rm -rf /tmp/jdk${JAVAVERSION}/sample/ /tmp/jdk${JAVAVERSION}/src.zip

#-----------------------------------------------------------------------------------------------------------------------
#-----------------------------------------------------------------------------------------------------------------------
FROM debian:buster-slim

ARG JAVAVERSION

ENV JAVA_HOME /opt/jdk${JAVAVERSION}/

COPY --from=downloader /tmp/jdk${JAVAVERSION} /opt/jdk${JAVAVERSION}

RUN update-alternatives --install /usr/bin/java java /opt/jdk${JAVAVERSION}/bin/java 100 \
    && update-alternatives --install /usr/bin/javac javac /opt/jdk${JAVAVERSION}/bin/javac 100