#!/bin/sh

pushd ../../utils/
source ./imovo-utils-setup-env.sh 'devhelp'
popd

"${install_prefix}"/bin/devhelp "$@"
