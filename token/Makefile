NAME := token

.PHONY: build name install start enter stop remove clean
build name install start enter stop remove clean:
	@containerctl $@ ${NAME}

.PHONY: create
create:
	containerctl create ${NAME} \
		--volume=/run/pcscd:/run/pcscd:ro \
		--env "LANG=pt_BR.UTF-8" \
		--env "LANGUAGE=pt_BR:en_US:en"

.PHONY: run
run:
	systemctl is-active pcscd.service || sudo systemctl start pcscd.service
	@copy_Xauthority trusted ${NAME}
