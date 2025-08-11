FROM containers.torproject.org/tpo/tpa/base-images/debian:trixie AS tor

RUN apt update && apt install -yq curl tor && rm -rf /var/lib/apt/lists/*

ARG TOR_USER="debian-tor"
ARG CONTAINER_UID="${CONTAINER_UID:-101}"
ARG CONTAINER_GID="${CONTAINER_GID:-102}"
ENV TORRC="${TORRC:-/etc/tor/torrc}"

EXPOSE 9050 1053

COPY torrc ${TORRC}

RUN mkdir -p /var/lib/tor && chmod 640 /var/lib/tor && \
    chown ${TOR_USER}:${TOR_USER} /var/lib/tor 

VOLUME ["/var/lib/tor"]

USER "${TOR_USER}"

CMD ["tor"]
