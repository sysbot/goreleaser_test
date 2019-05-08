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

changelog:
	docker run --rm \
		--interactive \
		--tty \
		-e "CHANGELOG_GITHUB_TOKEN=${GITHUB_TOKEN}" \
		-v "$(PWD):/usr/local/src/your-app" \
		ferrarimarco/github-changelog-generator:1.14.3 \
				-u sysbot \
				-p goreleaser_test \
				--author \
				--compare-link \
				--github-site=https://github.com \
				--unreleased-label "**Next release**" \
				--future-release=v1.8.6
