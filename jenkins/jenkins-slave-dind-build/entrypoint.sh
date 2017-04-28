#!/bin/bash -e

# Run a docker instance in the background if the DIND env is set
if [[ -n "$DIND" && "$DIND" != 'false' ]]; then
	
	docker daemon $DOCKER_DAEMON_ARGS &
	(( timeout = ${DIND_START_TIMEOUT:-10} + SECONDS ))
	until docker info >/dev/null 2>&1; do
		if (( SECONDS >= timeout )); then
			echo 'Timed out trying to connect to internal docker host.' >&2
			exit 1
		fi
		sleep 1
	done
fi

exec "$@"
