# docker-swift-format

[![Docker Hub](https://img.shields.io/docker/v/mtgto/swift-format)](https://hub.docker.com/r/mtgto/swift-format/)

Unofficial docker image of [apple/swift-format](https://github.com/apple/swift-format).

## Usage

To run the `swift-format` tool, you can use the `mtgto/swift-format` image. This image includes only the tool itself, without the Swift language. However, if you need to use it in a CI environment like GitLab, it is recommended to use the `doozmen/swift-format` image.

## In ci

Every ci is different but here is an example of how to use it in gitlab ci.

```yaml
image: doozmen/swift-format:latest # Unofficial Swift Docker image that includes build of apple/swift-format

swift-test:
  script:
    - swift --version
    - swift-format --version
```

````console
### Lint

```console
$ docker run --rm --workdir=/work --volume=$PWD:/work mtgto/swift-format:5.10 lint --recursive .
````

### Format

```console
$ docker run --rm --workdir=/work --volume=$PWD:/work mtgto/swift-format:5.10 format --in-place --recursive .
```

## Development

### Build & Push

```console
docker buildx build --platform linux/arm64/v8,linux/amd64 -t mtgto/swift-format:latest -t mtgto/swift-format:5.10 --push .
```
