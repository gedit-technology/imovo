#!/bin/sh

if test $# -ne 4
then
	echo "$0: wrong number of arguments." 1>&2
	exit 1
fi

product="$1"
module="$2"

# See the WARNING in imovo-utils-prepare-module-source-git-repo-cache.sh.
module_git_ref="$3"

meson_args="$4"

source ./imovo-utils-global-imovo-config.sh
install_prefix="${imovo_config_prefix}/${product}"

./imovo-utils-prepare-module-source-git-repo-cache.sh "${module}" "${module_git_ref}" || exit 1

pushd "${imovo_config_git_repos_cache_location}/${module}/" || exit 1

# -p to avoid error message "File exists" in case the build/ dir already exists.
mkdir -p build || exit 1

pushd build/ || exit 1
meson setup --prefix "${install_prefix}" ${meson_args} || exit 1
ninja || exit 1
# ninja test || exit 1 # before install
ninja install || exit 1
ninja test || exit 1 # after install
popd
popd
