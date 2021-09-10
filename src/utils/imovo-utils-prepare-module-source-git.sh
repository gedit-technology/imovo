#!/bin/sh

git_repo_name="$1"
git_ref="$2"

git_repos_location=~/comp/gedit-org
imovo_tmp_prefix=~/.imovo/_tmp

rm -rf "${imovo_tmp_prefix}"
mkdir -p "${imovo_tmp_prefix}"

cp -r "${git_repos_location}/${git_repo_name}" "${imovo_tmp_prefix}/"

pushd "${imovo_tmp_prefix}/${git_repo_name}/"
git clean -xdf
git reset --hard HEAD
git checkout -b imovo "${git_ref}"
popd
