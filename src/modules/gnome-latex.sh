#!/bin/sh

product="$1"
source ../utils/imovo-utils-global-imovo-config.sh
install_prefix="${imovo_config_prefix}/${product}"

pushd ../utils/
./imovo-utils-prepare-module-source-git.sh 'gnome-latex' 'master'
popd

pushd "${imovo_config_tmp_dir}/gnome-latex/"
./autogen.sh --prefix="${install_prefix}" --enable-introspection --enable-vala --disable-dconf-migration || exit 1
make || exit 1
make check || exit 1 # before install
make install || exit 1
make check || exit 1 # after install
popd
