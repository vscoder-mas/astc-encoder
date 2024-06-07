#!/bin/bash

ANDROID_ABI=arm64-v8a
BUILD_TYPE=RelWithDebInfo
BUILD_DIR=build

rm -rf bin
rm -rf ${BUILD_DIR}
mkdir -p ${BUILD_DIR}
cd ${BUILD_DIR}

cmake \
    -DCMAKE_INSTALL_PREFIX=./ \
    -DCMAKE_BUILD_TYPE=${BUILD_TYPE} \
    -DCMAKE_TOOLCHAIN_FILE=${ANDROID_NDK}/build/cmake/android.toolchain.cmake \
    -DANDROID_ABI=${ANDROID_ABI} \
    -DANDROID_ARM_NEON=ON \
    -DANDROID_PLATFORM=android-21 \
    -DCMAKE_ANDROID_NDK_TOOLCHAIN_VERSION=clang \
    -DANDROID_TOOLCHAIN=clang \
    -DANDROID_STL=c++_static \
    -DARCH=aarch64 \
    -DASTCENC_ISA_NEON=ON \
    ..

make -j16



