NAME := warsaw

.PHONY: build name install start enter stop remove clean
build name install start enter stop remove clean:
	@containerctl $@ ${NAME}

.PHONY: create
create:
	containerctl create ${NAME} \
		--cap-add SETUID \
		--cap-add SETGID \
		--cap-add AUDIT_WRITE \
		--cap-add DAC_OVERRIDE \
		--cap-add CHOWN \
		--env "LANG=pt_BR.UTF-8" \
		--env "LANGUAGE=pt_BR:en_US:en" \
		--env "LC_ALL=pt_BR.UTF-8"

.PHONY: run
run:
	@copy_Xauthority trusted ${NAME}
