OUTPUT=memory_consumer

.PHONY: all clean

all: build

build: clean
	g++ -std=gnu++11 -fno-exceptions -Os main.cpp -o $(OUTPUT)

clean:
	rm -f $(OUTPUT)
