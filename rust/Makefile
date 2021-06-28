.PHONY: build
build:
	container-build rust

.PHONY: clean
clean:
	@echo '> Removing the shared cache' | grep --color=always .
	podman rm rust
