NAME := warsaw
IMAGE := awerlang/${NAME}
uid := $(shell id -u)
gid := $(shell id -g)

.PHONY: build
build:
	@echo '> Building the image' | grep --color=always .
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
					--volume=/tmp/.X11-unix:/tmp/.X11-unix:ro \
					--env "DISPLAY=${DISPLAY}" \
					--env "LANG=pt_BR.UTF-8" \
					--init \
					${IMAGE} >/dev/null

.PHONY: run
run:
	@copy_Xauthority untrusted ${NAME}

.PHONY: clean
clean:
	podman rm ${NAME}
