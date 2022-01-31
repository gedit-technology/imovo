#!/bin/sh

if test $# -ne 2
then
	echo "$0: wrong number of arguments." 1>&2
	exit 1
fi

git_repo_name="$1"
git_ref="$2"

source ./imovo-utils-global-imovo-config.sh

mkdir -p "${imovo_config_git_repos_cache_location}" || exit 1

git_repo_orig_dir="${imovo_config_git_repos_orig_location}/${git_repo_name}"
git_repo_cache_dir="${imovo_config_git_repos_cache_location}/${git_repo_name}"
if test ! -d "${git_repo_cache_dir}"
then
	rm -rf "${git_repo_cache_dir}" || exit 1

	pushd "${imovo_config_git_repos_cache_location}" || exit 1
	git clone "${git_repo_orig_dir}" || exit 1
	popd
fi

# TODO: handle git submodules.

#pushd "${imovo_config_tmp_dir}/${git_repo_name}/"
#git clean -xdf || exit 1
#git reset --hard HEAD || exit 1
#git checkout -b imovo "${git_ref}" || exit 1
#popd
