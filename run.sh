podman run \
    --rm \
    --name tor-container \
    --net podman \
    -p 9050:9050 \
    -p 1053:1053 \
    -ti tor-container
