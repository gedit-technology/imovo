#!/bin/sh

if test $# -ne 1
then
	echo "$0: wrong number of arguments." 1>&2
	exit 1
fi

version="$1"

source ../utils/imovo-utils-global-imovo-config.sh

pushd "${imovo_config_git_repos_orig_location}/gtksourceview"
git clean -Xdf

# My old script had also: --disable-Werror
./autogen.sh --enable-introspection=yes --enable-vala=yes --enable-gtk-doc \
	--enable-glade-catalog

make -j`nproc`
make -j`nproc` distcheck
mv "gtksourceview-${version}.tar.xz" "${imovo_config_new_tarballs_location}"
git reset --hard HEAD
popd
