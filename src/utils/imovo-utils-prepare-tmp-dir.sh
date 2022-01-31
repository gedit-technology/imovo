#!/bin/sh

if test $# -ne 0
then
	echo "$0: wrong number of arguments." 1>&2
	exit 1
fi

source ./imovo-utils-global-imovo-config.sh

rm -rf "${imovo_config_tmp_dir}" || exit 1
mkdir -p "${imovo_config_tmp_dir}" || exit 1
