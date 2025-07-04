# Cool tools and utilities

## Shells

* [nushell](https://www.nushell.sh/) - data-oriented shell

## Editors

* [zed](https://zed.dev/) - basically VS Code in Rust

## CLI Tools

* [zoxide](https://github.com/ajeetdsouza/zoxide) - smart `cd`, easier jumping to folders/projects
* [ripgrep](https://github.com/BurntSushi/ripgrep) - better, faster and more user-friendly `grep`
* [fd](https://github.com/sharkdp/fd) - better, faster and more user-friendly `find`
* [tealdeer-rs](https://github.com/tealdeer-rs/tealdeer) - user-friendly `man`
* [btop](https://github.com/aristocratos/btop) - better `htop`
* [sd](https://github.com/chmln/sd) - better, faster and more user-friendly `sed`
  * for example instead of `sed ':a;N;$!ba;s/\n/,/g'` do `sd '\n' ','` (change newlines to commans)
* [hyperfine](https://github.com/sharkdp/hyperfine) - CLI benchmark tool (better than `time <command>`), many options
* [ouch](https://github.com/ouch-org/ouch) - CLI compression/decompression tool for many formats

## Git

* [git-smash](https://github.com/anthraxx/git-smash) - for adding changes to previous commits (i.e. fixing a MR)
* [git-chain](https://github.com/Shopify/git-chain) - for rebasing chained MRs
* [delta](https://github.com/dandavison/delta) - a better `git diff`

## Misc

* [zellij](https://zellij.dev/) - better `tmux`, 0 configuration needed
