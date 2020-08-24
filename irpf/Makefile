YEAR := $(shell find * -maxdepth 1 -type d | tail -n 1)
NAME := irpf-${YEAR}
IMAGE := awerlang/${NAME}

.PHONY: build
build:
	@echo '> Building the image' | grep --color=always .
	docker-build ${NAME} ${YEAR}

.PHONY: name
name:
	@echo ${NAME}

.PHONY: create
create:
	@mkdir -p ${HOME}/Documents/IRPF/ProgramasRFB

	@docker create --name=${NAME} \
					--label=persistent \
					--cap-drop ALL \
					--security-opt no-new-privileges \
					--userns=keep-id \
					--volume=/etc/localtime:/etc/localtime:ro \
					--volume=/tmp/.X11-unix:/tmp/.X11-unix:ro \
					--volume=${HOME}/Documents/IRPF/ProgramasRFB:/home/user/ProgramasRFB \
					--env "DISPLAY=${DISPLAY}" \
					${IMAGE} >/dev/null

.PHONY: run
run:
	@copy_Xauthority trusted ${NAME}

.PHONY: clean
clean:
	docker rm $$(docker ps --all --format '{{.Names}}' | grep -w irpf)
