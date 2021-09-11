#!/bin/sh

source ../../utils/imovo-utils-global-imovo-config.sh
install_prefix="${imovo_config_prefix}/gnome-latex"

export PKG_CONFIG_PATH="${install_prefix}/lib64/pkgconfig"

# At least for g-ir-scanner.
export XDG_DATA_DIRS="${install_prefix}/share:${XDG_DATA_DIRS}"

pushd ../../modules/
./gnome-latex.sh 'gnome-latex'
popd
