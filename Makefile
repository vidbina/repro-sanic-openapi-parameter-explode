SHELL = /bin/sh

DOCKER ?= docker
RM ?= rm -rf

DOCKER_IMAGE = repro-sanic-openapi-parameter-explode

.PHONY: image/dev
image/dev: Dockerfile
	$(DOCKER) build --rm --tag=$(DOCKER_IMAGE):dev --target=dev .

.PHONY: image
image: Dockerfile
	$(DOCKER) build --rm --tag=$(DOCKER_IMAGE) .

.PHONY: bash
bash:
	$(DOCKER) run -it --rm \
		-u $(shell id -u):$(shell id -g) \
		--net=host \
		--entrypoint=bash \
		-v $(realpath .):/tmp/target \
		-v $(realpath .homedir):/tmp/home \
		-w /tmp/target \
		$(DOCKER_IMAGE):dev

.PHONY: all
all:
	$(DOCKER) run -it --rm \
		-u $(shell id -u):$(shell id -g) \
		-v $(realpath .):/tmp/repro \
		--net=host \
		$(DOCKER_IMAGE)

clean:
	$(RM) .homedir/.cache
