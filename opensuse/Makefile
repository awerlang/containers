.PHONY: build
build:
	container-build opensuse

.PHONY: update
update:
	@echo '> Pulling latest image' | grep --color=always .
	podman pull opensuse/tumbleweed
