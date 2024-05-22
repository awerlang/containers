NAME := azure

include ../.env
export $(shell sed 's/=.*//' ../.env)

CONFIG_FILE := $(shell find ${WORKSPACE_PATH}/.config/azure/ -name 'krb5-*.conf')

.PHONY: build name install start enter stop remove clean
build name install start enter stop remove clean:
	@containerctl $@ ${NAME}

.PHONY: create
create:
	containerctl create ${NAME} \
		--dns ${CONFIG_DNS} \
		--dns 8.8.8.8 \
		--mount type=tmpfs,dst=${XDG_RUNTIME_DIR},chown=true,tmpfs-mode=0700 \
		--userns=keep-id \
		--volume=${HOME}/src:/src \
		--env "XDG_RUNTIME_DIR"

.PHONY: run
run:
	@copy_Xauthority trusted ${NAME}
	podman cp "${CONFIG_FILE}" "${NAME}:/etc/krb5.conf.d"
