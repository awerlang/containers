.PHONY: build
build:
	@echo '> Building the image' | grep --color=always .
	podman build -t awerlang/http-proxy context

.PHONY: update
update:
	@echo '> Pulling latest image' | grep --color=always .
	podman pull nginx

.PHONY: clean
clean:
	@echo '> Stopping the local proxy' | grep --color=always .
	podman stop local_proxy
