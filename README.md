# 🍋 `lmn`: A directory-based environment manager

When life gives you lmn make software.

**This is currently just an idea, and doesn't really exist yet. Sorry.**

[![lmn-hackage-img]][lmn-hackage]
[![lmn-stackage-nightly-img]][lmn-stackage-nightly]


## Purpose

`lmn` intends to provide a means of creating collections of project
environments declared via nix flakes and versioned in git.
`lmn` is not just to specify what packages are avialble and what
`$INSERT_INTERPRETED_LANGUAGE_HERE` version is running, but to
also provide a way to track and manage all repos cloned into the
environments.

I find it common for developers to require a significant number of
repositories to be cloned locally, and each requires specific
environmental setup. Figuring out what repos these are and how to
configure development environments for each can be rather costly.
In the case of system failure or migrating to new machines, doing
all this work over again is often beyond painful. Not only that,
but regular iteration and changes can break things in ways that
are difficult to resolve.

Instead of checking out repos and setting up environments ad hoc,
what if you had a way to manage all this in a highly configurable
and version-control-friendly manner? What if you could even share
these environments with teammates to save them time in setup?

Enter `lmn`. `lmn` provides a framework and cli utilities to ensure
environments and repos are version controlled and reproducible.
`lmn` flips the normal env paradigm on its head, putting your code
inside your environments, rather than keeping your envs external to
your project.


## Features

* Uses directories to represent environments built from flake.nix declarations.
* Environments can be declared hierarchically and arbitrarily nests.
* direnv provides the (de)activation mechanism.
* Extensible via a collection of event hooks.
* Native support for nested git repos.


## How to use it

Frankly, I don't know yet. It doesn't really do much yet anyway.


Uses a config file ~/.lmn/config or ~/.config/lmn/config
Default template directory ~/.lmn/templates/ or ~/.config/lmn/templates

Each `lmn` dir represents a workspace.
Workspaces can be nested.
Create a new dir and run `lmn init` in it.


lmn commands:
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


## `lmn`?

> `lmn` -> lem·on | ˈlemən |
    A juicy oval citrus yellow when ripe, highly acidic and often sour.

Still not sure? Try some `lmn ade`.

Thanks @aidakeifer.

---

Project skeleton from [template-haskell].


[lmn-hackage-img]: https://img.shields.io/hackage/v/lmn
[lmn-hackage]: http://hackage.haskell.org/package/lmn
[lmn-stackage-nightly-img]: https://stackage.org/package/lmn/badge/nightly
[lmn-stackage-nightly]: https://stackage.org/nightly/package/lmn
[template-haskell]: https://github.com/jonascarpay/template-haskell
