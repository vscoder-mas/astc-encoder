#!/bin/bash

# Select your compiler (clang++ recommended, but g++ works)
export CXX=g++

# Create a build directory
rm -rf build
mkdir build
cd build

# Configure your build of choice, for example:

# # Arm arch64
# cmake -G "Unix Makefiles" -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=../ \
#     -DASTCENC_ISA_NEON=ON ..

# x86-64
cmake -G "Unix Makefiles" -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=../ \
    -DASTCENC_ISA_AVX2=ON -DASTCENC_ISA_SSE41=ON -DASTCENC_ISA_SSE2=ON ..

# # macOS universal binary build
# cmake -G "Unix Makefiles" -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=../ ..

make install -j16

cmake --build . --config Release
# Optionally install the binaries to the installation directory
cmake --install . --config Release



