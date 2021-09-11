#!/bin/sh

source ../../utils/imovo-utils-global-imovo-config.sh
install_prefix="${imovo_config_prefix}/gdev-c-utils"

export PKG_CONFIG_PATH="${install_prefix}/lib64/pkgconfig"

# At least for g-ir-scanner.
export XDG_DATA_DIRS="${install_prefix}/share:${XDG_DATA_DIRS}"

export LD_LIBRARY_PATH="${install_prefix}/lib64"

pushd ../../modules/
./tepl.sh 'gdev-c-utils'
popd
