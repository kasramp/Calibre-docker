ARG VERSION=3.13.7-slim

FROM python:${VERSION}

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    wget xz-utils fonts-liberation calibre nodejs npm && \
    rm -rf /var/lib/apt/lists/*