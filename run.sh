podman run \
    --rm \
    --name tor-container \
    --network podman \
    --volume ./tor:/var/lib/tor \
    --publish 127.0.0.1:9050:9050 \
    --publish 127.0.0.1:1053:1053 \
    -t tor-container 
