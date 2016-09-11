OUTPUT=memory_consumer

.PHONY: all build clean

all: build

build: clean
	clang++ -std=gnu++11 -fno-exceptions -Os main.cpp -o $(OUTPUT)

clean:
	rm -f $(OUTPUT)
