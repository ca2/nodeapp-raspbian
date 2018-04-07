#!/bin/bash
dir=$(dirname "$(readlink -f "$0")")
file='/libaura.so'
objcopy --strip-debug $dir$file
file='/libdraw2d_cairo.so'
objcopy --strip-debug $dir$file
file='/quasar_science_update_utility'
objcopy --strip-debug $dir$file