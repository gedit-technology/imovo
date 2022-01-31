#!/bin/sh

if test $# -ne 2
then
	echo "$0: wrong number of arguments." 1>&2
	exit 1
fi

git_repo_name="$1"
git_ref="$2"

source ./imovo-utils-global-imovo-config.sh

./imovo-utils-prepare-tmp-dir.sh

cp -r "${imovo_config_git_repos_location}/${git_repo_name}" "${imovo_config_tmp_dir}/" || exit 1

pushd "${imovo_config_tmp_dir}/${git_repo_name}/"
git clean -xdf || exit 1
git reset --hard HEAD || exit 1
git checkout -b imovo "${git_ref}" || exit 1
popd
