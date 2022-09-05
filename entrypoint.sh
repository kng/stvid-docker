#!/bin/bash
set -e
#avahi-daemon --daemonize --no-drop-root
if [ -f /data/stvid.env ]; then
	source /data/stvid.env
fi
exec "$@"

