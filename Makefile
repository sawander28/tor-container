#!/usr/bin/env make

build:
	podman build -f Containerfile -t tor

run:
	podman run --hostname trixie --net podman -P 127.0.0.1:9050:9050 -P 127.0.0.1:1053:1053 --rm -ti tor

clean:
	podman container ps -a
	podman container stop tor

net:
	podman network ls
	podman inspect podman
