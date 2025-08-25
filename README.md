<!--
SPDX-FileCopyrightText: © 2025 Ashley Hawkins <awhawkins@proton.me>
SPDX-License-Identifier: CC-BY-2.0
-->

# MSVC-Wine CMake Example

This is a repo to show an example of using a CMake toolchain file in order to use [@mstorsjo](https://github.com/mstorsjo)'s MSVC-Wine with CMake using your system-native Clang.

Basically, `./cmake-windows-wrapper.sh -B build && cmake --build build` so in other words just use the wrapper for configuring the build directory, and use the regular cmake command for everything else.

You can include some envvars to the call, like `FLAVOR=cc LLVM_ROOT=/usr/lib/llvm-17 BIN=/opt/msvc/bin/x64 ./cmake-windows-wrapper.sh` and obviously you can omit any of those options to use the defaults, or you can set them to a different value than the example there.

- The `LLVM_ROOT` is generally a path that contains a `bin/` folder which then contains `clang` and other LLVM programs. The default value of `LLVM_ROOT` is found based on the `clang` binary in your PATH. If there is no `clang` in your PATH then there will be no default, and a `LLVM_ROOT` will need to be provided.
- The `FLAVOR` is either `cc` or `cl`, which correspond respectively to the usage of the g**cc**-compatible and the **cl**.exe-compatible (MSVC) frontends for Clang. The default `FLAVOR` is `cl`, because duh, MSVC.  
- The `BIN` is the msvc-wine bin directory, which would contain `msvcenv.sh`. It defaults to `~/.msvc/bin/x64` because that's the path I use personally.

# Copyright

This repo is compliant with the REUSE specification.
