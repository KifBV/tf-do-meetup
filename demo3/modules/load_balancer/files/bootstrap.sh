#!/usr/bin/env bash

apt update && \
apt -y install nginx
echo "$(hostname)" >/var/www/html/index.html
