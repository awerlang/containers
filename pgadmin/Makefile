NAME := pgadmin
IMAGE := dpage/pgadmin4

.PHONY: build
build:

.PHONY: name
name:
	@echo ${NAME}

.PHONY: create
create:
	@podman create --name=${NAME} \
					--label=persistent \
					--publish 5432:80 \
					--env 'PGADMIN_DEFAULT_EMAIL=user@domain.com' \
					--env 'PGADMIN_DEFAULT_PASSWORD=SuperSecret' \
					-d ${IMAGE} >/dev/null					

.PHONY: run
run:

.PHONY: clean
clean:
	podman rm ${NAME}
