#!/bin/sh

# exit if a command fails
set -eo pipefail


apk update

# install openssl
apk add openssl

# install coreutils for date
apk add coreutils

# install mysqldump
apk add mysql-client

# install s3 tools
apk add python3 py3-pip
pip install awscli

# cleanup
rm -rf /var/cache/apk/*
