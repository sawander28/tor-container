#!/bin/sh

podman container run --name registry \
    --volume registry:/var/lib/registry:Z \
    -dt -p 9050:9050 docker.io/library/registry:2

podman image tag \
    containers.torproject.org/tpo/tpa/base-images/debian:trixie \
    localhost:5000/debian:trixie

podman image push --tls-verify=false \
    localhost:5000/debian:trixie
