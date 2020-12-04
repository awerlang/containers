.PHONY: build
build:
	@echo '> Building the image' | grep --color=always .
	container-build rust

.PHONY: clean
clean:
	@echo '> Removing the shared cache' | grep --color=always .
	podman rm rust
