#!/bin/sh

pushd ../../utils/
source ./imovo-utils-setup-env.sh 'devhelp'
popd

${imovo_config_prefix}/devhelp/bin/devhelp "$@"
