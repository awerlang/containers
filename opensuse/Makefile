.PHONY: build
build:
	@echo '> Building the image' | grep --color=always .
	container-build opensuse

.PHONY: update
update:
	@echo '> Pulling latest image' | grep --color=always .
	podman pull opensuse/leap
