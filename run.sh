podman run \
    --rm \
    --name tor-container \
    --network=host \
    --publish 127.0.0.1:9050:9050 \
    --publish 127.0.0.1:9051:9051 \
    --publish 127.0.0.1:9052:9052 \
    --mount type=volume,src=onion,target=/var/lib/tor \
    -t tor-container
