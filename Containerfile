FROM containers.torproject.org/tpo/tpa/base-images/debian:trixie AS tor

RUN DEBIAN_FRONTEND=noninteractive \
    apt update && apt install --no-install-recommends -yq curl tor && \
    rm -rf /var/lib/apt/lists/*

ARG TOR_USER="tor"
ARG TOR_USER_GROUP="tor"
ARG TOR_USER_UID="${TOR_USER_UID:-1000}"
ARG TOR_USER_GID="${TOR_USER_GID:-1000}"

ENV TORRC="${TORRC:-/etc/tor/torrc}"

RUN --network=none \
    set -xe && \
    groupadd --gid "${TOR_USER}" "${TOR_USER_GROUP}" && \
    useradd --home-dir "/home/${TOR_USER}" \
        --create-home \
        --gid "${TOR_USER_GID}" \
        --uid "${TOR_USER_UID}" \
        "${TOR_USER}"

COPY torrc ${TORRC}

RUN mkdir -p /var/lib/tor && chmod 640 /var/lib/tor && \
    chown ${TOR_USER}:${TOR_USER_GROUP} /var/lib/tor 

EXPOSE 9050 1053

VOLUME ["/var/lib/tor"]

USER "${TOR_USER_UID}:${TOR_USER_GID}"

CMD ["tor"]
