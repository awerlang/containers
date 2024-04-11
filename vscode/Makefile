NAME := vscode
IMAGE := awerlang/${NAME}
uid := $(shell id -u)
gid := $(shell id -g)

.PHONY: build
build:
	container-build ${NAME} ./context

.PHONY: name
name:
	@echo ${NAME}

.PHONY: create
create:
	podman create --name=${NAME} \
					--label=persistent \
					--security-opt no-new-privileges \
					--tmpfs /run \
					--userns=keep-id \
					--volume=/dev/dri:/dev/dri \
					--volume=${HOME}/src:/src \
					--volume=${HOME}/.ssh:/home/user/.ssh \
					--volume=/etc/localtime:/etc/localtime:ro \
					--volume /etc/machine-id:/etc/machine-id:ro \
					--volume=/tmp/.X11-unix:/tmp/.X11-unix:ro \
					--env "DISPLAY=${DISPLAY}" \
					--env "XDG_RUNTIME_DIR=/tmp" \
					--init \
					${IMAGE} >/dev/null

.PHONY: run
run:
	@copy_Xauthority trusted ${NAME}
	podman cp ~/.config/git ${NAME}:/home/user/.config/

.PHONY: clean
clean:
	podman rm ${NAME}
