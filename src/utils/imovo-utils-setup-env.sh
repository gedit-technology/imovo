#!/bin/sh

if test $# -ne 1
then
	echo "$0: wrong number of arguments." 1>&2
	exit 1
fi

_product="$1"

source ./imovo-utils-global-imovo-config.sh
_install_prefix="${imovo_config_prefix}/${_product}"

export PKG_CONFIG_PATH="${_install_prefix}/lib64/pkgconfig"
export XDG_DATA_DIRS="${_install_prefix}/share:${XDG_DATA_DIRS}"
export LD_LIBRARY_PATH="${_install_prefix}/lib64"
