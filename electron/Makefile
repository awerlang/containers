NAME := electron
IMAGE := awerlang/${NAME}
uid := $(shell id -u)
gid := $(shell id -g)

.PHONY: build
build:
	@echo '> Building the image' | grep --color=always .
	docker-build ${NAME} ./context

.PHONY: name
name:
	@echo ${NAME}

.PHONY: create
create:
	@docker create --name=${NAME} \
					--label=persistent \
					--cap-drop ALL \
					--cap-add SETUID \
					--cap-add SETGID \
					--security-opt no-new-privileges \
					--shm-size 2g \
					--tmpfs /run \
					--tmpfs /run/user/${uid}:uid=${uid},gid=${gid},mode=700 \
					--volume=/etc/localtime:/etc/localtime:ro \
					--volume=/run/user/${uid}/pulse:/run/user/${uid}/pulse:ro \
					--volume=/tmp/.X11-unix:/tmp/.X11-unix:ro \
					--env "DISPLAY" \
					--env "LANG=pt_BR.UTF-8" \
					--init \
					${IMAGE} >/dev/null

.PHONY: run
run:
	@copy_Xauthority untrusted ${NAME}

.PHONY: clean
clean:
	docker rm ${NAME}
