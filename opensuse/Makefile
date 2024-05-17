.PHONY: build clean
build: update
build clean:
	containerctl $@ opensuse

.PHONY: update
update:
	@echo '> Pulling latest image' | grep --color=always .
	podman pull opensuse/tumbleweed
