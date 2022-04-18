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
./imovo-utils-prepare-module-source-git-repo-cache.sh 'gnome-latex' 'main' || exit 1
popd

pushd "${imovo_config_git_repos_cache_location}/gnome-latex/" || exit 1
./autogen.sh --prefix="${install_prefix}" --enable-introspection=yes --enable-vala=yes --disable-code-coverage --enable-gtk-doc || exit 1
make -j`nproc` || exit 1
make install || exit 1
make -j`nproc` check || exit 1
popd
