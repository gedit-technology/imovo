#!/bin/sh

product="$1"
source ../utils/imovo-utils-global-imovo-config.sh
install_prefix="${imovo_config_prefix}/${product}"

tarball_url='https://github.com/gedit-org/gtksourceview/releases/download/4.0.40/gtksourceview-4.0.40.tar.xz'
tarball_filename='gtksourceview-4.0.40.tar.xz'

pushd ../utils/
./imovo-utils-cache-tarball.sh "${tarball_filename}" "${tarball_url}"
./imovo-utils-prepare-module-source-tarball.sh "${tarball_filename}"
popd

pushd "${imovo_config_tmp_dir}/gtksourceview-4.0.40/"
./configure --prefix="${install_prefix}" --enable-introspection=yes --enable-vala=yes || exit 1
popd