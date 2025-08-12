useradd -c fedora wandsas
passwd wandsas

sysctl -p /etc/sysctl.d/userns.conf

# show assigned uids
podman unshare cat /proc/self/uid_map
