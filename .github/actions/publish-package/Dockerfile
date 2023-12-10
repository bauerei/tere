FROM debian:12.2-slim

RUN apt-get update && \
    apt-get install -y dpkg-dev apt-utils

# /github/workspace is default mapping
# https://docs.github.com/en/actions/creating-actions/creating-a-docker-container-action#accessing-files-created-by-a-container-action
WORKDIR /github/workspace

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT [ "/entrypoint.sh" ]