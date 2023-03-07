# Use Alpine Linux as the base image
FROM python:3.9-alpine

# Set labels
LABEL maintainer="Yuguang Wang <wangyg819@gmail.com>"
LABEL org.label-schema.description="Minimal py39 runtime based on alpine with Django/requests/psycopg2 installed"
LABEL org.label-schema.vcs-url="https://github.com/rhyw/alpine-py39.git"
LABEL org.label-schema.image-url="quay.io/yuwang/py39-alpine-pgsql"

# Uncomment if you have problem download from offical cdn repo
# RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.aliyun.com/g' /etc/apk/repositories

# Install Python and the necessary packages for running Django
RUN apk add --no-cache postgresql-dev gcc python3-dev musl-dev \
    && apk add --no-cache python3 \
    && python3 -m ensurepip \
    && pip3 install --no-cache-dir -i https://mirrors.aliyun.com/pypi/simple/ --upgrade pip \
    && pip3 install --no-cache-dir -i https://mirrors.aliyun.com/pypi/simple/ -r requirements.txt

# Set the working directory to /app
WORKDIR /app

