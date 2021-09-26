#!/usr/bin/env bash

get_script_directory() {
	script_dir=`dirname "$BASH_SOURCE"`
	absolute_script_dir=`cd "$script_dir" && pwd`
	echo "$absolute_script_dir"
}

script_directory="`get_script_directory`"

pushd "${script_directory}/../../utils/"
source ./imovo-utils-setup-env.sh 'devhelp'
popd

${imovo_config_prefix}/devhelp/bin/devhelp "$@"
