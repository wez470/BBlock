builder_image := b-block/ebpf-builder:latest

.PHONY: builder-image
image: Dockerfile
	docker build -t $(builder_image) -f Dockerfile .

build-docker: image
	docker run \
		--privileged \
		-v ./:/workspace \
		-w /workspace \
		--rm \
		${builder_image} \
			make build_ebpf_direct

.PHONY: build
build:
	go generate internal/bblock.go