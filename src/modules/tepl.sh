#!/bin/sh

product="$1"
source ../utils/imovo-utils-global-imovo-config.sh
install_prefix="${imovo_config_prefix}/${product}"

pushd ../utils/
./imovo-utils-prepare-module-source-git.sh 'tepl' 'master'
popd

pushd "${imovo_config_tmp_dir}/tepl/"
mkdir build
pushd build/
meson --prefix "${install_prefix}" || exit 1
ninja || exit 1
ninja test || exit 1 # before install
ninja install || exit 1
ninja test || exit 1 # after install
popd
popd
