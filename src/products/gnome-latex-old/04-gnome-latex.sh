#!/bin/sh

install_prefix=~/.imovo/gnome-latex

export PKG_CONFIG_PATH="${install_prefix}/lib64/pkgconfig"

# At least for g-ir-scanner.
export XDG_DATA_DIRS="${install_prefix}/share:${XDG_DATA_DIRS}"
