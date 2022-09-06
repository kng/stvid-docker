#!/bin/bash
source .env
if [ ! -d srv ]; then
	echo "creating srv dir..."
	mkdir -p srv/obs/control srv/tle srv/results
	touch srv/obs/control/position.txt
fi

echo "starting temporary docker"
docker run --rm --tmpfs /tmp -v $(pwd)/srv:/srv -it knegge/stvid:${TAG} "$@"

# For acquire to work with CV2, add the following after docker run in the line above
# --device=/dev/video0

# misc usb devices
# --device=/dev/bus/usb/
