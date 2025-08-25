# SPDX-FileCopyrightText: © 2025 Ashley Hawkins <awhawkins@proton.me>
# SPDX-License-Identifier: LGPL-3.0-only

if (DEFINED ENV{LLVM_ROOT} AND NOT DEFINED LLVM_ROOT)
    set(LLVM_ROOT "$ENV{LLVM_ROOT}" CACHE PATH "Path to LLVM installation")
elseif(NOT DEFINED LLVM_ROOT)
    message(FATAL_ERROR "LLVM_ROOT environment variable not set")
endif()

if(DEFINED ENV{ARCH} AND NOT DEFINED _MSVCENV_TARGET_ARCH)
    if("$ENV{ARCH}" STREQUAL "x86")
        set(TARGET_ARCH "i686")
    elseif("$ENV{ARCH}" STREQUAL "x64")
        set(TARGET_ARCH "x86_64")
    elseif("$ENV{ARCH}" STREQUAL "arm")
        set(TARGET_ARCH "armv7")
    elseif("$ENV{ARCH}" STREQUAL "arm64")
        set(TARGET_ARCH "aarch64")
    else()
        message(FATAL_ERROR "Unknown ARCH value: $ENV{ARCH}")
    endif()
    set(_MSVCENV_TARGET_ARCH "${TARGET_ARCH}" CACHE STRING "Target architecture for cross-compilation")
elseif(NOT DEFINED _MSVCENV_TARGET_ARCH)
    message(FATAL_ERROR "ARCH environment variable not set")
endif()

set(TARGET_TRIPLE "${_MSVCENV_TARGET_ARCH}-windows-msvc")

set(CMAKE_CROSSCOMPILING TRUE)
set(CMAKE_SYSTEM_NAME Windows)
set(CMAKE_SYSTEM_PROCESSOR "${_MSVCENV_TARGET_ARCH}")

if(DEFINED ENV{INCLUDE} AND NOT DEFINED _MSVCENV_INCLUDE_DIRS)
    set(_MSVCENV_INCLUDE_DIRS "$ENV{INCLUDE}" CACHE STRING "Include directories for MSVC environment")
elseif(NOT DEFINED _MSVCENV_INCLUDE_DIRS)
    message(FATAL_ERROR "INCLUDE environment variable not set")
endif()

foreach(dir IN LISTS _MSVCENV_INCLUDE_DIRS)
    string(REPLACE "\\" "/" dir "${dir}")

    if(dir MATCHES "^z:/")
        string(REGEX REPLACE "^z:" "" dir "${dir}")
    endif()

    include_directories(SYSTEM "${dir}")
endforeach()

if(DEFINED ENV{LIB} AND NOT DEFINED _MSVCENV_LIB_DIRS)
    set(_MSVCENV_LIB_DIRS "$ENV{LIB}" CACHE STRING "Library directories for MSVC environment")
elseif(NOT DEFINED _MSVCENV_LIB_DIRS)
    message(FATAL_ERROR "LIB environment variable not set")
endif()

foreach(dir IN LISTS _MSVCENV_LIB_DIRS)
    string(REPLACE "\\" "/" dir "${dir}")

    if(dir MATCHES "^z:")
        string(REGEX REPLACE "^z:" "" dir "${dir}")
    endif()

    link_directories("${dir}")
endforeach()

set(CMAKE_C_FLAGS   "--target=${TARGET_TRIPLE} ${CMAKE_C_FLAGS}")
set(CMAKE_CXX_FLAGS "--target=${TARGET_TRIPLE} ${CMAKE_CXX_FLAGS}")

set(CMAKE_RC_COMPILER "${LLVM_ROOT}/bin/llvm-rc")
set(CMAKE_ASM_MASM_COMPILER "${LLVM_ROOT}/bin/llvm-ml")
set(CMAKE_MT "${LLVM_ROOT}/bin/llvm-mt")
set(CMAKE_CXX_FLAGS "--target=${TARGET_TRIPLE} ${CMAKE_CXX_FLAGS}")

set(CMAKE_RC_COMPILER "${LLVM_ROOT}/bin/llvm-rc")
set(CMAKE_ASM_MASM_COMPILER "${LLVM_ROOT}/bin/llvm-ml")
set(CMAKE_MT "${LLVM_ROOT}/bin/llvm-mt")
