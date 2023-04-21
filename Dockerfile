FROM --platform=$BUILDPLATFORM swift:5.8-jammy

WORKDIR /swift-format
RUN env DEBIAN_FRONTEND=noninteractive apt-get update
RUN env DEBIAN_FRONTEND=noninteractive apt-get install wget
RUN wget -q -O - https://github.com/apple/swift-format/archive/508.0.0.tar.gz | tar zxf - --strip-components 1
RUN swift build --configuration release

FROM --platform=$BUILDPLATFORM ubuntu:jammy
COPY --from=0 /swift-format/.build/*/release/swift-format /usr/bin
ENTRYPOINT ["/usr/bin/swift-format"]
