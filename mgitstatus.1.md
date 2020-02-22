% MGITSTATUS(1)
% Ferry Boender
% Jul 2019

# NAME

mgitstatus – Show uncommitted, untracked and unpushed changes for multiple Git repos.

# SYNOPSIS

 **mgitstatus** [**--version**] [**-w**] [**-e**] [**-f**] [**--no-X**] [**-d/--depth**=2] [**DIR** [**DIR**]...]

# DESCRIPTION

**mgitstatus** shows uncommited, untracked and unpushed changes in multiple
Git repositories.  By default, **mgitstatus** scans two directories deep. This
can be changed with the `-d` (`--depth`) option.  If **DEPTH** is 0, the scan
is infinitely deep.

mgitstatus shows:

- **Uncommitted changes** if there are unstaged or uncommitted changes on the
  checked out branch.

- **Untracked files** if there are untracked files which are not ignored.

- **Needs push (BRANCH)** if the branch is tracking a (remote) branch which is
  behind.

- **Needs upstream (BRANCH)** if a branch does not have a local or remote
  upstream branch configured. Changes in the branch may otherwise never be
  pushed or merged.

- **Needs pull (BRANCH)** if the branch is tracking a (remote) branch which is
  ahead. This requires that the local git repo already knows about the remote
  changes (i.e. you've done a fetch), or that you specify the -f option.
  mgitstatus does NOT contact the remote by default.

- **X stashes** if there are stashes.

Since there are a lot of different states a git repository can be in,
mgitstatus makes no guarantees that all states are taken into account.

# OPTIONS

**--version**
:   Show version

**-w**
:   Warn about dirs that are not Git repositories

**-e**
:   Exclude repos that are 'ok'

**-f**
:   Do a 'git fetch' on each repo (slow for many repos)

**-c**
:   Force color output (preserve colors when using pipes)

**-d, --depth=2**
:   Scan this many directories deep. Default is 2. If **0**, the scan is infinitely deep

You can limit output with the following options:

**--no-push**
:   Do not show branches that need a push.

**--no-pull**
:   Do not show branches that need a pull.

**--no-upstream**
:   Do not show branches that need an upstream.

**--no-uncommited**
:   Do not show branches that have unstaged or uncommitted changes.

**--no-untracked**
:   Do not show branches that have untracked files.

**--no-stashes**
:   Do now show stashes

**--no-branch**
:   Do now show current branch

# EXAMPLES

The following command scans two directories deep for Git projects and shows
their status:

    $ mgitstatus 
    ./fboender/sla: ok 
    ./fboender/multi-git-status: Needs push (master) Untracked files
    ./other/peewee: ok 

To scan deeper (three dirs instead of two) in the current dir:

    $ mgitstatus -d 3

The following command scans three levels deep in `/opt/deploy/` and hides
repos that are 'ok'. It does not show stashes:

    $ mgitstatus -e --no-stashes -d 3 /opt/deploy

To ignore a repo, set the `mgitstatus.ignore` git configuration option for
that repo to `true`. E.g.:

    $ cd stupidrepo
    $ git config --local mgitstatus.ignore true

# COPYRIGHT

Copyright 2016-2020, Ferry Boender.

Licensed under the MIT license. For more information, see the LICENSE.txt file.
