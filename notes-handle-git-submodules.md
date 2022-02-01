notes-handle-git-submodules
===========================

```
git pull
# The .gitmodules text file has correctly been updated.
# But not the submodules themselves. A bit a mess.
# There is maybe a git pull high-level option to update the submodules as well.

git res
git clean -xdf
# still not sufficient.

git submodule update --init
# still not sufficient.

==> Will read the manpages, instead of trying lots of commands.
```

Worst case, I can re-add and re-use the old and dumb utils script for git, which
does a full copy each time instead of doing git pull.
