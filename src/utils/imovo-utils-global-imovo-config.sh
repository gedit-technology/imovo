#!/bin/sh

imovo_config_git_repos_orig_location=~/comp/repos

imovo_config_prefix=~/.imovo
imovo_config_tarballs_location="${imovo_config_prefix}/_tarballs"
imovo_config_tmp_dir="${imovo_config_prefix}/_tmp"

# An automatic build (from imovo), for a git repo, can be done in the following
# location. So not in imovo_config_tmp_dir, because the latter is emptied to
# build certain modules.
imovo_config_git_repos_cache_location="${imovo_config_prefix}/_git_repos_cache"
