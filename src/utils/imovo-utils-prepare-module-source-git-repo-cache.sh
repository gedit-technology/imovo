#!/bin/sh

if test $# -ne 2
then
	echo "$0: wrong number of arguments." 1>&2
	exit 1
fi

git_repo_name="$1"

# WARNING: if specifying a branch, add 'origin': 'origin/branch_name'
git_ref="$2"

# A previous implementation did just a cp -r of the whole repo each time.
# Easier but far less efficient for big repos.

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

pushd "${git_repo_cache_dir}" || exit 1
git clean -xdf || exit 1
git reset --hard HEAD || exit 1
git checkout main || git checkout master || exit 1
git pull || exit 1

# Capitalized "Imovo", because I never use branch names with capital letters.
# Note the -B (not -b) option, to avoid error messages, in fact
# `git branch -D Imovo` also gives an error message if the Imovo branch doesn't
# exist.
git checkout -B Imovo || exit 1

# See the WARNING above about taking the git_ref parameter. If 'origin' is not
# specified, and if the branch already exists locally, it'll move to the old,
# not up-to-date branch.
# Could be improved, doing some cleanup beforehand etc (removing all local
# branches).
git reset --hard "${git_ref}" || exit 1

# Submodules handling. It's done here, because it needs to be done at git_ref.
# Optimizations are perhaps possible. But it does the job.
# Note: doesn't work with "active = false" in the .gitmodules file, don't know
# why, but I don't currently need it.

git submodule deinit --force --all || exit 1
# Now, if the submodules were previously initialized and checked out, the
# .git/modules/ are still there.

git submodule init || exit 1

# --recursive could be added for nested git submodules, but not tested, I don't
# currently need it.
git submodule update || exit 1

popd
