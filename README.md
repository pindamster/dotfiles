## macOS setup

With [Homebrew](https://brew.sh/) on your `PATH`:

```sh
brew install tmux zsh-vi-mode uv
brew install --cask nikitabobko/tap/aerospace
./install
```

The installer initializes the Git submodules, links the Git, Vim, shared aliases,
AeroSpace, tmux, Prezto, and Zsh configs into your home directory, and installs
the Vim plugins. It does not replace existing configs or clean your home directory.
Put your machine-specific Git name and email in `~/.gitconfig.local`.

Use `uv` to manage Python versions and project environments as needed. Launch
AeroSpace separately and grant macOS Accessibility permission when prompted.

Other configs in the repo are not installed automatically. For the legacy iTerm2
config, use General → Preferences → Load file here.
