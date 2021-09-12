#!/bin/sh

if test $# -ne 1
then
	echo "$0: wrong number of arguments." 1>&2
	exit 1
fi

tarball_filename="$1"

source ./imovo-utils-global-imovo-config.sh

rm -rf "${imovo_config_tmp_dir}" || exit 1
mkdir -p "${imovo_config_tmp_dir}" || exit 1

cp "${imovo_config_tarballs_location}/${tarball_filename}" "${imovo_config_tmp_dir}/" || exit 1

pushd "${imovo_config_tmp_dir}/"
tar xf "${tarball_filename}" || exit 1
popd
