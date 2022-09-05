#!/bin/bash
source .env
docker build -t knegge/stvid:${TAG} .
# --no-cache
# --pull

