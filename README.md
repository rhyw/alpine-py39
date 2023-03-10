# alpine-py39

## Building the Docker Image

To build the Docker image, follow these steps:

1. Clone the repository.
2. Run following:
    ```
    cd alpine-py39 && docker build --build-arg PIP_INDEX_URL=<pip-index-url> -t <image-name>:<tag> .
    ```
    E.g., use https://mirrors.aliyun.com/pypi/simple/ as pip index url other than the default.
3. Verify that the image was successfully built by running the following command:
   ```
   docker images
   ```

## Inspect an image

`docker inspect` can provide info about a Docker container or image, see below output:

```
$ docker inspect quay.io/yuwang/py39-alpine-pgsql:latest | jq '.[0] | keys'
[
  "Architecture",
  "Author",
  "Comment",
  "Config",
  "Container",
  "ContainerConfig",
  "Created",
  "DockerVersion",
  "GraphDriver",
  "Id",
  "Metadata",
  "Os",
  "Parent",
  "RepoDigests",
  "RepoTags",
  "RootFS",
  "Size",
  "VirtualSize"
]
```

Many of instructions(LABEL/ENV/WORKDIR) are available in `Config`. See:
```
$ docker inspect quay.io/yuwang/py39-alpine-pgsql:latest | jq '.[0].Config'
{
  "Hostname": "",
  "Domainname": "",
  "User": "",
  "AttachStdin": false,
  "AttachStdout": false,
  "AttachStderr": false,
  "Tty": false,
  "OpenStdin": false,
  "StdinOnce": false,
  "Env": [
    "PATH=/usr/local/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin",
    "LANG=C.UTF-8",
    "GPG_KEY=E3FF2839C048B25C084DEBE9B26995E310250568",
    "PYTHON_VERSION=3.9.16",
    "PYTHON_PIP_VERSION=22.0.4",
    "PYTHON_SETUPTOOLS_VERSION=58.1.0",
    "PYTHON_GET_PIP_URL=https://github.com/pypa/get-pip/raw/d5cb0afaf23b8520f1bbcfed521017b4a95f5c01/public/get-pip.py",
    "PYTHON_GET_PIP_SHA256=394be00f13fa1b9aaa47e911bdb59a09c3b2986472130f30aa0bfaf7f3980637",
    "PIP_INDEX_URL=https://mirrors.aliyun.com/pypi/simple/"
  ],
  "Cmd": [
    "python3"
  ],
  "ArgsEscaped": true,
  "Image": "",
  "Volumes": null,
  "WorkingDir": "/app",
  "Entrypoint": null,
  "OnBuild": null,
  "Labels": {
    "maintainer": "Yuguang Wang <wangyg819@gmail.com>",
    "org.label-schema.description": "Minimal py39 runtime based on alpine with Django/requests/psycopg2 installed",
    "org.label-schema.image-url": "quay.io/yuwang/py39-alpine-pgsql",
    "org.label-schema.vcs-url": "https://github.com/rhyw/alpine-py39.git"
  }
}
```

Config is one of the sections of the output provided by docker inspect, and it contains information about the container configuration.

Here's an overview of the information provided in the Config section:

* Hostname: the hostname assigned to the container
* Domainname: the domain name assigned to the container
* User: the user assigned to the container
* AttachStdin: a Boolean value indicating whether the container should attach to stdin
* AttachStdout: a Boolean value indicating whether the container should attach to stdout
* AttachStderr: a Boolean value indicating whether the container should attach to stderr
* Tty: a Boolean value indicating whether the container should allocate a TTY
* Cmd: the command to run in the container
* Env: a list of environment variables to set in the container
* Image: the image used to create the container
* WorkingDir: the working directory inside the container
* Entrypoint: the entry point for the container
* Labels: any labels assigned to the container
* Volumes: a list of volumes attached to the container

You can use the information in the Config section to understand how the container is configured, including what image it's based on, what command it runs, and what environment variables are set. This information can be useful for troubleshooting issues with the container or for understanding how to replicate its configuration.
