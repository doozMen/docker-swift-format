FROM swift:5.4-focal

WORKDIR /swift-format
RUN env DEBIAN_FRONTEND=noninteractive apt-get update
RUN env DEBIAN_FRONTEND=noninteractive apt-get install wget
RUN wget -q -O - https://github.com/apple/swift-format/archive/0.50400.0.tar.gz | tar zxf - --strip-components 1
RUN swift build --configuration release

FROM swift:5.4-focal-slim
RUN env DEBIAN_FRONTEND=noninteractive apt-get update && \
env DEBIAN_FRONTEND=noninteractive apt-get install -y libz3-4 && \
env DEBIAN_FRONTEND=noninteractive apt-get clean && \
rm -rf /var/lib/apt/lists/*
COPY --from=0 /swift-format/.build/x86_64-unknown-linux-gnu/release/swift-format /usr/bin
ENTRYPOINT ["/usr/bin/swift-format"]
