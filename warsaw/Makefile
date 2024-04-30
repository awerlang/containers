NAME := warsaw
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
					--cap-drop ALL \
					--cap-add SETUID \
					--cap-add SETGID \
					--cap-add AUDIT_WRITE \
					--cap-add DAC_OVERRIDE \
					--cap-add CHOWN \
					--security-opt no-new-privileges \
					--shm-size 2g \
					--volume=/etc/localtime:/etc/localtime:ro \
					--volume /etc/machine-id:/etc/machine-id:ro \
					--volume=/tmp/.X11-unix:/tmp/.X11-unix:ro \
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
