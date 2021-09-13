#!/bin/sh

if test $# -ne 1
then
	echo "$0: wrong number of arguments." 1>&2
	exit 1
fi

product="$1"

source ./imovo-utils-global-imovo-config.sh
install_prefix="${imovo_config_prefix}/${product}"

export PKG_CONFIG_PATH="${install_prefix}/lib64/pkgconfig"
export XDG_DATA_DIRS="${install_prefix}/share:${XDG_DATA_DIRS}"
export LD_LIBRARY_PATH="${install_prefix}/lib64"
