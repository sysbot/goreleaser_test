all: release

release:
	docker run --rm --privileged \
		-v $(PWD):/work/gorelease \
		-v /var/run/docker.sock:/var/run/docker.sock \
		-w /work/gorelease \
		-e GITHUB_TOKEN \
		-e DOCKER_USERNAME \
		-e DOCKER_PASSWORD \
		-e DOCKER_REGISTRY \
		goreleaser/goreleaser release
