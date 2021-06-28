NAME := displaycal
IMAGE := awerlang/${NAME}

.PHONY: build
build:
	container-build ${NAME}

.PHONY: name
name:
	@echo ${NAME}

.PHONY: create
create:

.PHONY: run
run:
	@podman run --rm \
				--userns=keep-id \
				--env "DISPLAY=${DISPLAY}" \
				--volume=/tmp/.X11-unix:/tmp/.X11-unix:ro \
				--volume=${XAUTHORITY}:/home/user/.Xauthority:ro \
				--env "XAUTHORITY=/home/user/.Xauthority" \
				${IMAGE}
