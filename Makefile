BUILD_DIR = _output
ROOT_DIR = $(abspath $(dir $(lastword $(MAKEFILE_LIST))))
DOCKER_WORKDIR = /go/src/github.com/velp/api-go-plugins/
DOCKER_IMAGE  = golang:1.8beta1-wheezy
BUILD_CMD = go get github.com/gin-gonic/gin && \
            go build -o $(BUILD_DIR)/api-go-plugins main.go && \
            go build -buildmode=plugin -o $(BUILD_DIR)/plugin.so plugin.go; \
            chown $(shell id -u):$(shell id -u) -R _output

.PHONY: build
build:
	mkdir -p $(BUILD_DIR)
	docker run --rm -it -v "$(ROOT_DIR):$(DOCKER_WORKDIR)" \
	-w "$(DOCKER_WORKDIR)" $(DOCKER_IMAGE) bash -xc '$(BUILD_CMD)'


.PHONY: clean
clean:
	rm -rf $(BUILD_DIR)

.PHONY: help
help:
	@echo "Usage: 'make <target>'"
	@echo ""
	@echo "Targets:"
	@echo "    help  - Print this message and exit"
	@echo "    build - Build project in docker container ith go 1.8beta"
	@echo "    clean - Delete binaries"

