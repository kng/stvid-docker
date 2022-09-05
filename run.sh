#!/bin/bash

if [ ! -d data ]; then
	echo "creating data dir..."
	mkdir -p data/obs/control data/tle data/results
	touch data/obs/control/position.txt
fi

echo "starting temporary docker"
docker run --rm --tmpfs /tmp -v $(pwd)/data:/data -it stvid:latest "$@"

# For acquire to work with CV2, add the followinf after docker run in the line above
# --device=/dev/video0

# misc usb devices
# --device=/dev/bus/usb/
