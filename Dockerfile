ARG VERSION=3.13.7-slim

FROM python:${VERSION}

RUN apt-get update && apt-get install -y \
    wget xz-utils fonts-liberation calibre \
    && rm -rf /var/lib/apt/lists/*