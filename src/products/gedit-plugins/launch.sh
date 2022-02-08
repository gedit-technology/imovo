#!/usr/bin/env bash

get_script_directory() {
	script_dir=`dirname "$BASH_SOURCE"`
	absolute_script_dir=`cd "$script_dir" && pwd`
	echo "$absolute_script_dir"
}

script_directory="`get_script_directory`"

pushd "${script_directory}/../../utils/"
source ./imovo-utils-setup-env.sh 'gedit-plugins'
popd

# gedit from Imovo is picked first, since the PATH is adapted by setup-env.sh.
gedit "$@"
