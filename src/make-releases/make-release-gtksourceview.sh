#!/bin/sh

if test $# -ne 1
then
	echo "$0: wrong number of arguments." 1>&2
	exit 1
fi

version="$1"

source ../utils/imovo-utils-global-imovo-config.sh

pushd "${imovo_config_git_repos_orig_location}/gtksourceview" || exit 1
git clean -Xdf || exit 1

# My old script had also: --disable-Werror
./autogen.sh --enable-introspection=yes --enable-vala=yes --enable-gtk-doc || exit 1

make -j`nproc` || exit 1
make -j`nproc` distcheck || exit 1

mkdir -p "${imovo_config_new_tarballs_location}" || exit 1
mv "gtksourceview-${version}.tar.xz" "${imovo_config_new_tarballs_location}/" || exit 1

git reset --hard HEAD || exit 1
git clean -Xdf || exit 1
popd

echo
echo "OK: tarball rolled successfully."
echo "Tarball pathname: ${imovo_config_new_tarballs_location}/gtksourceview-${version}.tar.xz"
