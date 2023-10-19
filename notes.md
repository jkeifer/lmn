Uses a config file ~/.lmn/config or ~/.config/lmn/config
Default template directory ~/.lmn/templates/ or ~/.config/lmn/templates

Each `lmn` dir represents an environment
Envs can be nested
Create a new dir and run `lmn init` in it

`init [ template ]`
  -> create a .lmn dir in the current directory.
  -> copy all files from the specified template directory recursively
      -> supports a special arg `[empty]` to not use a template
  -> maybe templates can be git repos like flakes support? (not for MVP)
  (what else is required here? I think it should be a required param...

`lmn template` provides a set of commands for administering templates
  -> list
  -> goto (cd to template dir)

`lmn status` command will look in current dir for nested git repos,
  checks their dir names and remotes

lmn wraps git status (maybe, not for MVP)
  -> will output `lmn status` when running git status
  -> git repos that are not tracked are listed as untracked
  -> git repos that are changed are listed as dirty

`lmn add` to add/update a repo in the lmn manifest/gitignore
  -> manifest tracks clone dir name and remotes
      -> ini format: easy to read, easy to parse with python stdlib
         (could also consider toml; seems nicer but parsing?)
  -> gitignore has clone dir name to prevent adding to lmn repo
`lmn rm` to remove a repo from the lmn manifest/gitignore

status is recursive
  -> check all child envs if dirty
  -> but do not recurse into those that are separate git repos
  (so check `if git: ...; else if lmn: ...`)


commands:
  init
  status
  template
    list (ls)
    resolve
    new (mk)
    copy (cp)
  repo
    track (add)
    untrack (rm)


lmn hooks:
* post-init
* pre-add
* post-add
* pre-rm
* post-rm

lmn works best with direnv and nix-direnv to autoload your env on entry.

Multiple envs in one dir?
  -> should the env stuff go inside the .lmn dir?
  -> init is like git init creating a master branch,
     it creates a default env named for the current dir?
       -> can we export the env name as a path of root dix to env name?
       -> if so, then we can call it main by default?
  -> lmn env lists all envs in a dir
       -> add [ template ]
       -> rename
  -> user can "check out" an env to activate it
      -> contents of local dir updated same way git does when changing branches?


git-like plugin arch that will simply exec things prefixed with lmn-
so users can create their own lmn commands like `lmn do-something` by
having an executable called `lmn-do-something` on their path.


new idea
--------

lmn is a wrapper around git commands
can use lmn to build a "file" and add that to git
can use git cat to see "files"

So use lmn to build files for all repos.
Check those in.
Support ignores.
Show diffs.
Push/pull/clone to/from remote.
Still use git for env management. lmn is just for repos.
