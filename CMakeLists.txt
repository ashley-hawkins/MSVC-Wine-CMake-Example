# SPDX-FileCopyrightText: © 2025 Ashley Hawkins <awhawkins@proton.me>
# SPDX-License-Identifier: CC0-1.0

cmake_minimum_required(VERSION 3.15)
project(WineMsvcCmakeExample VERSION 0.1.0 LANGUAGES C)

add_executable(${PROJECT_NAME} WIN32 src/main.c)
