#!/bin/sh

set -eu

build_output_dir="/build/output"
binary_output_path="${build_output_dir}/memory_consumer"

if [ ! -d "${build_output_dir}" ]; then
    echo >&2 "You must bind mount $(pwd)${build_output_dir} into the container at ${build_output_dir}"
    exit 1
fi

cd /tmp

g++ -o memory_consumer -std=gnu++11 -static -fno-exceptions -Os main.cpp && strip memory_consumer

mv memory_consumer "${binary_output_path}"

echo "Wrote binary to ${binary_output_path}"
