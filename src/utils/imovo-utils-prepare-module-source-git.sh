#!/bin/sh

git_repo_name="$1"
git_ref="$2"

source ./imovo-utils-global-imovo-config.sh

rm -rf "${imovo_config_tmp_dir}"
mkdir -p "${imovo_config_tmp_dir}"

cp -r "${imovo_config_git_repos_location}/${git_repo_name}" "${imovo_config_tmp_dir}/"

pushd "${imovo_config_tmp_dir}/${git_repo_name}/"
git clean -xdf
git reset --hard HEAD
git checkout -b imovo "${git_ref}"
popd
