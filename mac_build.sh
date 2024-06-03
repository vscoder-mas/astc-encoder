#!/bin/bash

# Create a build directory
rm -rf build
mkdir build
cd build

# Configure a universal build
cmake -G Xcode -DCMAKE_INSTALL_PREFIX=../ ..

cmake --build . --config Release

# Optionally install the binaries to the installation directory
cmake --install . --config Release




