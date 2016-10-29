# memory_consumer - Memory Consumption as a Service

This program just consumes however many megabytes of memory you specify and then sleeps forever.

It might be useful for simulating high memory usage situations or triggering OOMs during testing.

The Docker image is only **600kb**!

## Usage

NOTE: The default target in `Makefile` assumes Docker is installed.  If not, check out `build/build.sh` for the `g++` invocation.

```sh
make
./build/output/memory_consumer 1024 # allocates 1gb of memory
```

Or just run the image right from my Docker Hub account:

```sh
docker run billrobinson/memory_consumer 1024 # allocates 1gb of memory
```

## License

BSD
