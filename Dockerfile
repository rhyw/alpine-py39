FROM python:3.9-alpine

LABEL maintainer="Yuguang Wang <wangyg819@gmail.com>"
LABEL org.label-schema.description="Minimal py39 runtime based on alpine with Django/requests/psycopg2 installed"
LABEL org.label-schema.vcs-url="https://github.com/rhyw/alpine-py39.git"
LABEL org.label-schema.image-url="quay.io/yuwang/py39-alpine-pgsql"

# Uncomment if you have problem download from offical cdn repo
RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.aliyun.com/g' /etc/apk/repositories

ARG PIP_INDEX_URL
ENV PIP_INDEX_URL=${PIP_INDEX_URL}

WORKDIR /app

COPY requirements.txt .

RUN apk add --no-cache postgresql-libs \
    && apk add --no-cache --virtual .build-deps gcc python3-dev musl-dev postgresql-dev \
    && python3 -m ensurepip \
    && pip3 install --no-cache-dir --upgrade pip \
    && pip3 install --no-cache-dir -r requirements.txt \
    && apk --purge del .build-deps

CMD ["python3"]
