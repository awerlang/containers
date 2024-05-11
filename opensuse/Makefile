.PHONY: build
build: update
	container-build opensuse

.PHONY: update
update:
	@echo '> Pulling latest image' | grep --color=always .
	podman pull opensuse/tumbleweed
