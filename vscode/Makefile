NAME := vscode

.PHONY: build name start enter stop remove clean
build name start enter stop remove clean:
	@containerctl $@ ${NAME}

.PHONY: create
create:
	containerctl create ${NAME} \
		--mount type=tmpfs,dst=${XDG_RUNTIME_DIR},chown=true,tmpfs-mode=0700 \
		--userns=keep-id \
		--volume=${HOME}/src:/src \
		--volume=${HOME}/.ssh:/home/user/.ssh \
		--env "XDG_RUNTIME_DIR"

.PHONY: run
run:
	@copy_Xauthority trusted ${NAME}
	podman cp ~/.config/git ${NAME}:/home/user/.config/
