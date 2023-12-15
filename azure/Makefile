NAME := azure
IMAGE := awerlang/${NAME}

include ../.env
export $(shell sed 's/=.*//' ../.env)

CONFIG_FILE := $(shell find ${WORKSPACE_PATH}/.config/azure/ -name 'krb5-*.conf')

.PHONY: build
build:
	container-build ${NAME}

.PHONY: name
name:
	@echo ${NAME}

.PHONY: create
create:
	podman create --name=${NAME} \
					--label=persistent \
					--dns ${CONFIG_DNS} \
					--dns 8.8.8.8 \
					--cap-drop ALL \
					--security-opt no-new-privileges \
					--security-opt seccomp=unconfined \
					--shm-size 2g \
					--tmpfs /run \
					--tmpfs /run/user/$$(id -u) \
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
	podman cp "${CONFIG_FILE}" "${NAME}:/etc/krb5.conf.d"

.PHONY: clean
clean:
	podman rm ${NAME}
