# linux_rice

## Cool tools

* [tig](https://jonas.github.io/tig/)
  * `ncurses`-based interface for git, very useful for viewing previous commits etc. (has `vim` bindings)
* [git-smash](https://github.com/anthraxx/git-smash)
  * for adding changes to previous commits (i.e. fixing a MR)
* [git-chain](https://github.com/Shopify/git-chain)
  * for rebasing chained MRs
  * [alternative](https://andrewlock.net/working-with-stacked-branches-in-git-is-easier-with-update-refs/)
* [delta](https://github.com/dandavison/delta)
  * a better `git diff`
* [zed](https://zed.dev/)
  * VS Code in Rust, basically
  * install `pyright` inside virtualenv if you want Zed to recognize packages installed in venv
    * pyright can be installed globally, but then Zed doesn't see the packages in venv, it only sees the globally installed ones
