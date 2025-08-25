# SPDX-FileCopyrightText: © 2025 Ashley Hawkins <awhawkins@proton.me>
# SPDX-License-Identifier: CC0-1.0

include("${CMAKE_CURRENT_LIST_DIR}/MsvcenvNativeBase.cmake")

set(CMAKE_C_COMPILER "${LLVM_ROOT}/bin/clang-cl")
set(CMAKE_CXX_COMPILER "${LLVM_ROOT}/bin/clang-cl")
