#!/bin/sh

git_repos_cache_dir=~/.cache/imovo/git-repos
install_prefix=~/.imovo/gedit

git_repo_remote_url='https://gitlab.gnome.org/GNOME/gedit.git'
git_repo_path="${git_repos_cache_dir}/gedit"
git_repo_commit='89c016881609fc892f4e0d916988c44aa0f1fbce'

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
git branch -D imovo
git checkout -b imovo "${git_repo_commit}"

mkdir build
pushd build/

export PKG_CONFIG_PATH="${install_prefix}/lib64/pkgconfig"

# At least for g-ir-scanner.
export XDG_DATA_DIRS="${install_prefix}/share:${XDG_DATA_DIRS}"

meson --prefix "${install_prefix}" || exit 1
ninja || exit 1
ninja test || exit 1 # before install
ninja install || exit 1
ninja test || exit 1 # after install

popd
popd
if pkg-config --modversion gedit
then
	echo OK
else
	echo KO
fi
