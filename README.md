# devcontainers

A single repo containing the "base" dockerfiles for building out dev environments inside containers. This are built specifically for VSCode Dev Containers. 

## Building Dev Containers

Configure a `.devcontainers` directory and associated `devcontainers.json` file with desired configurations. The example below will result in a dev container with the docker with the docker extension pre-installed,

```
{
  "name": "Debian Devcontainer",
  "image": "andygodish/devcontainer:debian",
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


