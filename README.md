# Msvc-Wine CMake Example

Basically, `./cmake-windows-wrapper.sh -B build && cmake --build build` so in other words just use the wrapper for CMake configure commands and then use the regular cmake command for everything else.

Or you can include some envvars, like `FLAVOR=Cc LLVM_ROOT=/usr/lib/llvm-17 BIN=/opt/msvc/bin/x64 ./cmake-windows-wrapper.sh` and obviously you can omit any of those options or set them to a different value (flavor is either Cc or Cl, where Cc is the gcc-compatible clang frontend, and Cl is the cl-compatible clang frontend. Cl is the default in that case, because duh.

# Copyright

This repo is compliant with the REUSE specification.
