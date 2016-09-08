# memory_consumer - Memory Consumption as a Service

This program just consumes however many megabytes of memory you specify and then sleeps forever.

## Usage

```sh
make
./memory_consumer 1024 # allocates 1gb of memory
```

Or, via Docker:

```sh
docker run billrobinson/memory_consumer 1024 # allocates 1gb of memory
```

## TODO

- [ ] Only install packages necessary to compile the binary rather than using the _build-base_ package.
- [ ] Uninstall any packages not required to run the binary (libstdc++, etc.)

## License

BSD
