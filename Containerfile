FROM alpine:latest AS tor

RUN apk add --no-cache tor

ENV TORRC="${TORRC:-/etc/tor/torrc}"

COPY torrc ${TORRC}

RUN chown -R tor:tor /etc/tor /var/lib/tor
RUN chmod 600 /etc/tor/torrc

EXPOSE 9050 1053

VOLUME ["/var/lib/tor"]

USER "tor"

ENTRYPOINT ["/usr/bin/tor"]
