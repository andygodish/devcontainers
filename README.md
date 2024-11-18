# devcontainers

A single repo containing the "base" dockerfiles for building out dev environments inside containers. These are built specifically for VSCode Dev Containers. 

Each dir at the root of this repo represent a base image that subsequent dirs in the tree then use as a base image. These base images (as definined in the associated `dockerfile`) contain an ever-growing list of cli tools as well as a base installation of ohmyzsh to make for a slick dev experience inside of the container.

## Quickstart

**Requirements:** just docker

1. Build the image from the dockerfile in the root of this repo. This node base image contains the devcontainer and docker cli tools.

```
sh ./build.sh
```

This will produce a local image named `devcontainer-builder`.

2. Launch a container using the above image build making sure to mount this repo and your local docker socket, allowing the container to communicate with your local machine's docker daemon. 

```
docker run -it -v $PWD:/work -v /var/run/docker.sock:/var/run/docker.sock devcontainer-builder /bin/bash
```

3. Build a devcontainer using the devcontainer cli tool.
```
cd debian
```
```
devcontainer build --workspace-folder . --image-name devcontainer-debian:12-slim
```

## Building Dev Containers

Configure a `.devcontainers` directory and associated `devcontainers.json` file with desired configurations. The example below will result in a dev container with the docker extension pre-installed,

```
{
  "name": "Debian 12-slim Devcontainer",
  "build": {
    "dockerfile": "../dockerfile",
    "context": ".."
  },
  "customizations": {
    "vscode": {
      "extensions": ["ms-azuretools.vscode-docker"]
    }
  }
}
```

Install the cli tool on your local machine.

```
npm install -g @devcontainers/cli
```

Change into the directory that you wish to build a dev container for. For example,

```
cd debain
```

Use the devcontainer cli to build the image,

```
devcontainer build --workspace-folder . --image-name devcontainer-debian:12-slim
```

Where `--workspace-folder` is the reference to the location of your `.devcontainer` dir. 

You should now be able to run this container from an interactive terminal and see that you have access to a shell pre-configured with ohmyzsh,

```
docker run -it devcontainer-debian:12-slim
```


