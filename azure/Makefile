NAME := azure
IMAGE := awerlang/${NAME}

.PHONY: build
build:
	@echo '> Building the image' | grep --color=always .
	container-build ${NAME}

.PHONY: name
name:
	@echo ${NAME}

.PHONY: create
create:
	podman create --name=${NAME} \
					--label=persistent \
					--network host \
					--cap-drop ALL \
					--security-opt no-new-privileges \
					--shm-size 2g \
					--tmpfs /run \
					--userns=keep-id \
					--volume=${HOME}/src:/src \
					--volume=/etc/localtime:/etc/localtime:ro \
					--volume=/tmp/.X11-unix:/tmp/.X11-unix:ro \
					--env "DISPLAY=${DISPLAY}" \
					--env "XAUTHORITY=/tmp/.Xauthority" \
					--init \
					${IMAGE} >/dev/null

.PHONY: run
run:
	@copy_Xauthority trusted ${NAME}

.PHONY: clean
clean:
	podman rm ${NAME}
