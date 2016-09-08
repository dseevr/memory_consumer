#include <chrono>
#include <csignal>
#include <cstdlib>
#include <iostream>
#include <thread>
#include <unistd.h>

[[ noreturn ]] void sigint_handler(int x) {
  exit(0);
}

int main(int argc, char *argv[]) {
    if(argc != 2) {
        std::cerr << "usage: " << argv[0] << " megabytes_to_allocate" << std::endl;
        std::cerr << "example (allocates 1gb of memory): " << argv[0] << " 1024" << std::endl;
        return 1;
    }

    signal(SIGINT, sigint_handler);

    char *blah;
    long mb;
    mb = strtol(argv[1], &blah, 10);

    if(mb < 1) {
        std::cerr << "megabytes_to_allocate must be >= 1" << std::endl;
        return 1;
    }

    std::cout << "Allocating " << mb << "mb... ";
    std::flush(std::cout);

    size_t size = mb * 1024 * 1024 * sizeof(char);

    char *foo = (char *)std::malloc(size);

    long page_size = sysconf(_SC_PAGE_SIZE);

    // touch every page so the physical memory is actually allocated to us
    for(size_t i = 0; i < size; i += page_size) {
        foo[i] = 0;
    }

    std::cout << "done." << std::endl;

    for(;;) {
        std::this_thread::sleep_for(std::chrono::seconds(1));
    }

    std::free(foo);

    return 0;
}
