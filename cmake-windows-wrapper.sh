#!/bin/bash
# SPDX-FileCopyrightText: © 2025 Ashley Hawkins <awhawkins@proton.me>
#
# SPDX-License-Identifier: CC0-1.0

# To be used with msvc-wine by Martin Storsjo
# Example usage: LLVM_ROOT=/usr/lib/llvm-18 BIN=/some/path/to/msvc/bin/x64 cmake-windows-wrapper.sh -G Ninja -S . -B build

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

CLANG_PATH=$(which clang)

if [ $? -ne 0 ] && [ ! -e "$LLVM_ROOT" ]; then
	echo "Couldn't find clang in PATH, and no LLVM_ROOT was provided."
	exit 1
else
	LLVM_ROOT_DEFAULT="$( dirname $( realpath "$CLANG_PATH" ) )/.."
fi

LLVM_ROOT="${LLVM_ROOT:-$LLVM_ROOT_DEFAULT}"
BIN="${BIN:-$HOME/.msvc/bin/x64}"

. "$BIN/msvcenv.sh"

TOOLCHAIN="$DIR/cmake/MsvcenvNative.cmake"

FLAVOR=${FLAVOR:-cl} \
ARCH=$ARCH \
LLVM_ROOT=$LLVM_ROOT \
cmake -DCMAKE_TOOLCHAIN_FILE=$TOOLCHAIN "$@"
