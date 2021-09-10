#!/bin/sh

tarball_filename="$1"

source ./imovo-utils-global-imovo-config.sh

rm -rf "${imovo_config_tmp_dir}"
mkdir -p "${imovo_config_tmp_dir}"

cp "${imovo_config_tarballs_location}/${tarball_filename}" "${imovo_config_tmp_dir}/"

pushd "${imovo_config_tmp_dir}/"
tar xf "${tarball_filename}"
popd
