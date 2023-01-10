#!/bin/sh

if test $# -ne 1
then
	echo "$0: wrong number of arguments." 1>&2
	exit 1
fi

product="$1"

source ../utils/imovo-utils-global-imovo-config.sh
install_prefix="${imovo_config_prefix}/${product}"

# Install from a tarball, it's easier because there is the `./configure` script,
# while in the git repo it's missing (like all standard Autotools projects).

tarball_filename='autoconf-archive-2022.09.03.tar.xz'

pushd ../utils/
./imovo-utils-prepare-module-source-tarball.sh "${tarball_filename}" || exit 1
popd

pushd "${imovo_config_tmp_dir}/autoconf-archive-2022.09.03/" || exit 1
./configure --prefix="${install_prefix}" || exit 1
make || exit 1
make install || exit 1
make check || exit 1
popd
