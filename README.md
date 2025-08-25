# Msvc-Wine CMake Example

This is a repo to show an example of using a CMake toolchain file in order to use [@mstorsjo](https://github.com/mstorsjo)'s MSVC-Wine with CMake using your system-native Clang.

Basically, `./cmake-windows-wrapper.sh -B build && cmake --build build` so in other words just use the wrapper for configuring the build directory, and use the regular cmake command for everything else.

You can include some envvars to the call, like `FLAVOR=Cc LLVM_ROOT=/usr/lib/llvm-17 BIN=/opt/msvc/bin/x64 ./cmake-windows-wrapper.sh` and obviously you can omit any of those options to use the defaults, or you can set them to a different value than the example there.

The default LLVM\_ROOT is based on the `clang` binary in your PATH. It's generally a path that contains a `bin/` folder that contains `clang`  
The FLAVOR is either `Cc` or `Cl`, which correspond to the gcc-compatible and the cl.exe-compatible (MSVC) frontends for Clang. The default FLAVOR is Cl, because duh.  
The default BIN is ~/.msvc/bin/x64 because that's the path I use personally.

# Copyright

This repo is compliant with the REUSE specification.
