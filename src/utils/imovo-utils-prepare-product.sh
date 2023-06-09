#!/bin/sh

if test $# -ne 1
then
	echo "$0: wrong number of arguments." 1>&2
	exit 1
fi

product_name="$1"

source ./imovo-utils-global-imovo-config.sh

install_prefix="${imovo_config_prefix}/${product_name}"
rm -rf "${install_prefix}" || exit 1
mkdir -p "${install_prefix}" || exit 1
