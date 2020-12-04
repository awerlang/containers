NAME := vscode
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
					--security-opt no-new-privileges \
					--shm-size 2g \
					--tmpfs /run \
					--userns=keep-id \
					--volume=${HOME}/src:/src \
					--volume=/etc/localtime:/etc/localtime:ro \
					--volume=/tmp/.X11-unix:/tmp/.X11-unix:ro \
					--env "DISPLAY=${DISPLAY}" \
					--env "LANG=pt_BR.UTF-8" \
					--env "LANGUAGE=pt_BR:en_US:en" \
					--init \
					${IMAGE} >/dev/null

.PHONY: run
run:
	@copy_Xauthority trusted ${NAME}
	podman cp ~/.config/git vscode:/home/user/.config/

.PHONY: clean
clean:
	podman rm ${NAME}
