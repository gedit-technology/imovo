#!/bin/sh

if test $# -ne 1
then
	echo "$0: wrong number of arguments." 1>&2
	exit 1
fi

product="$1"

source ../utils/imovo-utils-global-imovo-config.sh
install_prefix="${imovo_config_prefix}/${product}"

pushd ../utils/
./imovo-utils-prepare-module-source-git-repo-cache.sh 'gnome-latex' 'master'
popd

pushd "${imovo_config_git_repos_cache_location}/gnome-latex/"
./autogen.sh --prefix="${install_prefix}" --enable-introspection --enable-vala --disable-dconf-migration || exit 1
make || exit 1
make check || exit 1 # before install
make install || exit 1
make check || exit 1 # after install
popd
