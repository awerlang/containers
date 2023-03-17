NAME := token
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
	@podman create --name=${NAME} \
					--label=persistent \
					--cap-drop ALL \
					--cap-add SETUID \
					--cap-add SETGID \
					--cap-add CHOWN \
					--security-opt no-new-privileges \
					--security-opt seccomp=unconfined \
					--shm-size 2g \
					--tmpfs /run \
					--volume=/etc/localtime:/etc/localtime:ro \
					--volume=/tmp/.X11-unix:/tmp/.X11-unix:ro \
					--volume=/run/pcscd:/run/pcscd:ro \
					--env "DISPLAY=${DISPLAY}" \
					--env "LANG=pt_BR.UTF-8" \
					--env "LANGUAGE=pt_BR:en_US:en" \
					--init \
					${IMAGE} >/dev/null

.PHONY: run
run:
	@copy_Xauthority trusted ${NAME}

.PHONY: clean
clean:
	podman rm ${NAME}
