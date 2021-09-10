#!/bin/sh

filename="$1"
url="$2"

source ./imovo-utils-global-imovo-config.sh

tarball_path="${imovo_config_tarballs_location}/${filename}"

if test ! -f "${tarball_path}"
then
	mkdir -p "${imovo_config_tarballs_location}"
	curl --output "${tarball_path}" --location "${url}"
fi
