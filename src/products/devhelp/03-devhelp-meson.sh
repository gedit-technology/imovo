#!/bin/sh

install_prefix=~/.imovo/devhelp

# To find Amtk's *.pc file.
export PKG_CONFIG_PATH="${install_prefix}/lib64/pkgconfig"

meson --prefix "${install_prefix}"
