#!/bin/sh

if test $# -ne 1
then
	echo "$0: wrong number of arguments." 1>&2
	exit 1
fi

product="$1"

source ../utils/imovo-utils-global-imovo-config.sh
install_prefix="${imovo_config_prefix}/${product}"

tarball_filename='gtksourceview-4.0.41.tar.xz'

pushd ../utils/
./imovo-utils-prepare-module-source-tarball.sh "${tarball_filename}" || exit 1
popd

pushd "${imovo_config_tmp_dir}/gtksourceview-4.0.41/" || exit 1
./configure --prefix="${install_prefix}" --enable-introspection=yes --enable-vala=yes || exit 1
make -j`nproc` || exit 1
make install || exit 1
make -j`nproc` check || exit 1
popd
