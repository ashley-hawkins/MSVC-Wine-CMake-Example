#!/bin/bash
# SPDX-FileCopyrightText: © 2025 Ashley Hawkins <awhawkins@proton.me>
#
# SPDX-License-Identifier: CC0-1.0

# To be used with msvc-wine by Martin Storsjo
# Example usage: LLVM_ROOT=/usr/lib/llvm-18 BIN=/some/path/to/msvc/bin/x64 cmake-windows-wrapper.sh -G Ninja -S . -B build

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

LLVM_ROOT="${LLVM_ROOT:-/usr/lib/llvm-19}"
BIN="${BIN:-$HOME/.msvc/bin/x64}"

. "$BIN/msvcenv.sh"

TOOLCHAIN="$DIR/cmake/MsvcenvNativeCl.cmake"

ARCH=$ARCH \
LLVM_ROOT=$LLVM_ROOT \
cmake -DCMAKE_TOOLCHAIN_FILE=$TOOLCHAIN "$@"
