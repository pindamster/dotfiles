## macOS setup

With [Homebrew](https://brew.sh/) on your `PATH`:

```sh
brew install tmux zsh-vi-mode uv
brew install --cask nikitabobko/tap/aerospace
./install
```

The installer initializes the Git submodules, links the Git, Vim, shared aliases,
AeroSpace, tmux, Prezto, and Zsh configs and the shared agent instructions into
your home directory, and installs the Vim plugins. It does not replace existing
configs or clean your home directory.
Put your machine-specific Git name and email in `~/.gitconfig.local`.

Use `uv` to manage Python versions and project environments as needed. Launch
AeroSpace separately and grant macOS Accessibility permission when prompted.

The shared `agents/AGENTS.md` is linked at `~/.config/opencode/AGENTS.md`.
`opencode/cli.json` is a snapshot for manual setup; the installer leaves the
live OpenCode CLI settings alone.

Other configs in the repo are not installed automatically. For the legacy iTerm2
config, use General → Preferences → Load file here.
