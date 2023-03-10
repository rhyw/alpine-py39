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
