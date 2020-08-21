.PHONY: build
build:
	@echo '> Building the image' | grep --color=always .
	docker-build displaycal

.PHONY: run
run:
	@docker run --rm \
				--env "DISPLAY=${DISPLAY}" \
				--volume=/tmp/.X11-unix:/tmp/.X11-unix:ro \
				--volume=${XAUTHORITY}:/home/user/.Xauthority:ro \
				--env "XAUTHORITY=/home/user/.Xauthority" \
				awerlang/displaycal
