.PHONY: build
build:
	@echo '> Building the image' | grep --color=always .
	docker build -t awerlang/http-proxy context

.PHONY: update
update:
	@echo '> Pulling latest image' | grep --color=always .
	docker pull nginx

.PHONY: clean
clean:
	@echo '> Stopping the local proxy' | grep --color=always .
	docker stop local_proxy
