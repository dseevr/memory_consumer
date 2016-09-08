FROM alpine:latest

RUN apk add --update build-base

COPY main.cpp /tmp/main.cpp
COPY Makefile /tmp/Makefile

WORKDIR /tmp

RUN make && mv memory_consumer /usr/bin/memory_consumer && rm Makefile && rm main.cpp

ENTRYPOINT ["/usr/bin/memory_consumer"]
CMD [""]
