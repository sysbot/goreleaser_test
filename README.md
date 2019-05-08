# goreleaser_test
test

## Release

Ensure that local branch/directories have no unchecked in files.

```
export GITHUB_TOKEN=`YOUR_TOKEN`

git tag -a v0.1.0 -m "First release"
git push origin v0.1.0

# preview
goreleaser --rm-dist --debug --skip-validate --skip-publish

# actually create the packages and publish the release
goreleaser

```
