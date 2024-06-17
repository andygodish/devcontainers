# Debian 

This acts as a "base" dev container that other containers specific to particular languages can build on top of. It comes loaded with ohmyzsh and a few plugins for a more user-friendly development environment. 

## Exposing the Docker Socket in DevContainer

Rather than creating some kind of Docker-in-Docker (DinD) setup, this container is configured with an installation of the docker cli for use with the docker socket installed on your local machine. 

Passing the docker socket to the devcontainer can be done in your project repo (a repo that uses this devcontainer) by creating a bind mount like so, 

```
{
    "name": "Downstream DevContainer",
    "image": "devcontainer-debian:12-slim",
    "mounts": [
        "source=/var/run/docker.sock,target=/var/run/docker.sock,type=bind"
    ],
}
```

The docker cli is installed in the dockerfile found in the same dir as this readme. 