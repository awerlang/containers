.PHONY: build
build:
	@echo '> Building the image' | grep --color=always .
	docker-build rust

.PHONY: clean
clean:
	@echo '> Removing the shared cache' | grep --color=always .
	docker rm rust
