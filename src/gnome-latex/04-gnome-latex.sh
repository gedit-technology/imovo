#!/bin/sh

git_repos_cache_dir=~/.cache/imovo/git-repos
install_prefix=~/.imovo/gnome-latex

git_repo_remote_url='https://gitlab.gnome.org/Archive/gnome-latex.git'
git_repo_path="${git_repos_cache_dir}/gnome-latex"

if test ! -d "${git_repo_path}"
then
	mkdir -p "${git_repos_cache_dir}"
	pushd "${git_repos_cache_dir}"
	git clone "${git_repo_remote_url}" || exit 1
	popd
fi

pushd "${git_repo_path}"
git clean -xdf
git r
git checkout master

./autogen.sh --prefix="${install_prefix}" --enable-introspection --enable-vala || exit 1

popd
