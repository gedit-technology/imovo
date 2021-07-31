#!/bin/sh

git_repos_cache_dir=~/.cache/imovo/git-repos
install_prefix=~/.imovo/gnome-latex

git_repo_remote_url='https://github.com/swilmet-archives/tepl.git'
git_repo_path="${git_repos_cache_dir}/tepl"

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

mkdir build
pushd build/

export PKG_CONFIG_PATH="${install_prefix}/lib64/pkgconfig"

# At least for g-ir-scanner.
export XDG_DATA_DIRS="${install_prefix}/share:${XDG_DATA_DIRS}"

export LD_LIBRARY_PATH="${install_prefix}/lib64"

meson --prefix "${install_prefix}" || exit 1
ninja || exit 1
ninja test || exit 1 # before install
ninja install || exit 1
ninja test || exit 1 # after install

popd
popd
if pkg-config --modversion tepl-6
then
	echo OK
else
	echo KO
fi
