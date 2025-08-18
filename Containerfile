FROM alpine:latest AS tor

RUN apk add --no-cache tor

COPY torrc /etc/tor/torrc
RUN chown -R tor: /etc/tor
RUN chmod 600 /etc/tor/torrc

RUN chown -R tor: /var/lib/tor

EXPOSE 9050 1053

VOLUME ["/var/lib/tor"]

USER "tor"

ENTRYPOINT ["/usr/bin/tor"]
