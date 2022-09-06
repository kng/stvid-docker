#!/bin/bash
set -e
#avahi-daemon --daemonize --no-drop-root
if [ -f /srv/stvid.env ]; then
	source /srv/stvid.env
fi
exec "$@"

