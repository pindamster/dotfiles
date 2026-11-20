# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## What This Is

Personal dotfiles managed with **Dotbot**. Each top-level directory groups configs for one tool, and `install.conf.yaml` declares symlinks from `~` into the repo.

## Install / Apply Changes

```bash
./install            # runs dotbot: updates submodules, creates symlinks, installs vim plugins
```

There is no build, lint, or test step. The only command is `./install`. After editing any config file the change is live immediately (files are symlinked), but run `./install` after changing `install.conf.yaml` or adding new link targets.

## Managed Symlinks

| Symlink | Source dir | Tool |
|---------|-----------|------|
| `~/.zshrc`, `~/.zpreztorc`, `~/.zprezto` | `zsh/`, `prezto/` | Zsh + Prezto |
| `~/.aliases.sh` | `aliases/` | Shared shell aliases loaded by Zsh |
| `~/.vimrc`, `~/.gvimrc`, `~/.vim` | `vim/` | Vim + Vundle |
| `~/.tmux.conf` | `tmux/` | tmux (prefix: Ctrl-A, vi keys) |
| `~/.gitconfig`, `~/.git-completion.*` | `git/` | Git |
| `~/.aerospace.toml` | `aerospace/` | AeroSpace tiling WM |

Ghostty, Herdr, Claude Code, SSH, iTerm2, and VS Code configs are kept for reference or manual setup, not linked by the installer.

Claude Code **skills are not in this repo**. They live in `pindamster/claude-skills`, which is cloned directly to `~/.claude/skills` (that path must be a real directory, not a symlink -- see `claude/README.md`).

`~/.config` is deliberately **not** linked as a whole directory so other tools can write into it.

## Repo Layout

```
install.conf.yaml   # Dotbot config -- the source of truth for managed symlinks
install             # Dotbot bootstrap script
dotbot/             # Submodule: github.com/anishathalye/dotbot
prezto/.zprezto      # Submodule: github.com/sorin-ionescu/prezto
vim/.vim/bundle/    # Gitignored; populated by Vundle at install time
```

Config directories (`aerospace/`, `aliases/`, `claude/`, `git/`, `tmux/`, `vim/`, `vscode/`, `zsh/`) each mirror the home-directory layout so dotbot can link them directly.

`vscode/` contains `settings.json`, `keybindings.json`, and `extensions.sh` but is **not managed by dotbot** -- these are tracked for reference/manual setup only.

## Git Submodules

Three top-level submodules (Dotbot, Prezto, Vundle.vim). The `./install` script initializes them recursively before linking.

## Key Conventions

- Shell: Zsh is the primary shell. Bash uses the system defaults.
- Python: Use `uv` for Python versions and project environments; no global Python startup files are linked.
- Vim plugins: Managed by Vundle (not vim-plug or lazy.nvim). Add plugins to `.vimrc` then run `vim +PluginInstall +qall`.
- tmux prefix: `Ctrl-A` (not the default `Ctrl-B`).
- AeroSpace workspaces: Named workspaces (term, code, browse, comms, private, mail, track) with vim-style hjkl navigation.
- Dotbot must stay reasonably current: versions before v1.20 vendor a PyYAML that crashes on Python 3.10+ (`module 'collections' has no attribute 'Hashable'`).
