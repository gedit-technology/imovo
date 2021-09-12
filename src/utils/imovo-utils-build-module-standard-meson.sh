#!/bin/sh

if test $# -ne 3
then
	echo "$0: wrong number of arguments." 1>&2
	exit 1
fi

product="$1"
module="$2"
module_git_ref="$3"

source ./imovo-utils-global-imovo-config.sh
install_prefix="${imovo_config_prefix}/${product}"

./imovo-utils-prepare-module-source-git.sh "${module}" "${module_git_ref}" || exit 1

pushd "${imovo_config_tmp_dir}/${module}/" || exit 1
mkdir -p build || exit 1
pushd build/ || exit 1
meson --prefix "${install_prefix}" || exit 1
ninja || exit 1
ninja test || exit 1 # before install
ninja install || exit 1
ninja test || exit 1 # after install
popd
popd
