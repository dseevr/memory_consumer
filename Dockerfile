FROM scratch

WORKDIR /tmp

COPY build/output/memory_consumer /usr/bin/memory_consumer

ENTRYPOINT ["/usr/bin/memory_consumer"]
CMD [""]
