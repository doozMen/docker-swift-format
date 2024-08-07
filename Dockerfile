FROM swiftlang/swift:nightly-6.0-jammy

WORKDIR /swift-format
RUN env DEBIAN_FRONTEND=noninteractive apt-get update
RUN env DEBIAN_FRONTEND=noninteractive apt-get install wget
RUN wget --quiet --output-document=- https://github.com/apple/swift-format/archive/510.1.0.tar.gz | tar zxf - --strip-components 1
RUN swift build --product swift-format --configuration release -Xswiftc -static-stdlib

RUN cp .build/release/swift-format /usr/local/bin/