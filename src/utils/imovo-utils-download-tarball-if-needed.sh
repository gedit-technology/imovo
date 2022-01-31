#!/bin/sh

if test $# -ne 2
then
	echo "$0: wrong number of arguments." 1>&2
	exit 1
fi

filename="$1"
url="$2"

source ./imovo-utils-global-imovo-config.sh

tarball_path="${imovo_config_tarballs_location}/${filename}"

if test ! -f "${tarball_path}"
then
	mkdir -p "${imovo_config_tarballs_location}" || exit 1
	curl --output "${tarball_path}" --location "${url}" || exit 1
fi
